<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/css/board_view.css?v=1">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${replyList}" var="replyview">
		<div class="cmt_view_area">
			<div class="user_img_wrap">
				<img class="user_img" src="../images/1.png">
			</div>
			<span class="bar"></span>
			<div class="cmt_view_cnt">
				<div class="cmt_title_wrap">
					<span class="cmt_title">${replyview.writer}</span>

					<jsp:useBean id="now" class="java.util.Date" />
					<!-- 현재시간과 비교하기위해 형식을 맞춰줌:fmt태그를 사용해 날짜포맷형식을 지정. 바뀐 날짜포맷형식을 today라는 변수에 담음 -->
					<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
					<!-- bDto에 담겨있는 regdate정보(게시글 등록 날짜)를 가져와 날짜포맷형식 바꾼 것을 regdate라는 변수에 담음. -->
					<fmt:formatDate value="${replyview.regdate}" pattern="yyyy-MM-dd" var="regdate" />

					<span class="cmt_date">
					<c:choose>
						<c:when test="${today == regdate}">
							<fmt:formatDate pattern="hh:mm:ss" value="${replyview.regdate}" />
						</c:when>
						<c:otherwise>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${replyview.regdate}" />
						</c:otherwise>
					</c:choose>
					<c:if test="${sessionScope.loginUser.id == replyview.writer}">
						<a href="#" class="cmt_delete"><i class="fas fa-times"></i></a>
					</c:if>
					</span>
				</div>
				<div class="cmt_text">${replyview.content}</div>
			</div>
		</div>
	</c:forEach>


	<div class="login_area">
		<div class="login_area_wrap"></div>
		<i class="far fa-user-circle login_icon"></i> <span><a href="#"
			style="color: #f9c00c; font-weight: 600;">로그인</a>하시면 댓글을 달 수 있어요!</span>
	</div>

	<div class="no_cmt">
		<div class="login_area_wrap"></div>
		<i class="fas fa-exclamation no_icon"></i> <span>등록된 댓글이 없어요. 첫
			댓글을 남겨보세요.</span>
	</div>




	<div class="cmt_all">
		<div>
			<span class="cmt_alltitle">댓글달기</span>
		</div>
		<div class="cmt_txt_area">
			<div class="user_img_wrap">
				<img class="user_img" src="../images/4.png">
			</div>
			<span class="bar"></span>
			<div class="cmt_view_cnt">
				<div class="cmt_txt_title_wrap">
					<span class="cmt_title">새빨간레몬</span> <span class="cmt_date">2019-07-03
						11:17:20</span>
				</div>
				<textarea class="txt_area"></textarea>
				<button type="button" class="viewpage_btn cmt_btm">댓글등록</button>
			</div>
		</div>
	</div>
</body>
</html>