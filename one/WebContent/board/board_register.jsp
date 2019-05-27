<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<c:if test="${sessionScope.loginUser == null}">
	<script>
		alert("로그인하신 후 사용하세요")
		location.href ="${path}/boardList.one";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${path}/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="${path}/css/board_register.css?v=1">
<title>Insert title here</title>
</head>
<body>
	<section class="board_all">
		<main class="board_wrap">
			<h1 class="board_title">게시글 등록하기</h1>
			<div class="board_view_all">
				<div class="white_back">
					<form class="board_frm" action="registerPlay.one" name="register_frm" method="POST" enctype="multipart/form-data" id="frm_board">
					<!-- multipart/form-data -> 파일첨부 기능을 쓰기 위해서 반드시 화면단에서 멀티파트로 보낸다. 또한 메서드는 포스트여야만 한다. 또한 화면단에서 멀티파트로 보냈으면 액션단에서도 getparameter가 아닌 멀티파트로 받아줘야함. -->
						<div class="title_wrap">
							<span class="view_content_title">게시글 제목</span>
							<input type="text" class="board_title_input" id="title" name="title" placeholder="제목을 입력하세요">
							<span class="date"><i class="far fa-clock clock_icon"></i> 작성일 19-05-15</span>
						</div>
						<textarea id="boardInsert" class="txt_area content" name="content"></textarea>
							<script type="text/javascript">
								var oEditors = [];
								nhn.husky.EZCreator.createInIFrame({
							 	oAppRef: oEditors,
								elPlaceHolder: "boardInsert",
							 	sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",
							 	fCreator: "createSEditor2"
								});
							</script>
						<div class="add_file_wrap" >
							<input type="file" name="uploadfile" id="uploadfile" style="display: none;">
							<input id="add_file" type="button" class="viewpage_btn add_file" value="파일첨부">
							<span class="add_file_text" id="file_name">첨부된 파일이 없습니다 </span>
							<span id="now_file_size"></span>
							<i class="fas fa-times " id="close_file_btn" style="display:none;"></i>
						</div>
						
						<div class="board_all_wrpa"></div>
						<div class="viewpage_content">
							<div class="inner_wrap">
								
								<div class="user_name_all">
								<input type="hidden" id="writer" name="writer" value="${sessionScope.loginUser.id}">
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
			.css("transition", ".3s");
		});
		
		$(document).ready(function () {
			$('.text_update').click(function () {
				oEditors.getById["boardInsert"].exec("UPDATE_CONTENTS_FIELD", []);
				
				var title = $('#title').val();
				var content = $('#boardInsert').val();
				var writer = $('#writer').val();
				
				if(title == "" || title.length == 0){
					alert("제목입력하세요")
					return false;
				} else if(content == "<p><br></p>"){
					alert('내용을 입력하세요')
					return false;
				} 
				
				$('#frm_board').submit();
			});
			
			//첨부파일 클릭기능(숨겨놓은 실제 type=file과 연결시킴)
			$('#add_file').click(function () {
				$('#uploadfile').click();
			});
			
		});
		
		// 실제 첨부파일 버튼과 화면에서 보이는 버튼 연결
		$(document).on("change", "#uploadfile", function () {
			var filesize = $(this)[0].files;
			if(filesize.length < 1) {
				$('#file_name').text("선택된 파일 없음");
				$('#close_file_btn').css('display', "none");
			} else {
				var filename = this.files[0].name;
				var size = this.files[0].size;
				var maxSize = 10* 1024 * 1024;
				
				if(size > maxSize) {
					alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다.");
					$('#file_name').text("선택된 파일 없음");
					$('#uploadfile').val("");
					$('#now_file_size').text("0mb");
				} else {
					$("#file_name").text(filename);
					var formSize = size/(1024*1024);
					$("#now_file_size").text("("+formSize.toFixed(2)+"mb)");
					$("#close_file_btn").css("display", "block");
				}
			}
		});
		
		
		// 첨부파일 삭제 아이콘 누르면일어나는 일
		$(document).on('click', '#close_file_btn', function () {
			$('#uploadfile').replaceWith($('#uploadfile').clone(true)); /* 파일 다시선택해서 올라가게 만듦  */
			$('#uploadfile').val("");
			$('#now_file_size').text("");
			$('#file_name').text("선택된 파일 없음"); 
			$('#close_file_btn').css("display","none");
		});
		
	</script>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>