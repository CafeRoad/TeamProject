<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:url var="owner" value="OWNER"/>
	<c:url var="admin" value="ADMIN"/>
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
		<c:if test="${Reveiws.size() == 0}">
		등록된 리뷰가 없습니다.
		</c:if>
	
	<c:forEach var="review" items="${Reveiws}">
	<table id="review">
		<tr>
			<td id="title">리뷰 제목</td>
			<td>${review.getReview_name() }</td>
			<td id="title">작성자</td>
			<td>${review.getUser_id() }</td>
		</tr>
		<tr>
			<td id="title">카페 이름</td>
			<td>${thisCafe.getCafe_name() }</td>
			<td id="title">별점</td>
			<td>${review.getStars() }</td>
		</tr>

		<tr>
			<td id="title">맛</td>
			<td>${review.getStar_taste() }</td>
			<td id="title">분위기</td>
			<td>${review.getStar_mood() }</td>
		</tr>
		<tr>
			<td id="title">서비스</td>
			<td>${review.getStar_service() }</td>
			<td id="title">청결</td>
			<td>${review.getStar_clean() }</td>
		</tr>
		<tr>
			<td id="title">내용</td>
			<td colspan="3">${review.getContent() }</td>
		</tr>

	</table>
	<button type="button" class="btn btn-warning">좋아요(기능 미구현)</button>

	<hr/>
	</c:forEach>
	<br>
</center>
<br>