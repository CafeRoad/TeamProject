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

<p />
<p />
<p />
<p />
<p />
<p />
<p />
<p />
<center>
	<c:url var="owner" value="OWNER"/>
	<button type="button" class="btn btn-warning" onclick="location.href='/myPage'">내정보</button>
	<button type="button" class="btn btn-primary">내가쓴리뷰</button>
	<button type="button" class="btn btn-secondary">즐겨찾기</button>
	<c:if test="${signedMember.getAuthority().equals(owner)}">
	<button type="button" class="btn btn-warning" onclick="location.href='/cafe/searchMyAddedCafes'">내카페</button>
	<button type="button" class="btn btn-warning" onclick="location.href='/cafe/searchMyWatingCafes'">대기중인 카페.</button>
	</c:if>
</center>

<center>
	<br> <br> <b><font size="6" color="gray">내 카페</font></b> <br>
	<br> <br>
		<c:if test="${myAddedCafeList == null}">
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
			<td id="title">카페 SNS</td>
			<td>${myAddedCafe.getSns() }</td>
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
			<td id="title">지역화페 가능 여부</td>
			<td>${myAddedCafe.isLocal_money() }</td>
		</tr>
		<tr>
			<td id="title">주차장 여부</td>
			<td>${myAddedCafe.isParking_zone() }</td>
		</tr>
		<tr>
			<td id="title">스터디룸 수</td>
			<td>${myAddedCafe.getSdutyroom() }</td>
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