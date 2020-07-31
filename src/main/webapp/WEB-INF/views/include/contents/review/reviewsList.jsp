<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="owner" value="OWNER" />
<c:url var="admin" value="ADMIN" />
<c:url var="2" value="2.0" />
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
				<td width="80%"><font size="5" color="ed7d31">${review.getStars() }</font> ${review.getCafe_name() }
					/ ${review.getReview_name() }</td>

				<td width="20%"><font size="3">작성자 ${review.getUser_id() }</font></td>
			</tr>
		</table>
		<table>
			<tr>
				<td width="25%"><font size="4">맛 ${review.getStar_taste()} <c:if
							test="${review.getStar_taste().equals(2)} ">
							<img
								src="${pageContext.request.contextPath}/resources/assets/css/images/oneStar.jpg"
								width="20px" height="20px">
						</c:if> <c:if test="${review.getStar_taste() > 1} ">
							<img
								src="${pageContext.request.contextPath}/resources/assets/css/images/twoStar.jpg"
								width="40px" height="20px">
						</c:if> <c:if test="${review.getStar_taste() == 2} ">
							<img
								src="${pageContext.request.contextPath}/resources/assets/css/images/threeStar.jpg"
								width="60px" height="20px">
						</c:if> <c:if test="${review.getStar_taste() == 4} ">
							<img
								src="${pageContext.request.contextPath}/resources/assets/css/images/fourStar.jpg"
								width="80px" height="20px">
						</c:if> <c:if test="${review.getStar_taste() == 5} ">
							<img
								src="${pageContext.request.contextPath}/resources/assets/css/images/fiveStar.jpg"
								width="100px" height="20px">
						</c:if>
				</font></td>
				<td width="25%"><font size="4">청결  <c:if
							test="${review.getStar_clean() == 1} ">
							<img
								src="${pageContext.request.contextPath}/resources/assets/css/images/oneStar.jpg"
								width="20px" height="20px">
						</c:if> <c:if test="${review.getStar_clean() == 2} ">
							<img
								src="${pageContext.request.contextPath}/resources/assets/css/images/twoStar.jpg"
								width="40px" height="20px">
						</c:if> <c:if test="${review.getStar_clean() == 3} ">
							<img
								src="${pageContext.request.contextPath}/resources/assets/css/images/threeStar.jpg"
								width="60px" height="20px">
						</c:if> <c:if test="${review.getStar_clean() == 4} ">
							<img
								src="${pageContext.request.contextPath}/resources/assets/css/images/fourStar.jpg"
								width="80px" height="20px">
						</c:if> <c:if test="${review.getStar_clean() == 5} ">
							<img
								src="${pageContext.request.contextPath}/resources/assets/css/images/fiveStar.jpg"
								width="100px" height="20px">
						</c:if>
				</font></td>
				<td width="25%"><font size="4">서비스 <c:if
							test="${review.getStar_service() == 1} ">
							<img
								src="${pageContext.request.contextPath}/resources/assets/css/images/oneStar.jpg"
								width="20px" height="20px">
						</c:if> <c:if test="${review.getStar_service() == 2} ">
							<img
								src="${pageContext.request.contextPath}/resources/assets/css/images/twoStar.jpg"
								width="40px" height="20px">
						</c:if> <c:if test="${review.getStar_service() == 3} ">
							<img
								src="${pageContext.request.contextPath}/resources/assets/css/images/threeStar.jpg"
								width="60px" height="20px">
						</c:if> <c:if test="${review.getStar_service() == 4} ">
							<img
								src="${pageContext.request.contextPath}/resources/assets/css/images/fourStar.jpg"
								width="80px" height="20px">
						</c:if> <c:if test="${review.getStar_service() == 5} ">
							<img
								src="${pageContext.request.contextPath}/resources/assets/css/images/fiveStar.jpg"
								width="100px" height="20px">
						</c:if></font></td>
				<td width="25%"><font size="4">분위기 <c:if
							test="${review.getStar_mood() == 1} ">
							<img
								src="${pageContext.request.contextPath}/resources/assets/css/images/oneStar.jpg"
								width="20px" height="20px">
						</c:if> <c:if test="${review.getStar_mood() == 2} ">
							<img
								src="${pageContext.request.contextPath}/resources/assets/css/images/twoStar.jpg"
								width="40px" height="20px">
						</c:if> <c:if test="${review.getStar_mood() == 3} ">
							<img
								src="${pageContext.request.contextPath}/resources/assets/css/images/threeStar.jpg"
								width="60px" height="20px">
						</c:if> <c:if test="${review.getStar_mood() == 4} ">
							<img
								src="${pageContext.request.contextPath}/resources/assets/css/images/fourStar.jpg"
								width="80px" height="20px">
						</c:if> <c:if test="${review.getStar_mood() == 5} ">
							<img
								src="${pageContext.request.contextPath}/resources/assets/css/images/fiveStar.jpg"
								width="100px" height="20px">
						</c:if>
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


