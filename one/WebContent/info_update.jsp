<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/member_update.css?v=1">
<title>Insert title here</title>
</head>
<body>
	<!-- 회원가입내용 -->
	<main class="main_wrap">
		<div class="main_position">
			<h1 class="title">회원정보 수정</h1>
			<form action="infoUpdatePlay.one" method="POST" name="" class="form_content">
				<div class="contet_wrap">
					<div class="content">
						<input name="id" class="email_val" type="text" placeholder="ID 입력" readonly="readonly" value="${ sessionScope.loginUser.id }">
						<input class="post_find" id="pw_update_btn" type="button" value="비밀번호 변경">
					</div>
					<div class="margin id_margin"></div>
				</div>
				
				<div class="contet_wrap">
					<div class="content">
						<input name="name" class="input_val name_val" type="text" placeholder="이름" value="${ sessionScope.loginUser.name }">
					</div>
					<div class="margin"></div>
				</div>

				<div class="contet_wrap">
					<div class="content">
						<input name="phone" class="input_val phone_val" type="text" placeholder="핸드폰 번호" value="${ sessionScope.loginUser.phone }">
					</div>
					<div class="margin"></div>
				</div>
				

				<div class="contet_wrap">
					<div class="content">
						<input name="zipcode"  class="input_val" type="text" id="sample6_postcode" placeholder="우편번호" value="${ sessionScope.loginUser.zipcode }">
						<input class="post_find" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					</div>
					<div class="margin"></div>
				</div>

				<div class="contet_wrap">
					<div class="content">
						<input name="addr1" class="input_val" type="text" id="sample6_address" placeholder="주소" value="${ sessionScope.loginUser.addr1 }">
					</div>
					<div class="margin"></div>
				</div>

				<div class="contet_wrap">
					<div class="content">
						<input name="addr2" class="input_val" type="text" id="sample6_detailAddress" placeholder="상세주소" value="${ sessionScope.loginUser.addr2 }">
					</div>
					<div class="margin"></div>
				</div>
				
				
				<button class="update_btn" type="submit" color="white">회원정보 수정</button>
				<!-- 폼태그 내의 submit쓸 수 있는 방법
					 1. button type="submmit"
					 2. input type="submmit" vlue="회원수정"
					 3. button, input외에 모든 태그로 하는 방법
					 	ex) div id = "div_btn"
					 	제이쿼리로 서브밋을 반드시 해줘야함. -->
				
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
                    document.getElementById("sample6_detailAddress").value = extraAddr;
                    
                } else {
                	document.getElementById("sample6_detailAddress").value = '';
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
			
			$('#pw_update_btn').click (function () {
				location.href='pwUpdate.one';
			});
		});
	</script>
	<%@ include file="include/footer.jsp"%>
</body>
</html>