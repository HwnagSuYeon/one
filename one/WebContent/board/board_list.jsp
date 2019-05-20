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

@import url('boardMain.css');
</style>
</head>
<body>
	<!-- 게시판디자인 -->
	<section class="board_all">
		<main class="board_wrap">
		<h1 class="board_title">Q&A게시판</h1>
		<form class="search_bar_wrap">
			<div class="search_icon">
				<i class="fas fa-search "></i>
			</div>
			<input type="GET" name="board_search" class="board_search"
				placeholder="키워드를 입력하세요">
			<div class="search_items"></div>
			<select class="select_box">
				<option>제목</option>
				<i class="fas fa-angle-down"></i>
				<option>내용</option>
				<option>제목+내용</option>
				<option>작성자</option>
			</select>
			<button type="button" class="search_btn">검색</button>
		</form>
		<div class="viwe_all">
			<span class="viwe_span_all all" style="color: #f9c00c;"><a
				href="#">전체</a></span> <span class="viwe_span_all new"><a href="#">최신순</a></span>
			<span class="viwe_span_all recomend"><a href="#">추천순</a></span> <span
				class="viwe_span_all comment"><a href="#">댓글순</a></span> <span
				class="viwe_span_all view_count"><a href="#">조회순</a></span>
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
				<!-- 현재시간 구하기 -->
				<jsp:useBean id="now" class="java.util.Date"/>
				<!-- 현재시간과 비교하기위해 형식을 맞춰줌 -->
				<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
				<fmt:formatDate value="${bDto.regdate}" pattern="yyyy-MM-dd" var="regdate"/>
				<tr class="list_content">
					<td>${bDto.bno}</td>
					<td>
						<a href="#" class="board_cnt_title">${bDto.title}
							<c:if test="${bDto.replycnt > 0}">
								<span class="replyCnt_Color">${bDto.replycnt}</span>
							</c:if>
							
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
					<td>${bDto.viewcnt}</td>
					<td>
						<a href="#" class="files">
							<i class="far fa-file file_icon"></i>
						</a>
					</td>
				</tr>
			</c:forEach>
			
			
		</table>
		<footer class="pagination">
			<c:if test="${pageMaker.prev}">
				<a href="${path}/boardList.one?page=${pageMaker.startPage -1 }">
					<i class="fas fa-angle-double-left"></i>
				</a>
				<a href="${path}/boardList.one?page=1">1</a>
				<a href="#"><i class="fas fa-ellipsis-h dot"></i></a>
			</c:if>			
			
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<%--  --%>
					<a href="${path}/boardList.one?page=${idx}&flag=${flag}&keyword=${keyword}&key=${code}" <c:out value="${pageMaker.criDto.page == idx ? 'class= active':''}"/>>${idx}</a> 
			</c:forEach>
			
			<c:if test="${pageMaker.next}">
				<a href="#"><i class="fas fa-ellipsis-h dot"></i></a>
				<a href="${path}/boardList.one?page=${pageMaker.finalPage}">${pageMaker.finalPage}</a>
				<a href="${path}/boardList.one?page=${pageMaker.endPage + 1}">
					<i class="fas fa-angle-double-right"></i>
				</a>
			</c:if>
			
		</footer>
		</main>
	</section>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>