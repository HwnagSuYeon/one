<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/css/board_list.css?v=1">
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
</style>
</head>
<body>
	<!-- 게시판디자인 -->
	<section class="board_all">
		<main class="board_wrap">
		<h1 class="board_title">Q&A게시판</h1>
		<div class="search_bar_wrap">
			<div class="search_icon">
				<i class="fas fa-search "></i>
			</div>
			<input type="GET" name="keyword" class="board_search" placeholder="키워드를 입력하세요">
			<div class="search_items"></div>
			<select class="select_box" name="search_option">
				<option value="1">제목</option>
				<i class="fas fa-angle-down"></i>
				<option value="2">내용</option>
				<option value="3" selected="selected">제목+내용</option>
				<option value="4">작성자</option>
			</select>
			<button type="button" class="search_btn">검색</button>
		</div>
		<div class="viwe_all">
			<span class="viwe_span_all new new">
				<a href="${path}/boardList.one?sort_type=new&keyword=${keyword}&search_option=${search_option}">최신순</a>
			</span>
			<span class="viwe_span_all recomend">
				<a href="${path}/boardList.one?sort_type=good&keyword=${keyword}&search_option=${search_option}">추천순</a>
			</span>
			<span class="viwe_span_all comment">
				<a href="${path}/boardList.one?sort_type=reply&keyword=${keyword}&search_option=${search_option}">댓글순</a>
			</span>
			<span class="viwe_span_all view_count">
				<a href="${path}/boardList.one?sort_type=view&keyword=${keyword}&search_option=${search_option}">조회순</a>
			</span>
			<button type="button" class="board_insert_btn">
				<a href="#">게시글 등록</a>
			</button>
		</div>
		<table class="board_list">
			<tr class="list_column">
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>좋아요</th>
				<th>조회수</th>
				<th>첨부</th>
			</tr>
			<c:forEach items="${list}" var="bDto">
				<!-- 현재시간 구하기:jsp태그 사용.현재시간이 now라는 변수에 담겨져있음 -->
				<jsp:useBean id="now" class="java.util.Date"/>
				<!-- 현재시간과 비교하기위해 형식을 맞춰줌:fmt태그를 사용해 날짜포맷형식을 지정. 바뀐 날짜포맷형식을 today라는 변수에 담음 -->
				<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
				<!-- bDto에 담겨있는 regdate정보(게시글 등록 날짜)를 가져와 날짜포맷형식 바꾼 것을 regdate라는 변수에 담음. -->
				<fmt:formatDate value="${bDto.regdate}" pattern="yyyy-MM-dd" var="regdate"/>
				<tr class="list_content">
					<td>${bDto.bno}</td>
					<td>
						<a href="${path}/boardView.one?bno=${bDto.bno}" class="board_cnt_title">${bDto.title}
							<!-- 댓글이 한개라도 있으면 if문을 타서 댓글의 갯수를 띄워주는 역할 -->
							<c:if test="${bDto.replycnt > 0}">
								<span class="replyCnt_Color">${bDto.replycnt}</span>
							</c:if>
							<!-- 위에서 계산한 today와 regdate가 일치한다면(오늘날짜와 게시글등록날짜가 같다면)다음의 if문을 타서, new라는 css효과 줌 -->
							<c:if test="${today ==regdate}">
								<span class="new_time">new</span>
							</c:if>
						</a>
					</td>
					<td>${bDto.writer}</td>
					<td>
						<c:choose>
							<c:when test="${today == regdate}">
								<fmt:formatDate pattern="hh:mm:ss" value = "${bDto.regdate}"/>
							</c:when>
							<c:otherwise>
								<fmt:formatDate pattern="yyyy-MM-dd" value = "${bDto.regdate}"/>
							</c:otherwise>
						</c:choose>
					</td>
					<td><i class="fas fa-heart heart"></i>${bDto.goodcnt}</td>
					<td><i class="far fa-user view_icon"></i>${bDto.viewcnt}</td>
					<td>
						<a href="#" class="files">
							<i class="far fa-file file_icon"></i>
						</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<c:if test="${!empty keyword}">
			<div id="search_result">
				<span class="search_span">${keyword}</span>로 검색한 결과는 총
				<span class="search_span">${totalCount}</span>건입니다.		
			</div>
		</c:if>
			
		
		<footer class="pagination">
			<c:if test="${pageMaker.prev}">
				<a href="${path}/boardList.one?page=${pageMaker.startPage -1 }&sort_type=${sort_type}&keyword=${keyword}&search_option=${search_option}">
					<i class="fas fa-angle-double-left"></i>
				</a>
				<a href="${path}/boardList.one?page=1&sort_type=${sort_type}&keyword=${keyword}&search_option=${search_option}">1</a>
				<a href="#"><i class="fas fa-ellipsis-h dot"></i></a>
			</c:if>			
			
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<a href="${path}/boardList.one?page=${idx}&sort_type=${sort_type}&keyword=${keyword}&search_option=${search_option}" <c:out value="${pageMaker.criDto.page == idx ? 'class= active':''}"/>> ${idx}</a> 
			</c:forEach>
			
			<c:if test="${pageMaker.next}">
				<a href="#"><i class="fas fa-ellipsis-h dot"></i></a>
				<a href="${path}/boardList.one?page=${pageMaker.finalPage}&sort_type=${sort_type}&keyword=${keyword}&search_option=${search_option}">${pageMaker.finalPage}</a>
				<a href="${path}/boardList.one?page=${pageMaker.endPage + 1}&sort_type=${sort_type}&keyword=${keyword}&search_option=${search_option}">
					<i class="fas fa-angle-double-right"></i>
				</a>
			</c:if>
			
		</footer>
		</main>
	</section>
	<%@ include file="../include/footer.jsp"%>
	<!-- <script type="text/javascript">
		$(document).ready(function(){
			var sort_type = "${sort_type}";
			if(sort_type == "new"){
				$('.new').css("color","#f9c00c");
			} else if (sort_type == "good") {
				$('.recomend').css("color","#f9c00c");
			} else if (sort_type =="reply") {
				$('.comment').css("color", "#f9c00c");
			} else if (sort_type == "view") {
				$('.view_count').css("color", "#f9c00c");
			}
		});
	</script> -->
	<script type="text/javascript">
		$(document).on("click", ".board_insert_btn", function () {
			$.ajax({
				url: 'registerAjax.one',
				type: 'POST',
				dataType: 'json',
				success: function (data) {
					if(data.message == "login") {
						location.href = "registerView.one";
					} else if(data.message =="nologin") {
						alert("모달");
					}
				},
				error: function () {
					alert("system error!");
				}
			});
		});
			
		$(document).on("click", ".search_btn", function () {
			var search_option = $('.select_box').val();
			var keyword = $.trim($('.board_search').val());
			
			if(keyword == null || keyword.length == 0) {
				$('.board_search').focus();
				return false;
			}
			location.href = "${path}/boardList.one?search_option="+search_option+"&keyword="+keyword;
		});
	</script>
</body>
</html>