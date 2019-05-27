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
<script type="text/javascript" src="${path}/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
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
						<button id="yes_btn" class="yes_btn" type="button" color="white" disavled>삭제할게요</button>
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
						<button type="button" class="viewpage_btn add_file" id="file_down">다운로드</button>
						<c:choose>
							<c:when test="${one.filesize>0}">
									<span class="add_file_text"> ${one.filename}
										(<fmt:formatNumber type="number" pattern="0.00" value="${one.filesize / 1024 /1024}"></fmt:formatNumber>mb)
										<i class="fas fa-times"></i>
									</span>
							</c:when>
							<c:otherwise>
								<span class="add_file_text">첨부된 파일이 없습니다.</span>
							</c:otherwise>
						</c:choose>
					</div>
					
					<jsp:useBean id="now" class="java.util.Date"/>
					<!-- 현재시간과 비교하기위해 형식을 맞춰줌:fmt태그를 사용해 날짜포맷형식을 지정. 바뀐 날짜포맷형식을 today라는 변수에 담음 -->
					<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
					<!-- bDto에 담겨있는 regdate정보(게시글 등록 날짜)를 가져와 날짜포맷형식 바꾼 것을 regdate라는 변수에 담음. -->
					<fmt:formatDate value="${one.regdate}" pattern="yyyy-MM-dd" var="regdate"/>
					
					
					<div class="board_all_wrpa"></div>
					<div class="viewpage_content">
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
					<span id="like" class="like_befor circle"><i class="far fa-heart"></i></span>
					<span id="unLike" class="like_after circle"><i class="fas fa-heart"></i></span>
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
		// 댓글 삭제기능
		$(document).on('click', '.cmt_delete', function () {
			var rno = $(this).attr("data_num");
			var bno = '${one.bno}';
			
			$.ajax({
				url: "replyRemove.one",
				data: "rno="+rno+"&bno="+bno,
				success: function (result) {
					comment_list();
				},
				error: function () {
					alert("system error");
				}
			});
		});
			
		// 게시글 삭제 버튼 눌렀을 때 어디로가야하는지
		$(document).on('click', '#yes_btn', function () {
			location.href = "removePlay.one?bno=${one.bno}&filename=${one.filename}";
		});
		
		// 게시글 수정버튼 눌렀을 때
		$(document).on('click', '.text_update', function () {
			location.href = "boardUpdate.one?bno=${one.bno}";
		});
	
		// 댓글버튼을 눌렀을때 실행되는 기능
		$(document).on('click', '#cmt_btm', function(){
			oEditors.getById["replyInsert"].exec("UPDATE_CONTENTS_FIELD", []);
			
			
			var content = $('#replyInsert').val();
			if(content == "<p><br></p>"){
				//null체크
				alert('test');
				$('.cmt_err_msg').css("display","block");
				$('#replyInsert').focus();
				return false;
			} else {
				var bno = '${one.bno}';
				$('#re_bno').val(bno);
				$.ajax({
					url: 'replyAdd.one',
					type: 'post',
					data: $('#frm_reply').serialize(), // -> ajax로 폼태그 안에 들어있는 데이터 보내는 방법. serialize->직렬화. 데이터가 많으니 바이트코드로 쪼개서 받는곳에서 합친다.
					dataType: 'json',
					contentType: 'application/x-www-form-urlencoded; charset+UTF-8', // serialize를 사용하려면 content타입을 써줘야 함.
					success:
						function(data) {
							if(data.result == 1) {
								comment_list(); // 댓글 다는데 성공하면 댓글 목록을 최신화 시켜주는 기능								
								$("#replyInsert").val("");  //성공하면 댓글 다는곳의 값을 초기화 시켜줌. ajax라서 다시 원 화면으로 돌아와 입력했던 값을 그대로 띄우기 때문.
							}
						
					},
					error: function (){
						alert("system error")
					}
				});
			}
		});
		// 첨부파일 다운로드
		$(document).on('click', '#file_down', function () {
			location.href="download.one?file=${one.filename}";
		});
		
		// 댓글 띄우는 기능: ajax
		function comment_list(){
			
			$.ajax({
				type: "post",
				url: "commentlist.one",
				data: "bno=${one.bno}",
				success: function(result) {
					// ajax실행 후 회귀하는 것으로, result에는 comment_list.jsp가 통째로 들어있는 것.
					// id가 commentList인것을 찾아서 html을 띄우는데, result(=comment_list.jsp)값을 띄워라
					// 즉 jsp페이지 자체를 매개변수로 보내준 것이다.
					$("#commentList").html(result);
				}
			});
		}
		
	
		$(document).ready(function (){
			// 문서가 준비되면 댓글 목록을 조회하는 ajax 실행
			comment_list();
			
			
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