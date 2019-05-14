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
				<h1 class="title">아이디로 로그인</h1>
				<form class="form_content">
					<div class="email">
						<div class="email_text">
							<input class="email_val" type="text" placeholder="ID입력">
						</div>
						<div class="email_margin"></div>
					</div>
					<div class="password">
						<div class="password_text">
							<input class="password_val" type="password" placeholder="비밀번호입력">
						</div>
						<div class="pass_margin"></div>
						<span class="modal_err_msg"></span>
					</div>
					<div class="pass_margin"></div>
					<button class="login_btn" type="button" >로그인</button>
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
					
					
					
					<!-- 이제부터 if문을 쓰겠다. c:choose를 반드시 써야 when과 otherwise를 쓸 수 있다. -->
					<!-- when: if와 같은 역할, test안에 조건문을 쓴다. -->
					<!-- 아래의 코드중 조건(test)은 다음과 같다. sessionScope에서 loginUser정보를 가져오는데, 그 값이 비어있으면(empty함수)c:when을 타고 아니면 c:otherwise를 탄다. -->
					<!-- else와 같은 역할  -->
					
					<c:choose> 
						<c:when test="${empty sessionScope.loginUser}"> 
							<a href="#" class="nav_wrap">
								<div style="display: inline-block;">
									<div class="nav_wrap_content">
										<span class="open_modal">로그인</span>
									</div>
								</div>
							</a>
							<span class="nav_bar"></span>
							<a href="${path}/join.one" class="nav_wrap">
								<div style="display: inline-block;">
									<div class="nav_wrap_content">
										<span>회원가입</span>
									</div>
								</div>
							</a>
						</c:when>
						
						
						<c:otherwise> 
							<a href="#" class="nav_wrap">
								<span class="userName_color">${ sessionScope.loginUser.name }</span>
								<span class="userId_color">(${ sessionScope.loginUser.id })</span>
								<span class="nav_bar"></span>
								<div style="display: inline-block;">
									<div class="nav_wrap_content">
										<a href="#" class="logout_btn">
											<span>로그아웃</span>
										</a>
									</div>
								</div>
							</a>
						</c:otherwise>
					</c:choose>
					
					
					
					
					<span class="nav_bar"></span>
					<a href="#" class="nav_wrap">
						<div style="display: inline-block;">
							<div class="nav_wrap_content">
								<label class="nav_dropbox_pointer">
									<span style="cursor: pointer; font-weight: normal;">마이페이지
										<i class="fas fa-chevron-down"></i>
									</span>
								</label>
								<!-- dropbox -->
								<div class="nav_dropbox">
									<a href="#" class="nav_dropbox_content">
										<div class="drop_backcolor">내 좋아요</div>
									</a>
									<a href="#" class="nav_dropbox_content">
										<div class="drop_backcolor">관심 클래스</div>
									</a>
									<a href="${path}/infoUpdate.one" class="nav_dropbox_content">
										<div class="drop_backcolor">내정보 수정</div>
									</a>
									<a href="#" class="nav_dropbox_content">
										<div class="drop_backcolor">회원탈퇴</div>
									</a>
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
			
			// 모달창에 로그인버튼 눌렀을 때 기능
			$('.login_btn').click(function () {
				var id = $.trim($('.email_val').val());
				var pw = $.trim($('.password_val').val());
				
				var regEmpty = /\s/g; //공백문자 정규식
				// null+공백체크 유효성 검사
				if (id==null||id.length == 0) {
					$('.modal_err_msg').text('필수정보 입니다')
								 .css('display','block');
					return false;
				} else if (id.match(regEmpty)){
					$('.modal_err_msg').text('공백없이 입력해주세요')
					 			 .css('display','block');
					return false;
				}
				
				if (pw==null||pw.length == 0) {
					$('.modal_err_msg').text('필수정보 입니다')
								 .css('display','block');
					return false;
				} else if (pw.match(regEmpty)){
					$('.modal_err_msg').text('공백없이 입력해주세요')
					 			 .css('display','block');
					return false;
				}
				$.ajax({
					url: "login.one",
					type: "POST",
					dataType: "json",
					data: "id="+id+"&pw="+pw,
					success: function(data) {
						if(data.message == "1") {
							location.reload();
						} else if (data.message == "-1") {
							$('.email_val').focus();
							$('.modal_err_msg').text('아이디 또는 비밀번호가 일치하지 않습니다!')
										 .css('display','block');
						}
					},
					error:function(){
						alert("system error♨♨♨")
					}
				});
			});
			
			$('.email_val').blur(function () {
				login_btn_color();
			});
			$('.password_val').blur(function () {
				login_btn_color();
			});
			// 로그인 모달창 내 id, pw값이 모두 들어있을 때 로그인버튼에 색 들어오게 만드는 기능
			function login_btn_color() {
				var id = $.trim($('.email_val').val());
				var pw = $.trim($('.password_val').val());
				
				var regEmpty = /\s/g;
				
				if (id==null||id.length == 0) {
					$('.modal_err_msg').text('필수정보 입니다')
								 .css('display','block');
					return false;
				} else if (id.match(regEmpty)){
					$('.modal_err_msg').text('공백없이 입력해주세요')
					 			 .css('display','block');
					return false;
				}
				
				if (pw==null||pw.length == 0) {
					$('.modal_err_msg').text('필수정보 입니다')
								 .css('display','block');
					return false;
				} else if (pw.match(regEmpty)){
					$('.modal_err_msg').text('공백없이 입력해주세요')
					 			 .css('display','block');
					return false;
				}
				$(".login_btn").css('cursor','pointer')
				   .css("background","#f9c00c")
				   .attr("disabled",false);
				$('.modal_err_msg').css('display','none');
			}
			
			//로그아웃 기능
			$('.logout_btn').click(function () {
				$.ajax({
					url: "logoutAjax.one",
					type: "POST",
					dataType: "json",
					success: function(data) {
						location.reload();
						// 로그아웃 성공시 새로고침
					},
					error:function(){
						alert("system error♨♨♨")
					}
				});
			});

			// 모달창 열고닫고
			$('.open_modal').click(function(){
				$('#modal_all').css('display' ,'flex');
			});
			$('.close_modal > i').click(function(){
				$('#modal_all').css('display', 'none');
			});
			
			// 고객센터 클릭시 드롭박스 출력
			var flag = 0;
			$('.nav_dropbox_pointer').click(function () {
				if(flag==0) {
					$('.nav_dropbox').css('display','block');
					flag = 1;
				} else {
					$('.nav_dropbox').css('display','none');
					flag = 0;
				}
				
			});
			
			
		});
	</script>
</body>
</html>