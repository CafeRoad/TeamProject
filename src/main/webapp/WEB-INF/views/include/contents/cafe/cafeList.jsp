<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:url var="owner" value="OWNER"/>
	<c:url var="admin" value="ADMIN"/>
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
	height : 50px;
	width : 150px;
	
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
</style>

<center>
	<br> <br> <b><font size="6" color="gray">${cafeListTitle}</font></b>
	<br><br> <br>
		<c:if test="${CafeList.size() == 0}">
		카페가 없습니다.
		</c:if>
	
	<c:forEach var="cafe" items="${CafeList}">
	<table id="info">
		<div class="example">
			<a href="${pageContext.request.contextPath}/resources/assets/cafeimg/${cafe.getCafe_id() }/${cafe.getImg_main() }.jpg" data-lightbox="image-1" title="${cafe.getCafe_name() }"><img width="400" height="400" src="${pageContext.request.contextPath}/resources/assets/cafeimg/${cafe.getCafe_id() }/${cafe.getImg_main() }.jpg" /></a>
		</div>
		<tr>
			<td id="title">카페 아이디</td>
			<td>${cafe.getCafe_id() }</td>
		</tr>

		<tr>
			<td id="title">오너 아이디</td>
			<td>${cafe.getOwner_id() }</td>
		</tr>
		<tr>
			<td id="title">카페 이름</td>
			<td><button type="button" class="btn btn-warning" onclick="location.href='/cafe/cafe/getSpecificCafe?cafe_id=${cafe.getCafe_id() }'">${cafe.getCafe_name() }</button></td>
		</tr>
		<tr>
			<td id="title">카페 위지</td>
			<td>${cafe.getGu() }, ${cafe.getAddress() }</td>
		</tr>

		<tr>
			<td id="title">카페 행사여부</td>
			<td>${cafe.isEvent() }</td>
		</tr>

		<tr>
			<td id="title">카페 홈페이지 주소</td>
			<td>${cafe.getHomepage() }</td>
		</tr>
		<tr>
			<td id="title">카페 소개글</td>
			<td>${cafe.getIntro() }</td>
		</tr>
		<tr>
			<td id="title">콘센트</td>
			<td>${cafe.isConcent() }</td>
		</tr>
		<tr>
			<td id="title">반려동물 허용</td>
			<td>${cafe.isPet() }</td>
		</tr>
		<tr>
			<td id="title">와이파이</td>
			<td>${cafe.isWifi() }</td>
		</tr>
		<tr>
			<td id="title">주차장 여부</td>
			<td>${cafe.isParking_zone() }</td>
		</tr>
		<tr>
			<td id="title">흠연실 여부</td>
			<td>${cafe.isSmoking_room() }</td>
		</tr>
		<tr>
			<td id="title">화장실</td>
			<td>${cafe.isToilet() }</td>
		</tr>
		<tr>
			<td id="title">카페 등록일</td>
			<td>${cafe.getCreate_time() }</td>
		</tr>

	</table>
	<button type="button" class="btn btn-warning" onclick="location.href='/cafe/cafe/toggleFavorite?cafe_id=${cafe.getCafe_id() }'">즐겨찾기</button>

	<hr/>
	</c:forEach>
	<br>
	<c:if test="${signUpCafe != null}">
		<input type="button" class="btn btn-warning" value="카페 등록하기" onClick="location.href='/cafe/cafe/signUp'">
	</c:if>
</center>
<br>