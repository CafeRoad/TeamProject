
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="owner" value="OWNER" />
<c:url var="admin" value="ADMIN" />
<c:url var="user" value="USER"/>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<style type="text/css">
strong {
	font-weight: normal;
	color : #ed7d31;
}
</style>

<script text="javascript/text">
	$(document)
			.ready(
					function() {

						$('.box')
								.each(
										function() {
											var content = $(this).children(
													'.content');
											var content_txt = content.text();
											var content_txt_short = content_txt
													.substring(0, 50)
													+ "...";
											var btn_more = $('<a href="javascript:void(0)" class="more">더보기</a>');

											$(this).append(btn_more);

											if (content_txt.length >= 100) {
												content.html(content_txt_short)

											} else {
												btn_more.hide()
											}

											btn_more.click(toggle_content);
											// 아래 bind가 안 되는 이유는??
											// btn_more.bind('click',toggle_content);

											function toggle_content() {
												if ($(this).hasClass('short')) {
													// 접기 상태
													$(this).html('더보기');
													content
															.html(content_txt_short)
													$(this)
															.removeClass(
																	'short');
												} else {
													// 더보기 상태
													$(this).html('접기');
													content.html(content_txt);
													$(this).addClass('short');

												}
											}
										});
					});
</script>

<style>
table {
	margin: 0px auto;
	width: 1100px;
}

th {
	width: 300px;
	vertical-align: top;
}

td {
	
}

ul, li, td {
	list-style: none;
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}

#tst {
	width: 95%;
	margin-left: 0px;
}

#cell tr td {
	padding: 20px;
}

.box {
	margin: 0px auto;
	width: 1100px;
}

.content {
	width: 1100px;
	padding: 10px;
	border: 1px solid #ddd;
	font: 400 1rem/1.5rem 'NotoSansKR';
}
#map{
margin: 0px auto;
width: 1100px;
height:400px;
}
</style>

<br />
<br />
<br />
<table border="1">



	<tr>
		<th rowspan="3"><a
			href="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg_main() }"
			data-lightbox="${thisCafe.getCafe_id() }"
			title="${thisCafe.getCafe_name() }"><img width="300" height="300"
				src="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg_main() }" /></a></th>
		<td height="30px"><br />
			<h2>${thisCafe.getCafe_name() } <strong class="point  "> <span>${thisCafe.getAvg_star() }</span></strong></h2></td>
	</tr>
	<tr>
		<td>카페소개<br>${thisCafe.getIntro() }</td>
	</tr>

</table>
<div id="tst">
	<table>
		<tr>
			<th rowspan="4" id="tst">
				<ul class="gallery">
					<c:if test="${thisCafe.getImg01() != null}">
						<td>
							<li><a
								href="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg01() }"
								data-lightbox="${thisCafe.getCafe_id() }"
								title="${thisCafe.getCafe_name() }"><img width="200"
									height="200"
									src="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg01() }" /></a></li>
						</td>
					</c:if>
					<c:if test="${thisCafe.getImg02() != null}">
						<td>
							<li><a
								href="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg02() }"
								data-lightbox="${thisCafe.getCafe_id() }"
								title="${thisCafe.getCafe_name() }"><img width="200"
									height="200"
									src="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg02() }" /></a></li>
						</td>
					</c:if>
					<c:if test="${thisCafe.getImg03() != null}">
						<td>
							<li><a
								href="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg03() }"
								data-lightbox="${thisCafe.getCafe_id() }"
								title="${thisCafe.getCafe_name() }"><img width="200"
									height="200"
									src="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg03() }" /></a></li>
						</td>
					</c:if>
					<c:if test="${thisCafe.getImg04() != null}">
						<td>
							<li><a
								href="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg04() }"
								data-lightbox="${thisCafe.getCafe_id() }"
								title="${thisCafe.getCafe_name() }"><img width="200"
									height="200"
									src="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg04() }" /></a></li>
						</td>
					</c:if>
					<c:if test="${thisCafe.getImg05() != null}">
						<td>
							<li><a
								href="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg05() }"
								data-lightbox="${thisCafe.getCafe_id() }"
								title="${thisCafe.getCafe_name() }"><img width="200"
									height="200"
									src="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg05() }" /></a></li>
						</td>
					</c:if>
					<c:if test="${thisCafe.getImg06() != null}">
						<td>
							<li><a
								href="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg06() }"
								data-lightbox="${thisCafe.getCafe_id() }"
								title="${thisCafe.getCafe_name() }"><img width="200"
									height="200"
									src="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg06() }" /></a></li>
						</td>
					</c:if>
				</ul>
			</th>
		</tr>
	</table>
