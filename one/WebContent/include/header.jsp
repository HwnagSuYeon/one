<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 인클루드하는 방법. common.jsp가 그대로 들어온다. -->
<%@ include file="common.jsp"%>
<!-- 컨텍스트 루트: 프로젝트이름/css/ooo.css이런식으로 찾아가야하는데, 많은 이미지파일이 있다보면 뎁스를 찾기위해
../또는 ./와 같은 경로찾기를 해줘야한다. 또한 인클루드시 경로가 모두 깨지고 만다. 따라서 컨텍스트 루트를 사용하여 무조건 프로젝트 이름으로부터 시작해
찾아가는 경로를 설정해 주기 위해서 다음과 같이 컨텍스트 루트를 만들어준다. -->
<%-- <% String path = request.getContextPath(); %> --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- link로 css파일 연결  -->
<!-- path=> 컨텍스트 경로를 사용함. 곧 프로젝트 이름에서 무조건 시작하라는 것과 같다. -->
<!-- ${path}=> common.jsp에 들어있는 컨텍스트 경로를 사용. el태그를 사용했다. -->
<link rel="stylesheet" href="${path}/css/common.css?v=1">
<link rel="stylesheet" href="${path}/css/header.css?v=1">
<title>Insert title here</title>
</head>
<body>
	<!-- modal -->
	<div id="modal_all">
		<div id="modal_window">
			<div class="main_position">
				<span class="close_modal"><i class="fas fa-times"></i></span>
				<h1 class="title">이메일로 로그인</h1>
				<form class="form_content">
					<div class="email">
						<div class="email_text">
							<input class="email_val" type="email" placeholder="이메일 입력">
						</div>
						<div class="email_margin"></div>
					</div>
					<div class="password">
						<div class="password_text">
							<input class="password_val" type="password" placeholder="비밀번호입력">
						</div>
						<div class="pass_margin"></div>
					</div>
					<button class="login_btn" type="submit" color="white" disavled>로그인</button>
				</form>
				<div class="lost_pass">
					<a href="#">비밀번호를 잊어버리셨나요?</a>
				</div>
			</div>
		</div>
	</div>



	<!-- header -->
	<header>
		<div class="header_wrap">
			<a href="#" class="header_logo"><img src="${path}/images/logo.png"></a>
			<div class="search_warp">
				<div class="search_position">
					<form class="search_form">
						<i class="fas fa-search"></i> <input class="input_search"
							type="search" name="" placeholder="원데이클래스를 검색해 보세요">
					</form>
				</div>

			</div>
			<!-- header_nav -->
			<nav>
				<div class="header_nav">
					<a href="${path}/join.one" class="nav_wrap">
						<div style="display: inline-block;">
							<div class="nav_wrap_content">
								<span>회원가입</span>
							</div>
						</div>
					</a>
					<span class="nav_bar"></span> <a href="#" class="nav_wrap">
						<div style="display: inline-block;">
							<div class="nav_wrap_content">
								<span class="open_modal">로그인</span>
							</div>
						</div>
					</a> <span class="nav_bar"></span> <a href="#" class="nav_wrap">
						<div style="display: inline-block;">
							<div class="nav_wrap_content">
								<label class="nav_dropbox_pointer"> <span
									style="cursor: pointer; font-weight: normal;">고객센터 <i
										class="fas fa-chevron-down"></i>
								</span> <!-- dropbox -->
								</label>
								<div class="nav_dropbox">
									<a href="#" class="nav_dropbox_content"><div
											class="drop_backcolor">공지사항</div></a> <a href="#"
										class="nav_dropbox_content"><div class="drop_backcolor">자주
											묻는 질문</div></a> <a href="#" class="nav_dropbox_content"><div
											class="drop_backcolor">호스트 가입</div></a>
								</div>
							</div>
						</div>
					</a> 
					<span class="nav_bar"></span> <a href="#" class="nav_wrap">
						<div style="display: inline-block;">
							<div class="nav_wrap_content">
								<span>제휴문의</span>
							</div>
						</div>
					</a>
				</div>
			</nav>
		</div>
	</header>
	<script type="text/javascript">
		// 클릭시 div border-bottom색 변경
		$(document).ready(function() {
			$('.email_val').focus(function(){
				$('.email_text').css('border-bottom', '1.2px solid #f9c00c');
			});
			$('.email_val').blur(function(){
				$('.email_text').css('border-bottom', '1.2px solid rgb(238,238,238)');
			});
			$('.password_val').focus(function(){
				$('.password_text').css('border-bottom', '1.2px solid #f9c00c');
			});
			$('.password_val').blur(function(){
				$('.password_text').css('border-bottom', '1.2px solid rgb(238,238,238)');
			});


			// 모달창 열고닫고
			$('.open_modal').click(function(){
				$('#modal_all').css('display' ,'flex');
			});
			$('.close_modal > i').click(function(){
				$('#modal_all').css('display', 'none');
			});

		});
	</script>
</body>
</html>