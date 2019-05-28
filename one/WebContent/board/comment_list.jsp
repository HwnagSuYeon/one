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
	<div class="cmt_view_area">
		<span>등록된 댓글 <span
			style="color: #f9c00c; font-weight: 600; margin-left: 7px;">${replyList.size()}건</span></span>
	</div>
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
					<fmt:formatDate value="${replyview.regdate}" pattern="yyyy-MM-dd"
						var="regdate" />

					<span class="cmt_date"> <c:choose>
							<c:when test="${today == regdate}">
								<fmt:formatDate pattern="hh:mm:ss" value="${replyview.regdate}" />
							</c:when>
							<c:otherwise>
								<fmt:formatDate pattern="yyyy-MM-dd"
									value="${replyview.regdate}" />
							</c:otherwise>
						</c:choose> <c:if test="${sessionScope.loginUser.id == replyview.writer}">
							<a class="cmt_delete" data_num="${replyview.rno}"><i class="fas fa-times"></i></a>
						</c:if>
					</span>
				</div>
				<div class="cmt_text">${replyview.content}</div>
				<!-- 몇번째 댓글을 지울지 알기 위해서는 rno필요. 그러나 forEach안에 있는 veiw.rno는 첫번째 댓글의 정보밖에 몰라서 이렇게 쓰면 첫번째 댓글밖에 못지운다.
					 따라서, data_num이라는 것을 사용해 (태그에 데이터를 저장함) 원하는 댓글의 번호 (rno)를 가져올 수 있다. -->
			</div>
		</div>
	</c:forEach>
	
	<c:if test="${replyList.size()==0}">
		<div class="no_cmt">
			<div class="login_area_wrap"></div>
			<i class="fas fa-exclamation no_icon"></i>
			<span>등록된 댓글이 없어요. 첫 댓글을 남겨보세요.</span>
		</div>
	</c:if>

	<div class="cmt_area">
		<c:choose>
			<c:when test="${empty sessionScope.loginUser}">
				<div class="login_area_wrap"></div>
				<i class="far fa-user-circle login_icon"></i>
				<span> <a href="#" style="color: #f9c00c; font-weight: 600;">로그인</a>하시면 댓글을 달 수 있어요!
				</span>
			</c:when>
			<c:otherwise>
				<form action="replyAdd.one" id="frm_reply" name="frm_reply" method="POST">
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
								<span class="cmt_title">${sessionScope.loginUser.id}</span>
							</div>
							<textarea placeholder="댓글을 남겨보세요:)" id="replyInsert" class="txt_area" name="re_content"></textarea>
							<script type="text/javascript">
								var oEditors = [];
								nhn.husky.EZCreator.createInIFrame({
							 	oAppRef: oEditors,
								elPlaceHolder: "replyInsert",
							 	sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",
							 	fCreator: "createSEditor2"
								});
							</script> <!-- elPlaceHolder를 텍스 -->
							<button type="button"  id ="cmt_btm" class="viewpage_btn cmt_btm">댓글등록</button>
							<span class="cmt_err_msg" style="font-size: 15px; color: #f9c00c; display: none;">댓글의 내용이 없습니다! 내용을 입력해주세요.</span>
							<input type="hidden" name="re_writer" value="${sessionScope.loginUser.id}">
							<input type="hidden" id="re_bno" name="re_bno">
						</div>
					</div>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
	
</body>
</html>