</div>
<br>
<br>
<table id="cell">
	<tr>
		<td>주소: ${thisCafe.getGu() }, ${thisCafe.getAddress() }</td>
		<td>홈페이지: ${thisCafe.getHomepage() }</td>
	</tr>
	<tr>
		<td colspan=2>TEL: ${thisCafe.getCafe_tel() }</td>
	</tr>
	<tr>
		<td>영업시간: ${thisCafe.getOperating_time() }</td>
		<td>행사여부: <c:if test="${thisCafe.isEvent() }">행사중이에요</c:if><c:if test="${!thisCafe.isEvent() }">행사중이 아니예요</c:if></td>
	</tr>
</table>
<table>
	<tr>
		<td>가능한서비스<c:if test="${thisCafe.isPet() }">
				<img src="/cafe/resources/assets/cafeimg/cafe_option/1.png"
					width="50px" height="50px">
			</c:if> <c:if test="${thisCafe.isSmoking_room() }">
				<img src="/cafe/resources/assets/cafeimg/cafe_option/2.png"
					width="50px" height="50px">
			</c:if> <c:if test="${thisCafe.isConcent() }">
				<img src="/cafe/resources/assets/cafeimg/cafe_option/3.png"
					width="50px" height="50px">
			</c:if> <c:if test="${thisCafe.isParking_zone() }">
				<img src="/cafe/resources/assets/cafeimg/cafe_option/4.png"
					width="50px" height="50px">
			</c:if> <c:if test="${thisCafe.isToilet() }">
				<img src="/cafe/resources/assets/cafeimg/cafe_option/5.png"
					width="50px" height="50px">
			</c:if> <c:if test="${thisCafe.isWifi() }">
				<img src="/cafe/resources/assets/cafeimg/cafe_option/6.png"
					width="50px" height="50px">
			</c:if></td>
	</tr>
</table>
<br>
<br>
<br>

<hr />
<!-- 반복문으로 현재 cafe의 id로 리뷰 뽑아서 반복문 출력. include -->
<jsp:include
	page="/WEB-INF/views/include/contents/review/reviewsList.jsp"></jsp:include>

<!-- 리뷰 쓰는 폼 . include -->
<c:if test="${signedMember.getAuthority().equals(user)}">
<c:if test="${newReviewVO != null }">
	<jsp:include
		page="/WEB-INF/views/include/contents/review/newReviewForm.jsp"></jsp:include>
</c:if>
</c:if>
<hr/>
 
<div id="map"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=289c6156b2ff5730bd08da63f6fe048b&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${thisCafe.getGu() }, ${thisCafe.getAddress() }', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });
     // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${thisCafe.getCafe_name() }</div>'
        });
        infowindow.open(map, marker);
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>


<center>

<br>
<c:if test="${approveCafe != null}">
	<c:if test="${signedMember.getAuthority().equals(admin)}">
		<input type="button" class="btn btn-warning"
			onclick="location.href='/cafe/approveCafeAction?cafe_id=${thisCafe.getCafe_id() }'" value="카페 승인하기"/>
	</c:if>

</c:if>

<c:if
	test="${signedMember.getId().equals(thisCafe.getOwner_id()) || signedMember.getAuthority().equals(admin)}">
	<input type="button" class="btn btn-warning"
		value="카페 삭제하기"
		onClick="location.href='/cafe/cafe/deleteCafeAction?cafe_id${cafe.getCafe_id() }'">
</c:if>

</center>
<br>