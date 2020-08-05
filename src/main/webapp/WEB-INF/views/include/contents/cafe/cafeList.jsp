<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="owner" value="OWNER" />
<c:url var="admin" value="ADMIN" />
<link
	href="${pageContext.request.contextPath}/resources/assets/css/test.css?ver=3"
	rel="stylesheet" type="text/css" />
<style type="text/css">
#info {
	width: 700px;
	margin-left: 150;
	margin-right: 150;
	border: 3px;
	float: none;
}

#title {
	vertical-align: middle;
	text-align: center;
	height: 50px;
	width: 150px;
}

ol, ul {
	list-style: none;
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}

hr {
	width: 80%;
}

#introNone{
text-align : left;
}

#etc{
margin-bottom : px;
}
</style>

<center>
	<br><br><br><br> <br> <b><font size="6" color="gray">${cafeListTitle}</font></b>
	<br> 
	<c:if test="${CafeList.size() == 0}">
		카페가 없습니다.
		</c:if>

	<c:forEach var="cafe" items="${CafeList}">

		<main class="mn-toplist pg-toplist" data-restaurant_count="15">
			<article class="contents">

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
											<a href="/cafe/cafe/getSpecificCafe?cafe_id=${cafe.getCafe_id() }">
												<div class="thumb">
													<img class="center-croping lazy"
														src="${pageContext.request.contextPath}/resources/assets/cafeimg/${cafe.getCafe_id() }/${cafe.getImg_main() }" />
												</div>
											</a>
											<figcaption>
												<div class="info">
													<span class="title "> <a href="/cafe/cafe/getSpecificCafe?cafe_id=${cafe.getCafe_id() }">
															<h3>${cafe.getCafe_name() }</h3>
													</a>
													</span> <strong class="point  "> <span>${cafe.getAvg_star() }</span>
													</strong>
													<p id="etc">${cafe.getGu() },${cafe.getAddress() }</p>
												</div>
											</figcaption>
										</figure>


										<div class="review-content no-bottom">

											<figure class="users">
												<figcaption id="introNone">${cafe.getIntro() }</figcaption>
											</figure>

										</div>

									</div>
								</li>
							</ul>
						</section>
					</div>
				</div>
			</article>
		</main>
		<hr />
	</c:forEach>
	<br>
	<!-- 페이징 -->
	<table cellspacing=1 width=700 border=1>
	<tr>
		<td>
		<center>
		<c:if test="${serachPage }">
			<c:forEach var="i" begin="1" end="${t_pages }">
				<a href="/cafe/search?search=${search }&nowPage=${i }">[
					<c:if test="${i == nowPage }"><b></c:if>		
					${i }	
					<c:if test="${i == nowPage }"></b></c:if>			
			]	</a>
			</c:forEach>
		</c:if>
		
		<c:if test="${AllAddedCafe }">
			<c:forEach var="i" begin="1" end="${t_pages }">
				<a href="/cafe/searchAddedCafes?nowPage=${i }">[
					<c:if test="${i == nowPage }"><b></c:if>		
					${i }	
					<c:if test="${i == nowPage }"></b></c:if>			
			]	</a>
			</c:forEach>
		</c:if>
		
		<c:if test="${AllWaitingCafe }">
			<c:forEach var="i" begin="1" end="${t_pages }">
				<a href="/cafe/searchWaitingCafes?nowPage=${i }">[
					<c:if test="${i == nowPage }"><b></c:if>		
					${i }	
					<c:if test="${i == nowPage }"></b></c:if>			
			]	</a>
			</c:forEach>
		</c:if>
		
		<c:if test="${ownerAddedCafe }">
			<c:forEach var="i" begin="1" end="${t_pages }">
				<a href="/cafe/searchMyAddedCafes?nowPage=${i }">[
					<c:if test="${i == nowPage }"><b></c:if>		
					${i }	
					<c:if test="${i == nowPage }"></b></c:if>			
			]	</a>
			</c:forEach>
		</c:if>
		
		<c:if test="${ownerWaitingCafe}">
			<c:forEach var="i" begin="1" end="${t_pages }">
				<a href="/cafe/searchMyWaitingCafes?nowPage=${i }">[
					<c:if test="${i == nowPage }"><b></c:if>		
					${i }	
					<c:if test="${i == nowPage }"></b></c:if>			
			]	</a>
			</c:forEach>
		</c:if>
		
		<c:if test="${MyFavoriteCafe}">
			<c:forEach var="i" begin="1" end="${t_pages }">
				<a href="/cafe/myPavoriteCafe?nowPage=${i }">[
					<c:if test="${i == nowPage }"><b></c:if>		
					${i }	
					<c:if test="${i == nowPage }"></b></c:if>			
			]	</a>
			</c:forEach>
		</c:if>
		</center>
		</td>
	</tr>
</table>
	
	
	<c:if test="${signUpCafe != null}">
		<input type="button" class="btn btn-warning" value="카페 등록하기"
			onClick="location.href='/cafe/cafe/signUp'">
	</c:if>
</center>
<br>
