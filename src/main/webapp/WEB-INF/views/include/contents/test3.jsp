<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="owner" value="OWNER" />
<c:url var="admin" value="ADMIN" />
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<!-- <table border="1" width="700">
	<tr align="left">
		<td style="width:300px; height:300px; margin-left:350px; border:3px solid black;"><img
			src="${pageContext.request.contextPath}/resources/assets/cafeimg/im1.jpg"
			alt="" style="width:300px; height:300px; margin-left:350px;"/>
		</td>
		<td align="left">
		123
		</td>
	</tr>
	<tr>
	<td align="left">
		dd
		</td>
	</tr>






</table> -->
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
<table border="1">

	<!--<<tr>
		<th colspan="2">지역별 홍차</th>
	</tr>-->
	<tr>
		<th rowspan="3"><img
			src="${pageContext.request.contextPath}/resources/assets/cafeimg/im1.jpg"
			alt="" style="width: 300px; height: 300px;" /></th>
		<td>카페이름1</td>
	</tr>
	<tr>
		<td>인트로</td>
	</tr>

</table>
<table id="tst">
	<tr>
		<th rowspan="4" id="tst">
			<ul class="gallery">
				<td>
					<li><a href="/cafe/resources/assets/cafeimg/2/main.jpg"
						data-lightbox="2" title="???"><img width="200" height="200"
							src="/cafe/resources/assets/cafeimg/2/main.jpg" /></a></li>
				</td>
				<td>
					<li><a href="/cafe/resources/assets/cafeimg/2/01.jpg"
						data-lightbox="2" title="???"><img width="200" height="200"
							src="/cafe/resources/assets/cafeimg/2/01.jpg" /></a></li>
				</td>
				<td>
					<li><a href="/cafe/resources/assets/cafeimg/2/02.jpg"
						data-lightbox="2" title="???"><img width="200" height="200"
							src="/cafe/resources/assets/cafeimg/2/02.jpg" /></a></li>
				</td>
				<td>
					<li><a href="/cafe/resources/assets/cafeimg/2/03.jpg"
						data-lightbox="2" title="???"><img width="200" height="200"
							src="/cafe/resources/assets/cafeimg/2/03.jpg" /></a></li>
				</td>
				<td>
					<li><a href="/cafe/resources/assets/cafeimg/2/04.jpg"
						data-lightbox="2" title="???"><img width="200" height="200"
							src="/cafe/resources/assets/cafeimg/2/04.jpg" /></a></li>
				</td>
				<td>
					<li><a href="/cafe/resources/assets/cafeimg/2/05.jpg"
						data-lightbox="2" title="???"><img width="200" height="200"
							src="/cafe/resources/assets/cafeimg/2/05.jpg" /></a></li>
				</td>
				<td>
					<li><a href="/cafe/resources/assets/cafeimg/2/06.jpg"
						data-lightbox="2" title="???"><img width="200" height="200"
							src="/cafe/resources/assets/cafeimg/2/06.jpg" /></a></li>
				</td>
				<td>
					<li><a href="/cafe/resources/assets/cafeimg/2/07.jpg"
						data-lightbox="2" title="???"><img width="200" height="200"
							src="/cafe/resources/assets/cafeimg/2/07.jpg" /></a></li>
				</td>
				<td>
					<li><a href="/cafe/resources/assets/cafeimg/2/08.jpg"
						data-lightbox="2" title="???"><img width="200" height="200"
							src="/cafe/resources/assets/cafeimg/2/08.jpg" /></a></li>
				</td>
				<td>
					<li><a href="/cafe/resources/assets/cafeimg/2/09.jpg"
						data-lightbox="2" title="???"><img width="200" height="200"
							src="/cafe/resources/assets/cafeimg/2/09.jpg" /></a></li>
				</td>
			</ul>
		</th>
	</tr>
</table>
<br>
<br>
<table id="cell">
	<tr>
		<td>주소: ㅁㅁ</td>
		<td>홈페이지:</td>
	</tr>
	<tr>
		<td colspan=2>TEL: ㅁㅁ</td>
	</tr>
	<tr>
		<td>영업시간: ㅁㅁ</td>
		<td>행사여부:</td>
	</tr>
</table>
<table>
	<tr>
		<td>가능한서비스<img
			src="/cafe/resources/assets/cafeimg/cafe_option/1.png" width="50px"
			height="50px"> <img
			src="/cafe/resources/assets/cafeimg/cafe_option/2.png" width="50px"
			height="50px"> <img
			src="/cafe/resources/assets/cafeimg/cafe_option/3.png" width="50px"
			height="50px"> <img
			src="/cafe/resources/assets/cafeimg/cafe_option/4.png" width="50px"
			height="50px"> <img
			src="/cafe/resources/assets/cafeimg/cafe_option/5.png" width="50px"
			height="50px"> <img
			src="/cafe/resources/assets/cafeimg/cafe_option/6.png" width="50px"
			height="50px"></td>
	</tr>
</table>
<br>
<br>
<br>
<table>
	<tr>
		<td>
			<h1>소소한리뷰</h1>
		</td>
	</tr>
</table>
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
<br><br><br>
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






