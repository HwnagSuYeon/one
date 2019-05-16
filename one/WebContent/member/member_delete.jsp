<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/member_update.css?v=1">
<title>Insert title here</title>
</head>
<body>
	<!-- modal -->
	<div id="delete_modal_all">
		<div id="delete_modal_window">
			<div class="delete_main_position">
				<span class="close_modal"><i class="fas fa-times close_icon"></i></span>
				<h1 class="delete_modal_title">정말로 탈퇴하시겠어요?</h1>
				<i class="far fa-sad-tear sad_icon"></i>
				<div class="btn_wrap">
					<button class="no_btn" type="submit" color="white" disavled>생각해볼게요</button>
					<button class="yes_btn" type="submit" color="white" disavled>탈퇴할게요</button>
				</div>
			</div>
		</div>
	</div>
	
		<!-- 회원탈퇴 내용  -->
	<main class="main_wrap">
		<div class="main_position">
			<h1 class="title">회원 탈퇴</h1>
			<form class="form_content">
				<div class="out_wrap">
					<div class="out_content_wrap">
						<span class="out_title">
						<span style="color: #f9c00c">"${sessionScope.loginUser.name}"님</span>회원탈퇴시<br> 아래의 조취가 취해집니다.
						</span><br>					
						<span class="out_content">
						1. 계정정보는 <span style="color: #f9c00c">"개인 정보 보호 정책"에 따라 60일간 보관(잠김)</span>되며,60일이 경과된 후에는 모든 개인정보는 완전히 삭제되어 더 이상 복구할 수 없습니다.<br>
						2. 작성된된 게시물은 삭제되지 않으며, 익명처리 후 <span style="color: #f9c00c">ONEforME로 소유권이 귀속</span>됩니다.<br>
						3.게시물 삭제가 필요한 경우에는<span style="color: #f9c00c">관리자(h_yeon1023@naver.com)로 문의해 주시길 바랍니다.</span>
						</span>
					</div>
				</div>


				<div class="contet_wrap">
					<div class="content">
						<input class="input_val pw_val" type="password" placeholder="현재 비밀번호 입력">
					</div>
					<span id="pwAjax" class="err_msg"></span>
				</div>
				
				
				
				<button class="out_btn" type="button" style="color: white;">회원 탈퇴</button>
				
			</form>
		</div>
	</main>
	
	
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
	<script type="text/javascript" src="js/validation.js"></script>
	<!-- 입력칸 클릭시 밑줄 색 바뀌는 기능 -->
	<script type="text/javascript">
		$(document).ready(function() {
			var state = false;
			//현재비밀번호, 입력비밀번호 일치확인
			$('.pw_val').blur(function () {
				var nowId ="${sessionScope.loginUser.id}";
				var nowPw = $(this).val();
				state = ajaxPwCheck(nowId, nowPw);
				
			});
			$('.out_btn').click(function () {
				if (state){
					$('#delete_modal_all').css('display','block');
				}else {
					$('.pw_val').focus();
				}
			});
			
			$('.input_val').focus(function(){
				$(this).parent().css('border-bottom', '1.3px solid #f9c00c');
			});
			$('.input_val').blur(function(){
				$(this).parent().css('border-bottom', '1.3px solid rgb(238,238,238)');
			});
			$('.yes_btn').click(function () {
				/* var id = "${sessionScope.loginuser.id}";
				location.href = "dropMember.one:id="+id; */
				
				location.href="dropMemberPlay.one"
			});

			// 모달창 닫기
			$('.close_icon').click(function(){
				$('#delete_modal_all').css('display', 'none');
			}); 
			$('.no_btn').click(function () {
				$('#delete_modal_all').css('display', 'none');
			});
		});
	</script>

</body>
</html>