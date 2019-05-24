<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${path}/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<title>Insert title here</title>
</head>
<body>
<textarea placeholder="댓글을 남겨보세요:)" id="replyInsert" class="txt_area" name="re_content"></textarea>
							<script type="text/javascript">
								var oEditors = [];
								nhn.husky.EZCreator.createInIFrame({
							 	oAppRef: oEditors,
								elPlaceHolder: "replyInsert",
							 	sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",
							 	fCreator: "createSEditor2"
								});
							</script>
</body>
</html>