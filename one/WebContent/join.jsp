<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/join.css?v=1">
<title>Insert title here</title>
</head>
<body>
	<main class="main_wrap">
		<div class="main_position">
			<h1 class="title">아이디로 회원 가입</h1>
				<form class="form_content">

					<div class="contet_wrap">
						<div class="content">
							<input id="email_val" class="input_val email_val" type="text" placeholder="ID입력">
						</div>
						<div class="margin"></div>
					</div>

					<div class="contet_wrap">
						<div class="content">
							<input id="pw_val" class="input_val pw_val" type="password" placeholder="비밀번호 입력">
						</div>
						<div class="margin"></div>
					</div>

			<div class="contet_wrap">
				<div class="content">
					<input id="pwck_val" class="input_val pwck_val" type="password"
						placeholder="비밀번호 확인">
				</div>
				<div class="margin"></div>
			</div>

			<h1 class="title">상세정보 입력</h1>

			<div class="contet_wrap">
				<div class="content">
					<input id="name_val" class="input_val name_val" type="text" placeholder="이름">
				</div>
				<div class="margin"></div>
			</div>

			<div class="contet_wrap">
				<div class="content">
					<input id="phone_val" class="input_val phone_val" type="text" placeholder="핸드폰 번호">
				</div>
				<div class="margin"></div>
			</div>


			<div class="contet_wrap">
				<div class="content">
					<input class="input_val" type="text" id="sample6_postcode"
						placeholder="우편번호"> <input class="post_find" type="button"
						onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
				</div>
				<div class="margin"></div>
			</div>

			<div class="contet_wrap">
				<div class="content">
					<input class="input_val" type="text" id="sample6_address"
						placeholder="주소">
				</div>
				<div class="margin"></div>
			</div>

			<div class="contet_wrap">
				<div class="content">
					<input class="input_val" type="text" id="sample6_detailAddress"
						placeholder="상세주소">
				</div>
				<div class="margin"></div>
			</div>
			<!-- 약관동의박스 -->
			<div class="agree_all">
				<div class="ckbox_wrap">
					<div class="agree_wrap">
						<div>
							<input id="agree_btn" class="ck_box" type="checkbox">
							<label class="check_label" for="agree_btn"></label>
						</div>
						<div class="ck_content_wrap">
							<div>
								<span>
									<a class="ck_anker" href="constract.one?code=1" target="_blank_1">이용약관 </a>
								</span>,
								<span>
									<a class="ck_anker" href="constract.one?code=2" target="_blank_1">개인정보 처리방침 </a>
								</span>,
								<a class="ck_anker" href="constract.one?code=3" target="_blank_1">위치기반 서비스 이용약관</a>에 동의합니다.
							</div>

							<div class="ck_small_text">ONEforME는 만 14세 이상 회원만 이용 가능합니다.</div>
						</div>
					</div>
				</div>
			</div>

			<button class="join_btn" type="submit" color="white" disavled>가입하기</button>

		</form>
	</div>
	</main>
	<%@ include file="include/footer.jsp"%>
	
	<!-- daumpost api -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script>
		// 상세주소 적을때 필요한 기능임(다음 api)
		function sample6_execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                	addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                	addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    	extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                    	extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                    	extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                    
                } else {
                	document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
		}
		
	
	</script>

	<!-- 입력칸 클릭시 밑줄 색 바뀌는 기능 -->
	<script type="text/javascript">
		$(document).ready(function() {
			$('.input_val').focus(function(){
				$(this).parent().css('border-bottom', '1.3px solid #f9c00c');
			});
			$('.input_val').blur(function(){
				$(this).parent().css('border-bottom', '1.3px solid rgb(238,238,238)');
			});
			
			/* ajax를 활용한 유효성 검사 */
			$('#email_val').blur(function () {
				var id = $.trim($(this).val());
				// id에 값이 있는 경우에만 ajax동작
				if(id != "" || id.lenght !=0) {
					$.ajax({
						url: "idCheck.one",
						// 아이디가 중복된 아이디인지 아닌지 판단하는 역할(Action)
						type: "POST",
						// 포장한 데이터를 어떤 운송수단(어떻게 보낼지)으로 태워 보낼지 정하는 것이 타입.
						dataType: "json",
						// 어떤방식으로 데이터를 포장할지 정하는 것이 데이터타입.
						data: "id="+id,
						// 데이터는 id라는 이름을 붙여서 보냄. 쿼리스트링처럼 보내는 것을 나눠서 적은 것과 같다.
						success: function(data){
							// url에서 성공시 매개변수로 data를 받아와서 검사해주는 기능
						},
						error: function(){
							alert("System Error!");
						}
					});
				}
			});

			/* 동의버튼 유효성 체크 검사 */
			$('.check_label').click(function(){
				var ckAll = $('#agree_btn').is(':checked');
				
				if(ckAll == false) {
					$('.join_btn').css("background","#f9c00c")
								  .css("cursor","pointer");
				} else if (ckAll == true) {
					$('.join_btn').css("background","rgb(221,221,221)")
								  .css("cursor","not-allowed");
				}
			});
			/* 회원가입버튼 눌렀을 때 다음 페이지로 이동하게 유효성 검사 */
			/* location.href = "memberPlay.one"; */
			
			
		});
	</script>
</body>
</html>