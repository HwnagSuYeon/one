<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%
	String referer = request.getHeader("referer");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/css/board_view.css?v=1">
<title>Insert title here</title>
</head>
<body>
	<!-- modal -->
	<div id="delete_all">
		<div class="position">
			<div id="delete_window">
				<div class="delete_window">
					<span class="close_modal_delete"><i class="fas fa-times close_icon"></i></span>
					<h1 class="delete_modal_title">게시글을 삭제하시겠어요?</h1>
					<i class="far fa-sad-tear sad_icon"></i>
					<div class="delete_btn_wrap">
						<button class="no_btn" type="submit" color="white" disavled>생각해볼게요</button>
						<button class="yes_btn" type="submit" color="white" disavled>삭제할게요</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<section class="board_all">
		<main class="board_wrap">
			<h1 class="board_title">Q&A게시판</h1>
			<div class="board_view_all">
				<div class="white_back">
					<div class="title_wrap">
						<span class="view_content_title">${one.title}</span>
						<div class="user_name_all">
							<span class="user_name_wrap">작성자:<span class="user_name">${one.writer}</span></span>
							<div class="btn_wrap">
							<c:if test="${sessionScope.loginUser.id == one.writer}">
								<button type="button" class="viewpage_btn text_update">게시글 수정</button>
								<button type="button" class="viewpage_btn text_delete" >게시글 삭제</button>
							</c:if>
							</div>
						</div>
					</div>

					<span class="text_content">${one.content}</span>
					<div class="add_file_wrap">
						<button type="button" class="viewpage_btn add_file">파일첨부</button>
						<span class="add_file_text">첨부된 파일이 없습니다 <i class="fas fa-times"></i></span>

					</div>
					
					<jsp:useBean id="now" class="java.util.Date"/>
					<!-- 현재시간과 비교하기위해 형식을 맞춰줌:fmt태그를 사용해 날짜포맷형식을 지정. 바뀐 날짜포맷형식을 today라는 변수에 담음 -->
					<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
					<!-- bDto에 담겨있는 regdate정보(게시글 등록 날짜)를 가져와 날짜포맷형식 바꾼 것을 regdate라는 변수에 담음. -->
					<fmt:formatDate value="${one.regdate}" pattern="yyyy-MM-dd" var="regdate"/>
					
					
					<div class="board_all_wrpa"></div>
					<div
					+ class="viewpage_content">
						<div class="inner_wrap">
							<span class="date">
								<i class="far fa-clock"></i> 작성일
								<c:choose>
									<c:when test="${today == regdate}">
										<fmt:formatDate pattern="hh:mm:ss" value = "${one.regdate}"/>
									</c:when>
									<c:otherwise>
										<fmt:formatDate pattern="yyyy-MM-dd" value = "${one.regdate}"/>
									</c:otherwise>
								</c:choose>
							</span>
							<span class="date"><i class="fas fa-sort-amount-up"></i> ${one.bno}번째 게시글</span>
							<span class="view_heart"><i class="far fa-heart"></i> ${one.goodcnt}</span>
							<span class="view"><i class="far fa-user"></i> ${one.viewcnt}</span>
							<span class="comment_btn"><i class="far fa-comment-dots" style="color: white;"></i><a href="#"> 댓글쓰기</a></span>
							<span class="comment_btn retun_go"><a href="#"> 게시글목록</a></span>
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
				<div id="commentList"></div>
			</div>




		</main>
	</section>
	<%@ include file="../include/footer.jsp" %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function (){
			// 문서가 준비되면 댓글 목록을 조회하는 ajax 실행
				comment_list();
			
			// 댓글 띄우는 기능
			function comment_list(){
				
				$.ajax({
					type: "post",
					url: "commentlist.one",
					data: "bno=${one.bno}",
					success: function(result) {
						$("#commentList").html(result);
					}
				});
			}
			
			// 좋아요 줬다 뺐었다
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
			
			// 모달창 기능
			$('.text_delete').click(function(){
				$('#delete_all').css("display","block");
			});
			$('.close_icon').click(function(){
				$('#delete_all').css("display","none");
			});
			$('.no_btn').click(function(){
				$('#delete_all').css("display","none");
			});
			
			// 게시판 목록 클릭 했을 때
			$('.retun_go').click(function () {
				location.href = "<%=referer%>";
				// 바로 이전페이지값으로 url정보를 가져오는 것
			});
		});
	</script>
</body>
</html>