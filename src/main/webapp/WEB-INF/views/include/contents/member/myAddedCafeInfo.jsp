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
		<c:if test="${CafeList.size() == 0}">
		승인된 카페가 없습니다.
		</c:if>
	
	<c:forEach var="myWaitingCafe" items="${CafeList}">
	<table id="info">
		<tr>
			<td id="title">카페 아이디</td>
			<td>${myWaitingCafe.getCafe_id() }</td>
		</tr>

		<tr>
			<td id="title">오너 아이디</td>
			<td>${myWaitingCafe.getOwner_id() }</td>
		</tr>

		<tr>
			<td id="title">카페 이름</td>
			<td>${myWaitingCafe.getCafe_name() }</td>
		</tr>

		<tr>
			<td id="title">카페 위지</td>
			<td>${myWaitingCafe.getGu() }, ${myWaitingCafe.getAddress() }</td>
		</tr>

		<tr>
			<td id="title">카페 행사여부</td>
			<td>${myWaitingCafe.isEvent() }</td>
		</tr>

		<tr>
			<td id="title">카페 홈페이지 주소</td>
			<td>${myWaitingCafe.getHomepage() }</td>
		</tr>
		<tr>
			<td id="title">카페 소개글</td>
			<td>${myWaitingCafe.getIntro() }</td>
		</tr>
		<tr>
			<td id="title">콘센트</td>
			<td>${myWaitingCafe.isConcent() }</td>
		</tr>
		<tr>
			<td id="title">반려동물 허용</td>
			<td>${myWaitingCafe.isPet() }</td>
		</tr>
		<tr>
			<td id="title">좌석 수</td>
			<td>${myWaitingCafe.getSeat() }</td>
		</tr>
		<tr>
			<td id="title">와이파이</td>
			<td>${myWaitingCafe.isWifi() }</td>
		</tr>
		<tr>
			<td id="title">주차장 여부</td>
			<td>${myWaitingCafe.isParking_zone() }</td>
		</tr>
		<tr>
			<td id="title">흠연실 여부</td>
			<td>${myWaitingCafe.isSmoking_room() }</td>
		</tr>
		<tr>
			<td id="title">화장실</td>
			<td>${myWaitingCafe.getToilet() }</td>
		</tr>
		<tr>
			<td id="title">카페 등록일</td>
			<td>${myWaitingCafe.getCreate_time() }</td>
		</tr>

	</table>
	<hr/>
	</c:forEach>

</center>
<br>