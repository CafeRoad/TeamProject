<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="theme-color" content="#ff792a">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta charset="EUC-KR">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/test.css" />
<link
	href="${pageContext.request.contextPath}/resources/assets/css/test.css"
	rel="stylesheet" type="text/css" />
<title>Insert title here</title>
</head>
<body>
	<main class="mn-toplist pg-toplist" data-restaurant_uuid=""
		data-restaurant_count="15" data-keyword="977_green_tea_bingsu">
		<article class="contents">
			<header class="basic-info-list">
				<div class="inner" style="padding-bottom: 10px">
					<h1 class="title">커피보다 디저트가 유명한곳</h1>
					<h2 class="desc">“세계관 최고의 케이크의 맛”</h2>
				</div>
			</header>

			<div class="container-list" id="contents_width">
				<div class="inner">
					<div class="ad_placeholder" data-platform="web_desktop"
						data-page="toplist" data-inventory="right_space"></div>

					<!-- 해당 레스토랑 목록 -->
					<section id="contents_list">

						<ul
							class="list-restaurants type-single-big top_list_restaurant_list">
							<li class="toplist_list">
								<div class="with-review">
									<figure class="restaurant-item">
										<a href="/cafe/cafe/getSpecificCafe?cafe_id="${cafe.getCafe_id() }>
											<div class="thumb">
												<img class="center-croping lazy"
													src="${pageContext.request.contextPath}/resources/assets/cafeimg/im1.jpg" />
											</div>
										</a>
										<figcaption>
											<div class="info">
												<span class="title "> <a href="/cafeimg/im1.jpg"
													onclick="trackEvent('CLICK_RESTAURANT', {&quot;position&quot;:0,&quot;restaurant_key&quot;:&quot;vsh3qH5c6Q&quot;})">
														1.
														<h3>이름란</h3>
												</a>
												</span> <strong class="point  "> <span>평점란</span>
												</strong>
												<p class="etc ">주소란</p>
											</div>
										</figcaption>
									</figure>

									<div class="review-content no-bottom">
										<figure class="user">
											<figcaption class="">닉네임란</figcaption>
										</figure>
										<p class="short_review ">
									</div>
									<a href="/cafeimg/im1.jpg" class="btn-detail"
										onclick="location.href='/cafe/idpw'">
										<div class="restaurant-more-name">민성살롱</div>
										<div class="restaurant-more-text">더보기 ></div>
									</a>
									
								</div>
							</li>
						</ul>
						<ul
							class="list-restaurants type-single-big top_list_restaurant_list">
							<li class="toplist_list">
								<div class="with-review">
									<figure class="restaurant-item">
										<a href="/cafe/test3"
											onclick="trackEvent('CLICK_RESTAURANT', {&quot;position&quot;:0,&quot;restaurant_key&quot;:&quot;vsh3qH5c6Q&quot;})">
											<div class="thumb">
												<img class="center-croping lazy"
													src="${pageContext.request.contextPath}/resources/assets/cafeimg/im1.jpg" />
											</div>
										</a>
										<figcaption>
											<div class="info">
												<span class="title "> <a href="/cafeimg/im1.jpg"
													onclick="trackEvent('CLICK_RESTAURANT', {&quot;position&quot;:0,&quot;restaurant_key&quot;:&quot;vsh3qH5c6Q&quot;})">
														1.
														<h3>이름란</h3>
												</a>
												</span> <strong class="point  "> <span>평점란</span>
												</strong>
												<p class="etc ">주소란</p>
											</div>
										</figcaption>
									</figure>

									<div class="review-content no-bottom">
										<figure class="user">
											<figcaption class="">닉네임란</figcaption>
										</figure>
										<p class="short_review ">
									</div>
									<a href="/cafeimg/im1.jpg" class="btn-detail"
										onclick="location.href='/cafe/idpw'">
										<div class="restaurant-more-name">민성살롱</div>
										<div class="restaurant-more-text">더보기 ></div>
									</a>
									</div>
									</li>
									</ul>
					</section>
				</div>
			</div>
		</article>
	</main>


</body>
</html>