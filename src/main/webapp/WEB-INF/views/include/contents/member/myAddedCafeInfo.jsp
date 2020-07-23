<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</style>

<jsp:include page="myPageTopButton.jsp" flush="false"/>

<center>
	<br> <br> <b><font size="6" color="gray">내 카페</font></b> <br>
	<br> <br>
		<c:if test="${myAddedCafeList.size() == 0}">
		승인된 카페가 없습니다.
		</c:if>
	
	<c:forEach var="myAddedCafe" items="${myAddedCafeList}">
	<table id="info">
		<tr>
			<td id="title">카페 아이디</td>
			<td>${myAddedCafe.getCafe_id() }</td>
		</tr>

		<tr>
			<td id="title">오너 아이디</td>
			<td>${myAddedCafe.getOwner_id() }</td>
		</tr>

		<tr>
			<td id="title">카페 이름</td>
			<td>${myAddedCafe.getCafe_name() }</td>
		</tr>

		<tr>
			<td id="title">카페 위지</td>
			<td>${myAddedCafe.getGu() }, ${myAddedCafe.getAddress() }</td>
		</tr>


		<tr>
			<td id="title">카페 행사여부</td>
			<td>${myAddedCafe.isEvent() }</td>
		</tr>

		<tr>
			<td id="title">카페 홈페이지 주소</td>
			<td>${myAddedCafe.getHomepage() }</td>
		</tr>
		<tr>
			<td id="title">카페 소개글</td>
			<td>${myAddedCafe.getIntro() }</td>
		</tr>
		<tr>
			<td id="title">콘센트</td>
			<td>${myAddedCafe.isConcent() }</td>
		</tr>
		<tr>
			<td id="title">반려동물 허용</td>
			<td>${myAddedCafe.isPet() }</td>
		</tr>
		<tr>
			<td id="title">좌석 수</td>
			<td>${myAddedCafe.getSeat() }</td>
		</tr>
		<tr>
			<td id="title">와이파이</td>
			<td>${myAddedCafe.isWifi() }</td>
		</tr>
		<tr>
			<td id="title">주차장 여부</td>
			<td>${myAddedCafe.isParking_zone() }</td>
		</tr>
		<tr>
			<td id="title">흡연실 여부</td>
			<td>${myAddedCafe.getSmoking_room() }</td>
		</tr>
		<tr>
			<td id="title">화장실</td>
			<td>${myAddedCafe.getToilet() }</td>
		</tr>
		<tr>
			<td id="title">카페 등록일</td>
			<td>${myAddedCafe.getCreate_time() }</td>
		</tr>

	</table>
	<hr/>
	</c:forEach>

</center>
<br>