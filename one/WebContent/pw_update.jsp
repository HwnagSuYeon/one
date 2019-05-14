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
	<!-- 비밀번호 수정 -->
	<main class="main_wrap">
		<div class="main_position">
			<h1 class="title">비밀번호 수정</h1>
			<form class="form_content">

				<div class="contet_wrap">
					<div class="content">
						<input class="input_val now_pw_val" type="password" placeholder="현재 비밀번호 입력">
					</div>
					<span class="err_msg"></span>
					<div class="margin id_margin"></div>
				</div>
				
				<div class="contet_wrap">
					<div class="content">
						<input class="input_val pw_val" type="password" placeholder="새 비밀번호 입력">
					</div>
					<span class="err_msg"></span>
					<div class="margin"></div>
				</div>

				<div class="contet_wrap">
					<div class="content">
						<input class="input_val pwck_val" type="password" placeholder="새 비밀번호 한번더 입력">
					</div>
					<span class="err_msg"></span>
					<div class="margin"></div>
				</div>
				
				<button class="join_btn" type="submit" style="color: white;" disabled="disabled">수정</button>
			</form>
		</div>
	</main>
	<%@ include file="include/footer.jsp"%>
	<script type="text/javascript" src="js/validation.js"></script>
	<!-- 입력칸 클릭시 밑줄 색 바뀌는 기능 -->
	<script type="text/javascript">
		$(document).ready(function() {
			//nowPw, pw, pwck의 값이 유효한지 확인하기 위한 전역변수
			var ck_val = "";
			
			//인풋태그 클릭시 밑줄색 바뀜
			$('.input_val').focus(function(){
				$(this).parent().css('border-bottom', '1.3px solid #f9c00c');
			});
			$('.input_val').blur(function(){
				$(this).parent().css('border-bottom', '1.3px solid rgb(238,238,238)');
			});
			
			//Ajax를 활용하여 입력한 비밀번호와 현재 유저의 비밀번호가 일치하는지 확인
			$('.now_pw_val').blur(function () {
				var nowPw = $('.now_pw_val').val(); // 입력받은  현재 비밀번호
				var nowId = "${sessionScope.loginUser.id}"; //session에 있는 현재 id(pw만 비교하면 중복 pw가 있을 수 도 있기때문에)
				if (nowPw != null || nowPw.length != 0) {
					$.ajax({
						url: 'pwCheck.one',
						type: 'POST',
						dataType: 'json',
						data: 'id='+nowId+'&pw='+nowPw,
						success: function (data) {
							if(data.flag) {
								$(".err_msg").eq(0).text("유저 정보와 비밀번호가 일치합니다")
								   .css("display","block")
					 			   .css("color","dodgerblue")
					 			   .css("text-align","right");
							} else {
								$(".err_msg").eq(0).text("유저 정보와 비밀번호가 일치하지 않습니다")
								   .css("display","block")
					 			   .css("color","tomato")
					 			   .css("text-align","right");
							}
						},
						error: function () {
							alert("system error!");
						}
					});
				}
			});
			
			// 새 비밀번호 유효성 검사
			$(".pw_val").blur(function() {
				var memPw = $.trim($('.pw_val').val());
				var memRpw = $.trim($('.pwck_val').val());
				var checkResult = joinValidate.checkPw(memPw, memRpw);
				// 아이디값을 가져가 validation에서 검사를 실행.
				if(checkResult.code != 0) {
					$(".err_msg").eq(1).text(checkResult.desc)
									   .css("display","block")
						 			   .css("color","tomato")
						 			   .css("text-align","right");
					return false;
				} else {
					$(".err_msg").eq(1).text(checkResult.desc)
									   .css("display","block")
						 			   .css("color","dodgerblue")
						 			   .css("text-align","right");
					return true;
				}
			});
			
			//새 비밀번호 한번더입력 유효성 검사
			$('.pwck_val').blur(function () {
				var memPw = $.trim($('.pw_val').val());
				var memRpw = $.trim($('.pwck_val').val());
				var checkResult = joinValidate.checkPw(memPw, memRpw);
				// 아이디값을 가져가 validation에서 검사를 실행.
				if(checkResult.code != 0) {
					$(".err_msg").eq(2).text(checkResult.desc)
									   .css("display","block")
						 			   .css("color","tomato")
						 			   .css("text-align","right");
					return false;
				} else if (pw != rpw) {
					$(".err_msg").eq(2).text("입력하신 비밀번호와 일치하지 않습니다!")
							   			 .css("display","block")
							   			 .css("color","tomato")
							   			 .css("text-align","right");
					return false;
				} else if (pw == rpw) {
					$(".err_msg").eq(2).text("입력하신 비밀번호와 일치합니다.")
										 .css("display","block")
							 			 .css("color","dodgerblue")
							 			 .css("text-align","right");
				}
				
				
				
				
				
				/* var pw = $.trim($(".pw_val").val());
				var rpw = $.trim($(this).val());
				
				var regEmpty = /\s/g; //공백문자 정규식
				var pwReg = RegExp(/^[a-zA-Z0-9]{4,12}$/); //비밀번호 정규식
				if (pw != rpw) {
					$(".err_msg").eq(2).text("입력하신 비밀번호와 일치하지 않습니다!")
					   			 .css("display","block")
	 				   			 .css("color","tomato")
	 				   			 .css("text-align","right");
					return false;
				} else if (pw == null || pw.length == 0){
					$(".err_msg").eq(2).text("필수 입력정보입니다")
						   			   .css("display","block")
						   			   .css("color","tomato")
						   				 .css("text-align","right");
				} else {
					$(".err_msg").eq(2).text("입력하신 비밀번호와 일치합니다.")
								 .css("display","block")
					 			 .css("color","dodgerblue")
					 			 .css("text-align","right");
				} */
			});
			
			
		});
	</script>
</body>
</html>