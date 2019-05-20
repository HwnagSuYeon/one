<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/css/board_view.css?v=1">
<title>Insert title here</title>
</head>
<body>
	<section class="board_all">
		<main class="board_wrap">
			<h1 class="board_title">Q&A게시판</h1>
			<div class="board_view_all">
				<div class="white_back">
					<div class="title_wrap">
						<span class="view_content_title">안녕하세욧</span>
						<div class="user_name_all">
							<span class="user_name_wrap">작성자:<span class="user_name"> 꾸꾸링</span></span>
							<div class="btn_wrap">
								<button type="button" class="viewpage_btn text_update">게시글 수정</button>
								<button type="button" class="viewpage_btn text_delete" >게시글 삭제</button>
							</div>
						</div>
					</div>

					<span class="text_content">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span>
					<div class="add_file_wrap">
						<button type="button" class="viewpage_btn add_file">파일첨부</button>
						<span class="add_file_text">첨부된 파일이 없습니다 <i class="fas fa-times"></i></span>

					</div>

					<div class="board_all_wrpa"></div>
					<div class="viewpage_content">
						<div class="inner_wrap">
							<span class="date"><i class="far fa-clock"></i> 작성일 19-05-15</span>
							<span class="date"><i class="fas fa-sort-amount-up"></i> 1번째 게시글</span>
							<span class="view_heart"><i class="far fa-heart"></i> 좋아요 19</span>
							<span class="view"><i class="far fa-user"></i> 조회 20</span>
							<span class="comment_btn"><i class="far fa-comment-dots" style="color: white;"></i><a href="#"> 댓글쓰기</a></span>
						</div>
					</div>
				</div>
				<div class="like_btn">
					<span class="like_befor circle"><i class="far fa-heart"></i></span>
					<span class="like_after circle"><i class="fas fa-heart"></i></span>
				</div>
			</div>
			
			
			<!-- 댓글다는곳 -->
			<div class="cmt_area_all">
				<div class="cmt_view_area">
					<div class="user_img_wrap"><img class="user_img" src="../images/1.png"></div>
					<span class="bar"></span>
					<div class="cmt_view_cnt">
						
						<div class="cmt_title_wrap">
							<span class="cmt_title">꾸꾸링</span>
							<span class="cmt_date">2019-05-03 09:18:17 
								<a href="#" class="cmt_delete"><i class="fas fa-times"></i>
								</a>
							</span>
						</div>
						<div class="cmt_text">맛있는거 먹고싶어요ㅠ</div>
					</div>
				</div>

				<div class="cmt_view_area">
					<div class="user_img_wrap"><img class="user_img" src="../images/2.png"></div>
					<span class="bar"></span>
					<div class="cmt_view_cnt">
						
						<div class="cmt_title_wrap">
							<span class="cmt_title">도망간오이</span>
							<span class="cmt_date">2019-05-03 09:18:17 
								<a href="#" class="cmt_delete"><i class="fas fa-times"></i>
								</a>
							</span>
						</div>
						<div class="cmt_text">티라미수 조지러 가용</div>
					</div>
				</div>

				<div class="cmt_view_area">
					<div class="user_img_wrap"><img class="user_img" src="../images/6.png"></div>
					<span class="bar"></span>
					<div class="cmt_view_cnt">
						
						<div class="cmt_title_wrap">
							<span class="cmt_title">바람난가지</span>
							<span class="cmt_date">2019-05-03 09:18:17 
								<a href="#" class="cmt_delete"><i class="fas fa-times"></i>
								</a>
							</span>
						</div>
						<div class="cmt_text">난 간장게장 먹으러 갈거에요</div>
					</div>
				</div>



				<div class="login_area">
					<div class="login_area_wrap"></div>
					<i class="far fa-user-circle login_icon"></i>
					<span><a href="#" style="color: #f9c00c; font-weight: 600;">로그인</a>하시면 댓글을 달 수 있어요!</span>
				</div>

				<div class="no_cmt">
					<div class="login_area_wrap"></div>
					<i class="fas fa-exclamation no_icon"></i>
					<span>등록된 댓글이 없어요. 첫 댓글을 남겨보세요.</span>
				</div>




				<div class="cmt_all">
					<div><span class="cmt_alltitle">댓글달기</span></div>
					<div class="cmt_txt_area">
						<div class="user_img_wrap"><img class="user_img" src="../images/4.png"></div>
						<span class="bar"></span>
						<div class="cmt_view_cnt">
							<div class="cmt_txt_title_wrap">
								<span class="cmt_title">새빨간레몬</span>
								<span class="cmt_date">2019-07-03 11:17:20</span>
							</div>
							<textarea class="txt_area"></textarea>
							<button type="button" class="viewpage_btn cmt_btm">댓글등록</button>
						</div>
					</div>
				</div>
			</div>




		</main>
	</section>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script type="text/javascript">
		$('.like_befor').click(function (){
			$(this).css("display", "none");
			$('.like_after').css("display","inline-block")
			.css("color", "salmon")
			.css("transition", ".3s");
		});
		$('.like_after').click(function (){
			$(this).css("display", "none");
			$('.like_befor').css("display","inline-block")
			.css("transition", ".3s");;
		});

		$(document).ready(function (){
			$('.text_delete').click(function(){
				$('#delete_all').css("display","block");
			});
			$('.close_icon').click(function(){
				$('#delete_all').css("display","none");
			});
			$('.no_btn').click(function(){
				$('#delete_all').css("display","none");
			});
		});
	</script>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>