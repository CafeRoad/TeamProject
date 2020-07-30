	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="owner" value="OWNER" />
<c:url var="admin" value="ADMIN" />
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

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
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=4hlerzxsxh"></script>
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
	margin:0px auto;
	margin-left:208px;
	width:1100px;
}

.content {
	width: 1100px;
	padding: 10px;
	border: 1px solid #ddd;
	font: 400 1rem/1.5rem 'NotoSansKR';
}
</style>   

	<br/><br/><br/>
<table border="1">



	<tr>
		<th rowspan="3"><a href="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg_main() }.jpg" data-lightbox="${thisCafe.getCafe_id() }" title="${thisCafe.getCafe_name() }"><img width="300" height="300" src="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg_main() }.jpg" /></a></th>
		<td>카페이름<br/><font size="6" color="gray">${thisCafe.getCafe_name() }</font></td>
	</tr>
	<tr>
		<td>인트로<br>${thisCafe.getIntro() }</td>
	</tr>

</table>
<div id="tst">
<table>
	<tr>
		<th rowspan="4" id="tst">
			<ul class="gallery">
				<c:if test="${thisCafe.getImg01() != null}"><td>
					<li><a href="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg01() }.jpg" data-lightbox="${thisCafe.getCafe_id() }" title="${thisCafe.getCafe_name() }"><img width="200" height="200" src="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg01() }.jpg" /></a></li>
				</td></c:if>
				<c:if test="${thisCafe.getImg02() != null}"><td>
					<li><a href="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg02() }.jpg" data-lightbox="${thisCafe.getCafe_id() }" title="${thisCafe.getCafe_name() }"><img width="200" height="200" src="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg02() }.jpg" /></a></li>
				</td></c:if>
				<c:if test="${thisCafe.getImg03() != null}"><td>
					<li><a href="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg03() }.jpg" data-lightbox="${thisCafe.getCafe_id() }" title="${thisCafe.getCafe_name() }"><img width="200" height="200" src="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg03() }.jpg" /></a></li>
				</td></c:if>
				<c:if test="${thisCafe.getImg04() != null}"><td>
					<li><a href="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg04() }.jpg" data-lightbox="${thisCafe.getCafe_id() }" title="${thisCafe.getCafe_name() }"><img width="200" height="200" src="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg04() }.jpg" /></a></li>
				</td></c:if>
				<c:if test="${thisCafe.getImg05() != null}"><td>
					<li><a href="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg05() }.jpg" data-lightbox="${thisCafe.getCafe_id() }" title="${thisCafe.getCafe_name() }"><img width="200" height="200" src="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg05() }.jpg" /></a></li>
				</td></c:if>
				<c:if test="${thisCafe.getImg06() != null}"><td>
					<li><a href="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg06() }.jpg" data-lightbox="${thisCafe.getCafe_id() }" title="${thisCafe.getCafe_name() }"><img width="200" height="200" src="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg06() }.jpg" /></a></li>
				</td></c:if>
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
		<td colspan=2>TEL: 카페에도 tel 칼럼 추가해야함.</td>
	</tr>
	<tr>
		<td>영업시간: 연업시간 칼럼 추가해야함.</td>
		<td>행사여부: <c:if test="${thisCafe.isEvent() }">행사중이예요</c:if><c:if test="${!thisCafe.isEvent() }">행사중이 아니예요</c:if></td>
	</tr>
</table>
<table>
	<tr>
		<td>가능한서비스<c:if test="${thisCafe.isPet() }"><img
			src="/cafe/resources/assets/cafeimg/cafe_option/1.png" width="50px"
			height="50px"></c:if> <c:if test="${thisCafe.isSmoking_room() }"><img
			src="/cafe/resources/assets/cafeimg/cafe_option/2.png" width="50px"
			height="50px"></c:if> <c:if test="${thisCafe.isConcent() }"><img
			src="/cafe/resources/assets/cafeimg/cafe_option/3.png" width="50px"
			height="50px"></c:if> <c:if test="${thisCafe.isParking_zone() }"><img
			src="/cafe/resources/assets/cafeimg/cafe_option/4.png" width="50px"
			height="50px"></c:if> <c:if test="${thisCafe.isToilet() }"><img
			src="/cafe/resources/assets/cafeimg/cafe_option/5.png" width="50px"
			height="50px"></c:if> <c:if test="${thisCafe.isWifi() }"><img
			src="/cafe/resources/assets/cafeimg/cafe_option/6.png" width="50px"
			height="50px"></c:if></td>
	</tr>
</table>
<br>
<br>
<br>

////////////////여기서부터 리뷰


<div align="center">
<td>
소소한리뷰
</td>
</div>
<br>
<br>
<table>
	<tr>
		<td>
			<h2>리뷰제목</h2>
		</td>
		<td>
			<h4>작성자</h4>
		</td>
	</tr>

</table>
<div class="box">
	<div class="content">더보고싶어?더보고싶어?더보고싶어?더보고싶어?더보고싶어?
	더보고싶어?더보고싶어?더보고싶어?더보고싶어?
	더보고싶어?더보고싶어?더보고싶어?더보고싶어싫어 보지마 보지말라고 뭘봐 변태새기야</div>
</div>

<table>
	<tr>
		<td>
			<h2>리뷰제목</h2>
		</td>
		<td>
			<h4>작성자</h4>
		</td>
	</tr>

</table>
<div class="box">
	<div class="content">더보고싶어?더보고싶어?더보고싶어?더보고싶어?더보고싶어?
	더보고싶어?더보고싶어?더보고싶어?더보고싶어?
	더보고싶어?더보고싶어?더보고싶어?더보고싶어싫어 보지마 보지말라고 뭘봐 변태새기야</div>
</div>


<br><br><br>////// 여기는 맵.


<div id="map" style="width:80%;height:400px; margin:0px auto"></div>

<script>
var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.5707075, 126.9813879),
    zoom: 15
});

var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(37.5707075, 126.9813879),
    map: map
});
</script>

<div>
<br><br><br>
</div>




	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	<hr/>
	<!-- 반복문으로 현재 cafe의 id로 리뷰 뽑아서 반복문 출력. include -->
	<jsp:include page="/WEB-INF/views/include/contents/review/reviewsList.jsp"></jsp:include>	
	
	<!-- 리뷰 쓰는 폼 . include -->
	<c:if test="${newReviewVO != null }">
	<jsp:include page="/WEB-INF/views/include/contents/review/newReviewForm.jsp"></jsp:include>	
	</c:if>
	<br>
	<c:if test="${approveCafe != null}">
	<c:if test="${signedMember.getAuthority().equals(admin)}">
		<button type="button" class="btn btn-warning" onclick="location.href='/cafe/approveCafeAction?cafe_id=${thisCafe.getCafe_id() }'">카페 승인하기</button>
	</c:if>
	
	</c:if>
	
	<c:if test="${signedMember.getId().equals(thisCafe.getOwner_id()) || signedMember.getAuthority().equals(admin)}">
		<input type="button" class="btn btn-warning" value="카페 삭제하기(아직 컨트롤러 미구현)" onClick="location.href='/cafe/cafe/deleteCafeAction?cafe_id${cafe.getCafe_id() }'">
	</c:if>
	
</center>
<br>