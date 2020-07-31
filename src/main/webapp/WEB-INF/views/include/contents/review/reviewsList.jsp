<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="owner" value="OWNER" />
<c:url var="admin" value="ADMIN" />
<style type="text/css">
#review {
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
</style>

<center>
	<c:if test="${myReview != null}">
		<b><font size="6" color="gray">내가 쓴 리뷰</font></b>
	</c:if>

	<c:if test="${myReview == null}">
		<b><font size="6" color="gray">소소한 리뷰</font></b>
	</c:if>

	<c:if test="${Reveiws.size() == 0}">
		<br>등록된 리뷰가 없습니다.
		</c:if>

	<c:forEach var="review" items="${Reveiws}">

		<br>
		<br>
		<table>
			<tr>
				<td width="80%"><font size="5" color="ed7d31">${review.getStars() }</font>${review.getCafe_name() } / ${review.getReview_name() }</td>

				<td width="20%"><font size="3">작성자 ${review.getUser_id() }</font></td>
			</tr>
		</table>
		<table>
			<tr>
				<td width="25%"><font size="4">맛
						${review.getStar_taste() }<img
						src="${pageContext.request.contextPath}/resources/assets/cafeimg/star.png"
						width="20px" height="20px" />
				</font></td>
				<td width="25%"><font size="4">청결
						${review.getStar_clean() }<img
						src="${pageContext.request.contextPath}/resources/assets/cafeimg/star.png"
						width="20px" height="20px" />
				</font></td>
				<td width="25%"><font size="4">서비스
						${review.getStar_service() }<img
						src="${pageContext.request.contextPath}/resources/assets/cafeimg/star.png"
						width="20px" height="20px" />
				</font></td>
				<td width="25%"><font size="4">분위기
						${review.getStar_mood() }<img
						src="${pageContext.request.contextPath}/resources/assets/cafeimg/star.png"
						width="20px" height="20px" />
				</font></td>
			</tr>

		</table>
		<div class="box">
			<div class="content">${review.getContent() }</div>
		</div>


		<button type="button" class="btn btn-warning">좋아요(기능 미구현)</button>

	</c:forEach>
	<br>
</center>
<br>


