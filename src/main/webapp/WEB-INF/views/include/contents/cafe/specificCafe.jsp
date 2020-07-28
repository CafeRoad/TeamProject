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

ul, li, td {
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
	<br> <br> <b><font size="6" color="gray">${thisCafe.getCafe_name() }</font></b>
	<br><br> <br>
			<a href="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg_main() }.jpg" data-lightbox="${thisCafe.getCafe_id() }" title="${thisCafe.getCafe_name() }"><img width="400" height="400" src="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg_main() }.jpg" /></a>
<table>
	<tr>
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
			<c:if test="${thisCafe.getImg07() != null}"><td>
				<li><a href="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg07() }.jpg" data-lightbox="${thisCafe.getCafe_id() }" title="${thisCafe.getCafe_name() }"><img width="200" height="200" src="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg07() }.jpg" /></a></li>
			</td></c:if>
			<c:if test="${thisCafe.getImg08() != null}"><td>
				<li><a href="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg08() }.jpg" data-lightbox="${thisCafe.getCafe_id() }" title="${thisCafe.getCafe_name() }"><img width="200" height="200" src="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg08() }.jpg" /></a></li>
			</td></c:if>
			<c:if test="${thisCafe.getImg09() != null}"><td>
				<li><a href="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg09() }.jpg" data-lightbox="${thisCafe.getCafe_id() }" title="${thisCafe.getCafe_name() }"><img width="200" height="200" src="${pageContext.request.contextPath}/resources/assets/cafeimg/${thisCafe.getCafe_id() }/${thisCafe.getImg09() }.jpg" /></a></li>
			</td></c:if>
		</ul>
	</tr>
</table>	
	<table id="info">
		<tr>
			<td id="title">카페 아이디</td>
			<td>${thisCafe.getCafe_id() }</td>
		</tr>

		<tr>
			<td id="title">오너 아이디</td>
			<td>${thisCafe.getOwner_id() }</td>
		</tr>
		<tr>
			<td id="title">카페 이름</td>
			<td>${thisCafe.getCafe_name() }</td>
		</tr>

		<tr>
			<td id="title">카페 위지</td>
			<td>${thisCafe.getGu() }, ${thisCafe.getAddress() }</td>
		</tr>
	
		<!-- 카페 사진 라이트박스s -->
		
		
		<tr>
			<td id="title">카페 행사여부</td>
			<td>${thisCafe.isEvent() }</td>
		</tr>

		<tr>
			<td id="title">카페 홈페이지 주소</td>
			<td>${thisCafe.getHomepage() }</td>
		</tr>
		<tr>
			<td id="title">카페 소개글</td>
			<td>${thisCafe.getIntro() }</td>
		</tr>
		<tr>
			<td id="title">콘센트</td>
			<td>${thisCafe.isConcent() }</td>
		</tr>
		<tr>
			<td id="title">반려동물 허용</td>
			<td>${thisCafe.isPet() }</td>
		</tr>
		<tr>
			<td id="title">와이파이</td>
			<td>${thisCafe.isWifi() }</td>
		</tr>
		<tr>
			<td id="title">주차장 여부</td>
			<td>${thisCafe.isParking_zone() }</td>
		</tr>
		<tr>
			<td id="title">흠연실 여부</td>
			<td>${thisCafe.isSmoking_room() }</td>
		</tr>
		<tr>
			<td id="title">화장실</td>
			<td>${thisCafe.isToilet() }</td>
		</tr>
		<tr>
			<td id="title">카페 등록일</td>
			<td>${thisCafe.getCreate_time() }</td>
		</tr>

	</table>
	
	<hr/>
	
	
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