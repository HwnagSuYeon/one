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
			<form class="form_content" action="pwUpdatePlay.one" method="POST" id="pw_update_frm" name="pw_update_frm">

				<div class="contet_wrap">
					<div class="content">
						<input class="input_val now_pw_val" type="password" placeholder="현재 비밀번호 입력">
					</div>
					<span class="err_msg"></span>
					<div class="margin id_margin"></div>
				</div>
				
				<div class="contet_wrap">
					<div class="content">
						<input id="pw_val" class="input_val pw_val new_pw" type="password" placeholder="새 비밀번호 입력">
					</div>
					<span class="err_msg"></span>
					<div class="margin"></div>
				</div>

				<div class="contet_wrap">
					<div class="content">
						<input id="pwck_val" class="input_val pwck_val" type="password" placeholder="새 비밀번호 한번더 입력">
					</div>
					<span class="err_msg"></span>
					<div class="margin"></div>
				</div>
				
				<button id="pw_update_btn" class="join_btn" type="submit" style="color: white;">비밀번호 수정</button>
			</form>
		</div>
	</main>
	<%@ include file="include/footer.jsp"%>
	<script type="text/javascript" src="js/validation.js"></script>
	<!-- 입력칸 클릭시 밑줄 색 바뀌는 기능 -->
	<script type="text/javascript">
		$(document).ready(function() {
			var currentPw = false;
			var newPwEq = false;
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
								currentPw = true;
								$(".err_msg").eq(0).text("유저 정보와 비밀번호가 일치합니다")
								   .css("display","block")
					 			   .css("color","dodgerblue")
					 			   .css("text-align","right");
							} else {
								currentPw = false;
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
			$("#pw_val").blur(function() {
				var memPw = $.trim($('#pw_val').val());
				var memRpw = $.trim($('#pwck_val').val());
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
					if (memRpw != "" || memRpw.length != 0) {
						if(memPw == memRpw) {
							newPwEq = true;
							$(".err_msg").eq(2).text("비밀번호가 일치합니다")
											   .css("display","block")
					 						   .css("color","dodgerblue")
					 			 			   .css("text-align","right");
						} else {
							newPwEq = false;
							$(".err_msg").eq(2).text("입력하신 비밀번호가 일치하지 않습니다")
					   			 			   .css("display","block")
					   			 			   .css("color","tomato")
					   			 			   .css("text-align","right");
							return false;
						}
					}
					return true;
				}
				return false;
			});
			
			//새 비밀번호 한번더입력 유효성 검사
			$("#pwck_val").blur(function() {
				var memPw = $.trim($('#pw_val').val());
				var memRpw = $.trim($('#pwck_val').val());
				var checkResult = joinValidate.checkRpw(memPw, memRpw);
				// 아이디값을 가져가 validation에서 검사를 실행.
				if(checkResult.code != 0) {
					$(".err_msg").eq(2).text(checkResult.desc)
									   .css("display","block")
						 			   .css("color","tomato")
						 			   .css("text-align","right");
					return false;
				} else {
					$(".err_msg").eq(2).text(checkResult.desc)
									   .css("display","block")
						 			   .css("color","dodgerblue")
						 			   .css("text-align","right");
					if (memPw != "" || memPw.length != 0) {
						if(memPw == memRpw) {
							newPwEq = true;
							$(".err_msg").eq(2).text("비밀번호가 일치합니다")
											   .css("display","block")
					 						   .css("color","dodgerblue")
					 			 			   .css("text-align","right");
						} else {
							newPwEq = false;
							$(".err_msg").eq(2).text("입력하신 비밀번호가 일치하지 않습니다")
					   			 			   .css("display","block")
					   			 			   .css("color","tomato")
					   			 			   .css("text-align","right");
							return false;
						}
					}
					return true;
				}
				return false;
			});
			
			// 비밀번호 수정버튼 누르면 서브밋되도록
			$('#pw_update_btn').click(function () {
				var postPw = $('.now_pw_val').val();
				var newPw = $('.new_pw').val();
				// 최종체크
				//1. 현재비밀번호 = 유저정보 ->일치여부
				//전역변수 currentPw를 만들어 기본값을 false 부여
				if(!currentPw) {
					$('.now_pw_val').focus();
					return false;
				} else if (!newPwEq) { //2. 새 비밀번호 = 새 비밀번호 확인-> 일치여부
					$('.new_pw').focus();
					return false;
				} else if (postPw == newPw){ //3. 현재비밀번호 = 새 비밀번호-> 일치여부:현재비밀번호와 바꾼비밀번호가 같으면 쓸 수 없음
					$('.new_pw').focus();
					$('.err_msg').eq(1).text("현재비밀번호와 다르게 입력해주세요")
						 			   .css("display","block")
						 			   .css("color","tomato")
						 			   .css("text-align","right");
					return false;
				}
				
				$('#pw_update_frm').submit();
			});
		});
	</script>
</body>
</html>