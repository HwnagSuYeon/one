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
						<input class="input_val mow_pw_val" type="password" placeholder="현재 비밀번호 입력">
					</div>
					<div class="margin id_margin"></div>
				</div>
				
				<div class="contet_wrap">
					<div class="content">
						<input class="input_val pw_val" type="password" placeholder="새 비밀번호 입력">
					</div>
					<div class="margin"></div>
				</div>

				<div class="contet_wrap">
					<div class="content">
						<input class="input_val pwck_val" type="password" placeholder="새 비밀번호 한번더 입력">
					</div>
					<div class="margin"></div>
				</div>
				
				<button class="join_btn" type="submit" style="color: white;" disabled="disabled">수정</button>
			</form>
		</div>
	</main>
	<%@ include file="include/footer.jsp"%>
</body>
</html>