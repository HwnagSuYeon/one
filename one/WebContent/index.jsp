<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jsp는 인클루드로 가져와야함 -->
<%@ include file="include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css연결은 링크로 가져옴 -->
<link rel="stylesheet" href="css/index.css?v=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	<section class="section_wrap">
		<nav class="section_nav">
			<div class="section_nav_wrap">
				<div class="nav_menu">
					<a href="#" class="menu_content"><span class="recomend">추천</span></a>
					<a href="#" class="menu_content"><span class="area">취미</span></a>
					<a href="#" class="menu_content"><span class="interest">여행</span></a>
				</div>
			</div>
		</nav>

		<!-- 슬라이드 캐러셀 -->
		<div class="main_wrap">
			<main class="main_content"> <!-- 최상단 슬라이드 캐러셀 -->
			<div class="slide_img">
				<div class="slide_wrap">
					<div class="bs-example">
						<div id="myCarousel" class="carousel slide" data-ride="carousel">
							<!-- Wrapper for carousel items -->
							<div class="carousel-inner">
								<div class="item active">
									<img src="images/carousel/one_banner1.jpg" alt="First Slide">
								</div>
								<div class="item">
									<img src="images/carousel/one_banner2.jpg" alt="Second Slide">
								</div>
								<div class="item">
									<img src="images/carousel/one_banner3.jpg" alt="Third Slide">
								</div>
							</div>
							<!-- Carousel indicators -->
							<ol class="carousel-indicators">
								<li id="list_btn" data-target="#myCarousel" data-slide-to="0"
									class="active"></li>
								<li id="list_btn" data-target="#myCarousel" data-slide-to="1"></li>
								<li id="list_btn" data-target="#myCarousel" data-slide-to="2"></li>
							</ol>
							<!-- Carousel controls -->
							<a class="carousel-control left" href="#myCarousel"
								data-slide="prev"> <i class="fas fa-chevron-left"></i>
							</a> <a class="carousel-control right" href="#myCarousel"
								data-slide="next"> <i class="fas fa-chevron-right"></i>
							</a>
						</div>
					</div>
				</div>
			</div>

			<!-- best class -->
			<div class="pick">
				<div style="opacity: 1; display: block;">
					<div>
						<section class="pick_wrap">
							<div class="pick_title" style="font-size: 14px;">
								<div style="font-size: 18px;">
									<h2 class="main_title">BEST class</h2>
								</div>
								<div style="margin-top: 20px;">
									<a class="side_title" href="#">전체보기</a>
								</div>
							</div>
							<div class="pick_content">
								<c:forEach items="${bestList}" var="best">
								<!-- ${bestlist}->컨트롤러에서 보내준 베스트 상품 /var->변수이름을 정해줌 -->
									<div class="content_card">
										<a href="#" class="content_anker">
											<div class="anker_wrap">
												<div class="content_img_wrap">
													<div class="heart_wrap">
														<span class="spot_name"> 성동구 <span> </span>
														</span>
														<button class="heart" style="width: 24px; height: 24px;">
															<i class="far fa-heart"></i>
														</button>
													</div>
													<div class="content_img">
														<img src="images/pick/${best.p_img}">
													</div>
												</div>
												<div class="small_title">${best.p_sidename}</div>
												<div class="big_title">${best.p_name}</div>
												<div class="price_wrap">
													<span class="price"> <span>${best.p_price}</span>
													</span>
												</div>
												<div class="star_score">
													<div class="star_wrap">
														<i class="fas fa-star"></i> <span>4.52</span>
													</div>
												</div>
											</div>
										</a>
									</div>
								</c:forEach>


							</div>
						</section>
					</div>
				</div>
			</div>
			
			<!-- 최신등록 클래스 -->
			<div class="pick">
				<div style="opacity: 1; display: block;">
					<div>
						<section class="pick_wrap">
							<div class="pick_title" style="font-size: 14px;">
								<div style="font-size: 18px;">
									<h2 class="main_title">NEW class</h2>
								</div>
								<div style="margin-top: 20px;">
									<a class="side_title" href="#">전체보기</a>
								</div>
							</div>
							<div class="pick_content">
								<c:forEach items="${newList}" var="newPdt">
								<!-- ${bestlist}->컨트롤러에서 보내준 베스트 상품 /var->변수이름을 정해줌 -->
									<div class="content_card">
										<a href="#" class="content_anker">
											<div class="anker_wrap">
												<div class="content_img_wrap">
													<div class="heart_wrap">
														<span class="spot_name"> 성동구 <span> </span>
														</span>
														<button class="heart" style="width: 24px; height: 24px;">
															<i class="far fa-heart"></i>
														</button>
													</div>
													<div class="content_img">
														<img src="images/pick/${newPdt.p_img}">
													</div>
												</div>
												<div class="small_title">${newPdt.p_sidename}</div>
												<div class="big_title">${newPdt.p_name}</div>
												<div class="price_wrap">
													<span class="price"> <span>${newPdt.p_price}</span>
													</span>
												</div>
												<div class="star_score">
													<div class="star_wrap">
														<i class="fas fa-star"></i> <span>4.52</span>
													</div>
												</div>
											</div>
										</a>
									</div>
								</c:forEach>


							</div>
						</section>
					</div>
				</div>
			</div>

			<!-- 두번째 캐러셀 -->
			<div class="slide_wrap2">
				<div class="slide_img">
					<div class="slide_wrap">
						<div class="bs-example">
							<div id="myCarousel" class="carousel slide" data-ride="carousel">
								<!-- Wrapper for carousel items -->
								<div class="carousel-inner">
									<div class="item active">
										<img src="images/carousel/one_banner4.jpg" alt="First Slide">
									</div>
									<div class="item">
										<img src="images/carousel/one_banner5.jpg" alt="Second Slide">
									</div>
									<div class="item">
										<img src="images/carousel/one_banner6.jpg" alt="Third Slide">
									</div>
								</div>
								<!-- Carousel indicators -->
								<ol class="carousel-indicators">
									<li id="list_btn" data-target="#myCarousel" data-slide-to="0"
										class="active"></li>
									<li id="list_btn" data-target="#myCarousel" data-slide-to="1"></li>
									<li id="list_btn" data-target="#myCarousel" data-slide-to="2"></li>
								</ol>
								<!-- Carousel controls -->
								<a class="carousel-control left" href="#myCarousel"
									data-slide="prev"> <i class="fas fa-chevron-left"></i>
								</a> <a class="carousel-control right" href="#myCarousel"
									data-slide="next"> <i class="fas fa-chevron-right"></i>
								</a>
							</div>
						</div>
					</div>
				</div>

			</div>


			<!-- 우리친구아이가 -->
			<div class="sns_follow">
				<div class="follow_wrap">
					<div class="sns_img">
						<a href="https://www.facebook.com/"><img
							src="images/ONE_SNS.png"></a>
					</div>
				</div>
			</div>

			<!-- 매거진 -->
			<div class="pick">
				<div style="opacity: 1; display: block;">
					<div>
						<section class="pick_wrap">
							<div class="pick_title" style="font-size: 14px;">
								<div style="font-size: 18px;">
									<h2 class="main_title">매거진</h2>
								</div>
								<div style="margin-top: 20px;">
									<a class="side_title" href="#">전체보기</a>
								</div>
							</div>
							<!-- <div class="magazine_wrap">
									<div class="magazine_card">
										<a href="#">
											<div class="magazine_content">
												<div class="magazine_img" style="opacity: 1;">
													<img class="ma1" src="images/magazine/ma1.jpg">
												</div>
												<div class="magazine_text">
													<div class="magazine_title">여름대비 스쿠버다이빙</div>
													<div class="magazine_tag">#갬성충만 #커플여행</div>
												</div>
											</div>
										</a>
									</div>
								</div> -->
						</section>
					</div>
				</div>
			</div>



			<!-- 더 많은 클래스 -->
			<div class="more_class">
				<div class="more_title">더 많은 Class를 만나보세요</div>
				<div class="more_wrap">
					<a href="#" class="more_box">
						<div class="more_box_content">
							<div class="content_inner">
								<div>5,431개의</div>
								<div>일상 Class</div>
							</div>
							<div class="men_wrap">
								<img class="men" src="images/men.png">
							</div>

						</div>
					</a> <a href="#" class="more_box">
						<div class="more_box_content">
							<img class="women" src="images/women.png">
							<div class="content_inner">
								<div>701개의</div>
								<div>여행 컨텐츠</div>
							</div>
						</div>
					</a>
				</div>
			</div>
			</main>
		</div>


		<!-- 최하단 앱배너광고 -->
		<div class="one_app">
			<div class="app_wrap" direction="row">
				<div class="app_content">
					<div class="text">
						<p>ONEforME,</p>
						<p>앱에서도 만나요.</p>
					</div>
					<div class="app_btn">
						<a class="and_wrap"
							href="https://play.google.com/store/apps?utm_source=apac_med&utm_medium=hasem&utm_content=Apr0119&utm_campaign=Evergreen&pcampaignid=MKT-DR-apac-kr-1003227-med-hasem-ap-Evergreen-Apr0119-Text_Search_BKWS-BKWS%7cONSEM_kwid_43700009359644019_creativeid_268791854615_device_c&gclid=EAIaIQobChMI1_qv-eTY4QIVTqaWCh2drwA2EAAYASAAEgJW-_D_BwE&gclsrc=aw.ds"><button
								class="a_btn android_btn"
								style="width: 160px; height: 50px; color: white;">Android</button></a>
						<a class="ios_wrap"
							href="https://itunes.apple.com/kr/genre/ios/id36?mt=8"><button
								class="a_btn ios_btn"
								style="width: 160px; height: 50px; color: white;">iOS</button></a>
					</div>
					<div class="app_img_wrap">
						<img class="app_img" src="images/app.png">
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="include/footer.jsp"%>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</body>
</html>