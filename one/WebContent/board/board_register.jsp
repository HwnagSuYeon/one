<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/css/board_register.css?v=1">
<title>Insert title here</title>
</head>
<body>
	<section class="board_all">
		<main class="board_wrap">
			<h1 class="board_title">게시글 등록하기</h1>
			<div class="board_view_all">
				<div class="white_back">
					<form class="board_frm">
						<div class="title_wrap">
							<span class="view_content_title">게시글 제목</span>
							<input type="text" class="board_title_input" name="" placeholder="제목을 입력하세요">
							<span class="date"><i class="far fa-clock clock_icon"></i> 작성일 19-05-15</span>
						</div>
						<textarea class="text_content"></textarea>
						<div class="add_file_wrap">
							<button type="button" class="viewpage_btn add_file">파일첨부</button>
							<span class="add_file_text">첨부된 파일이 없습니다 <i class="fas fa-times"></i></span>

						</div>

						<div class="board_all_wrpa"></div>
						<div class="viewpage_content">
							<div class="inner_wrap">
								
								<div class="user_name_all">
								<span class="user_name_wrap">작성자:<span class="user_name"> 꾸꾸링</span></span>
								<div class="btn_wrap">
									<button type="button" class="viewpage_btn text_update">게시글 등록</button>
								</div>
							</div>
							</div>
						</div>
					</form>
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
	</script>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>