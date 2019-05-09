<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/join.css?v=1">
<title>Insert title here</title>
</head>
<body>
	<main class="main_wrap">
	<div class="main_position">
		<h1 class="title">아이디로 회원 가입</h1>
		<form class="form_content">

			<div class="contet_wrap">
				<div class="content">
					<input id="email_val" class="input_val email_val" type="text"
						placeholder="ID입력">
				</div>
				<span class="err_msg"></span>
				<div class="margin"></div>
			</div>

			<div class="contet_wrap">
				<div class="content">
					<input id="pw_val" class="input_val pw_val" type="password"
						placeholder="비밀번호 입력">
				</div>
				<span class="err_msg"></span>
				<div class="margin"></div>
			</div>

			<div class="contet_wrap">
				<div class="content">
					<input id="pwck_val" class="input_val pwck_val" type="password"
						placeholder="비밀번호 확인">
				</div>
				<span class="err_msg"></span>
				<div class="margin"></div>
			</div>

			<h1 class="title">상세정보 입력</h1>

			<div class="contet_wrap">
				<div class="content">
					<input id="name_val" class="input_val name_val" type="text"
						placeholder="이름">
				</div>
				<span class="err_msg"></span>
				<div class="margin"></div>
			</div>

			<div class="contet_wrap">
				<div class="content">
					<input id="phone_val" class="input_val phone_val" type="text"
						placeholder="핸드폰 번호">
				</div>
				<span class="err_msg"></span>
				<div class="margin"></div>
			</div>


			<div class="contet_wrap">
				<div class="content">
					<input class="input_val" type="text" id="sample6_postcode"
						placeholder="우편번호"> <input class="post_find" type="button"
						onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
				</div>
				<div class="margin"></div>
			</div>

			<div class="contet_wrap">
				<div class="content">
					<input class="input_val" type="text" id="sample6_address"
						placeholder="주소">
				</div>
				<div class="margin"></div>
			</div>

			<div class="contet_wrap">
				<div class="content">
					<input class="input_val" type="text" id="sample6_detailAddress"
						placeholder="상세주소">
				</div>
				<div class="margin"></div>
			</div>
			<!-- 약관동의박스 -->
			<div class="agree_all">
				<div class="ckbox_wrap">
					<div class="agree_wrap">
						<div>
							<input id="agree_btn" class="ck_box" type="checkbox"> <label
								class="check_label" for="agree_btn"></label>
						</div>
						<div class="ck_content_wrap">
							<div>
								<span> <a class="ck_anker" href="constract.one?code=1"
									target="_blank_1">이용약관 </a>
								</span>, <span> <a class="ck_anker" href="constract.one?code=2"
									target="_blank_1">개인정보 처리방침 </a>
								</span>, <a class="ck_anker" href="constract.one?code=3"
									target="_blank_1">위치기반 서비스 이용약관</a>에 동의합니다.
							</div>

							<div class="ck_small_text">ONEforME는 만 14세 이상 회원만 이용 가능합니다.</div>
						</div>
					</div>
				</div>
			</div>

			<button class="join_btn" type="submit" color="white" disavled>가입하기</button>

		</form>
	</div>
	</main>
	<%@ include file="include/footer.jsp"%>

	<!-- daumpost api -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script>
		// 상세주소 적을때 필요한 기능임(다음 api)
		function sample6_execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                	addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                	addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    	extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                    	extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                    	extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_detailAddress").value = extraAddr;
                    
                } else {
                	document.getElementById("sample6_detailAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
		}
		
	
	</script>

	<!-- 입력칸 클릭시 밑줄 색 바뀌는 기능 -->
	<script type="text/javascript">
		$(document).ready(function() {
			$('.input_val').focus(function(){
				$(this).parent().css('border-bottom', '1.3px solid #f9c00c');
			});
			$('.input_val').blur(function(){
				$(this).parent().css('border-bottom', '1.3px solid rgb(238,238,238)');
			});
			
			// id유효성 검사
			$('#email_val').blur(function () {
				var id = $.trim($(this).val());
				var regEmpty = /\s/g; //공백문자 정규식
				var reg = /[^a-z0-9-_.]+/g; // 올바른 아이디 형식
				//id => 1.null 2.정규식 3.중복체크
				if(id==""|| id.length == 0){
					$(".err_msg").eq(0).text("필수입력 정보입니다.")
								 .css("display","block")
					 			 .css("color","tomato")
					 			 .css("text-align","right");
					return false;
					// false를 반환하는 이유는 if문을 안타기 위해서가 아니라 다음의 ajax문을 타지 않기 위해서 반환.
				} else if (id.match(regEmpty)) {
					$(".err_msg").eq(0).text("공백 없이 입력해 주세요.")
								 .css("display","block")
					 			 .css("color","tomato")
					 			 .css("text-align","right");
					return false;
				} else if (reg.test(id)) {
					$(".err_msg").eq(0).text("올바른 ID를 입력해주세요")
								 .css("display","block")
					 			 .css("color","tomato")
					 			 .css("text-align","right");
					return false;
				} else if (id.length < 6 || id.length > 50) {
					$(".err_msg").eq(0).text("ID는 공백없이 6자 이상 50자 이하로 써주세요.")
								 .css("display","block")
		 						 .css("color","tomato")
		 						 .css("text-align","right");
					return false;
				}
				ajaxCheck(id);
			});
			// 위의 if문을 완료한경우 유효값의 완료를 마무리 했으므로, 이제 DB가서 중복된 아이디인지 검사하는 역할을ajax가 한다.
			// ajax를 활용한 유효성 검사 
			
			
			
			// 비밀번호 유효성 검사
			$("#pw_val").blur(function() {
				var pw = $.trim($(this).val());
				var regEmpty = /\s/g; //공백문자 정규식
				var pwReg = RegExp(/^[a-zA-Z0-9]{4,12}$/); //비밀번호 정규식
				if(pw==""|| pw.length == 0){
					$(".err_msg").eq(1).text("필수입력 정보입니다.")
								 .css("display","block")
					 			 .css("color","tomato")
					 			 .css("text-align","right");
					return false;
				} else if (pw.match(regEmpty)) {
					$(".err_msg").eq(1).text("공백 없이 입력해 주세요.")
								 .css("display","block")
					 			 .css("color","tomato")
					 			 .css("text-align","right");
					return false;
				}  else if (!pwReg.test(pw)) {
					$(".err_msg").eq(1).text("올바른 비밀번호(4~12자)를 입력해주세요")
									   .css("display","block")
		 			 				   .css("color","tomato")
		 			 				   .css("text-align","right");
					return false;
				} else {
					$(".err_msg").eq(1).text("사용가능한 비밀번호입니다")
								 .css("display","block")
					 			 .css("color","dodgerblue")
					 			 .css("text-align","right");
				}
				var rpw = $.trim($("#pwck_val").val());
				if (rpw != null || rpw,lentg != 0) {
					if(pw == rpw) {
						$(".err_msg").eq(2).text("입력하신 비밀번호와 일치합니다.")
									 .css("display","block")
			 						 .css("color","dodgerblue")
			 			 			 .css("text-align","right");
					} else {
						$(".err_msg").eq(2).text("입력하신 비밀번호와 일치하지 않습니다!")
			   			 			 .css("display","block")
			   			 			 .css("color","tomato")
			   			 			 .css("text-align","right");
						return false;
					}
				}
			});
			
			
			// 비밀번호 재확인 유효성 검사
			$("#pwck_val").blur(function() {
				var pw = $.trim($("#pw_val").val());
				var rpw = $.trim($(this).val());
				
				var regEmpty = /\s/g; //공백문자 정규식
				var pwReg = RegExp(/^[a-zA-Z0-9]{4,12}$/); //비밀번호 정규식
				if(rpw==""|| rpw.length == 0){
					$(".err_msg").eq(2).text("필수입력 정보입니다.")
								 .css("display","block")
					 			 .css("color","tomato")
					 			 .css("text-align","right");
					return false;
				} else if (rpw.match(regEmpty)) {
					$(".err_msg").eq(2).text("공백 없이 입력해 주세요.")
								 .css("display","block")
					 			 .css("color","tomato")
					 			 .css("text-align","right");
					return false;
				}  else if (!pwReg.test(pw)) {
					$(".err_msg").eq(2).text("올바른 비밀번호(4~12자)를 입력해주세요")
								 .css("display","block")
		 			 			 .css("color","tomato")
		 			 			 .css("text-align","right");
					return false;
				} else if (pw != rpw) {
					$(".err_msg").eq(2).text("입력하신 비밀번호와 일치하지 않습니다!")
					   			 .css("display","block")
	 				   			 .css("color","tomato")
	 				   			 .css("text-align","right");
					return false;
				} else {
					$(".err_msg").eq(2).text("입력하신 비밀번호와 일치합니다.")
								 .css("display","block")
					 			 .css("color","dodgerblue")
					 			 .css("text-align","right");
				}
				
			});
			
			// 이름 유효성 검사
			$("#name_val").blur(function () {
				var name = $.trim($(this).val());
				
				var regEmpty = /\s/g; //공백문자 정규식
				var nameReg = /[^가-힣]/; // 한글문자 정규식
				
				if(name==""|| name.length == 0){
					$(".err_msg").eq(3).text("필수입력 정보입니다.")
								 .css("display","block")
					 			 .css("color","tomato")
					 			 .css("text-align","right");
					return false;
				} else if (name.match(regEmpty)) {
					$(".err_msg").eq(3).text("공백 없이 입력해 주세요.")
								 .css("display","block")
					 			 .css("color","tomato")
					 			 .css("text-align","right");
					return false;
				} else if (nameReg.test(name)){
					$(".err_msg").eq(3).text("이름은 표준 한글만 입력가능합니다")
					 			 .css("display","block")
		 						 .css("color","tomato")
		 						 .css("text-align","right");
				} else if (name.length > 4 || name.length < 2) {
					$(".err_msg").eq(3).text("2~4글자의 이름을 입력해주세요")
		 			 				   .css("display","block")
					 			   	   .css("color","tomato")
					 				   .css("text-align","right");
					return false;
				} else {
					$(".err_msg").eq(3).text("멋진 이름이에요!")
								 	   .css("display","block")
		 							   .css("color","dodgerblue")
		 						 	   .css("text-align","right");
					$("#phone_val").focus();
				}
			});
			
			
			// 핸드폰 번호 유효성 체크
			$("#phone_val").blur(function () {
				var phone = $.trim($(this).val());
				
				var regEmpty = /\s/g; //공백문자 정규식
				var regPhone = RegExp(/^[0-9]{8,11}$/);  //핸드폰번호  정규식
				
				if(phone ==""|| phone.length == 0){
					$(".err_msg").eq(4).text("필수입력 정보입니다.")
								 .css("display","block")
					 			 .css("color","tomato")
					 			 .css("text-align","right");
					return false;
				} else if (phone.match(regEmpty)) {
					$(".err_msg").eq(4).text("공백 없이 입력해 주세요.")
								 .css("display","block")
					 			 .css("color","tomato")
					 			 .css("text-align","right");
					return false;
				} else if ($.isNumeric(phone)==false) {
					//isNumeric =>숫자만 들어오게 판단함
					$(".err_msg").eq(4).text("숫자만 입력해 주세요")
 										.css("display","block")
	 									.css("color","tomato")
	 									.css("text-align","right");
					return false;
				} else if (phone.indexOf("01") !=0) {
					// 01로 시작하지 않는 번호 거르는 작업
					// indexOf -> index가 있는 위치로 ()안의 값을 반환. 만약 01값을 입력했다면 이 if문을 타지 않으므로 !를 붙여주어 타게 만든다.
					// inedxOf는 두자리 숫자를 묶어 1번지를 차지하며, 0번지로부터 시작한다.
					// 앞의 값을 확인할 때는indexOf, 뒤의 값을 제어할 때는 lastOf를 사용한다.
					$(".err_msg").eq(4).text("휴대폰 번호가 유효하지 않습니다")
 										.css("display","block")
	 									.css("color","tomato")
	 									.css("text-align","right");
					return false;
				} else if (!(phone.length == 10 || phone.length == 11)) {
					$(".err_msg").eq(4).text("(-)를 제외한 10~11자리의 숫자를입력해주세요")
						.css("display","block")
						.css("color","tomato")
						.css("text-align","right");
					return false;
				} else if (!regPhone.test(phone)) {
					$(".err_msg").eq(4).text("8~11자리의 올바른 번호를 입력해 주세요")
					 					.css("display","block")
		 			 					.css("color","tomato")
		 			 					.css("text-align","right");
					return false;
				} else {
					$(".err_msg").eq(4).text("사용할 수 있는 번호입니다")
				 	   .css("display","block")
					   .css("color","dodgerblue")
				 	   .css("text-align","right");
				}
			});
			
			/* //이메일 유효성 체크
			$("#email_id").blur(function () {
				var email = $.trim($(this).val());
				var url = $.trim($("#email_url").val());
				
				var regEmpty = /\s/g; //공백문자 정규식
				var regEmail = RegExp(/^[a-zA-Z0-0._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i); //이메일 정규식
				
				if(email ==""|| email.length == 0){
					$(".err_msg").eq(5).text("필수입력 정보입니다.")
								 .css("display","block")
					 			 .css("color","tomato")
					 			 .css("text-align","right");
					return false;
				} else if (email.match(regEmpty)) {
					$(".err_msg").eq(5).text("공백 없이 입력해 주세요.")
								 .css("display","block")
					 			 .css("color","tomato")
					 			 .css("text-align","right");
					return false;
				} else if (url!= "" || url.length != 0) {
					var fullMail = email+"@"+url;
					if (!regEmail.test(fullmail)) {
						$(".err_msg").eq(5).text("올바른 이메일을 입력해 주세요")
									 	   .css("display","block")
										   .css("color","dodgerblue")
									 	   .css("text-align","right");
						return false;
					} else {
						$(".err_msg").eq(5).text("사용하실 수 있는 이메일 입니다")
									 	   .css("display","block")
										   .css("color","dodgerblue")
									 	   .css("text-align","right");
					}
				} else {
					$(".err_msg").eq(5).text("사용하실 수 있는 이메일 입니다. URL도 입력해주세요.")
								 	   .css("display","block")
									   .css("color","dodgerblue")
								 	   .css("text-align","right");
				}
			});
			
			//email관련 설정(직접입력)
			$("#selmail").change(function () {
				var eUrl = $(this).val();
				if(eUrl=="directVal"){
					$("#email_url").val('');
					$("#email_url").focus();
					$("#email_url").removeAttr('readonly');
				} else {
					$("#email_url").val(eUrl);
					$("#email_url").prop('readonly',true);
				}
			}) */

			// 동의버튼 체크했는지 안했는지 유효검사
			$('.check_label').click(function(){
				var ckAll = $('#agree_btn').is(':checked');
				
				if(ckAll == false) {
					$('.join_btn').css("background","#f9c00c")
								  .css("cursor","pointer");
				} else if (ckAll == true) {
					$('.join_btn').css("background","rgb(221,221,221)")
								  .css("cursor","not-allowed");
				}
			});
			/* 회원가입버튼 눌렀을 때 다음 페이지로 이동하게 유효성 검사 */
			/* location.href = "memberPlay.one"; */
		});
		
		function ajaxCheck(id){
			$.ajax({
				url: "idCheck.one",
				// 아이디가 중복된 아이디인지 아닌지 판단하는 역할(Action)
				type: "POST",
				// 포장한 데이터를 어떤 운송수단(어떻게 보낼지)으로 태워 보낼지 정하는 것이 타입.
				dataType: "json",
				// 어떤방식으로 데이터를 포장할지 정하는 것이 데이터타입.
				data: "id="+id,
				// 데이터는 id라는 이름을 붙여서 보냄. 쿼리스트링처럼 보내는 것을 나눠서 적은 것과 같다.
				success: function(data){
					// url에서 성공시 매개변수로 data를 받아와서 검사해주는 기능
					if(data.message =="-1"){
						$(".err_msg").eq(0).text("이미 사용중인 아이디 입니다.");
						$("#err_msg").select();
						$("#err_msg").css("display","block")
									 .css("color","tomato")
									 .css("text-align","right");
					} else {
						$(".err_msg").eq(0).text("멋진 아이디네요!")
									 .css("display","block")
						 			 .css("color","dodgerblue")
						 			 .css("text-align","right");
					}
				},
				error: function(){
					alert("System Error!");
				}
			});
		}
	</script>
</body>
</html>