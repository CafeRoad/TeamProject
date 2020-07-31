<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*, javax.servlet.http.*, java.io.*, java.text.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<style type="text/css">
#newReview {
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

<hr/>
<c:url var="writeReview" value="/review/writeAction"/>
<sf:form modelAttribute="newReviewVO" method="POST" action="${writeReview }">
	<center>
	<br> <b><font size="6" color="gray">리뷰 등록</font></b> <br><br>
	<table id="newReview" width=400 border=1 cellpadding=5>
		<tr>
			<td id="title"><b>제목</b></td>
			<td><sf:input path="review_name" size="50" maxlength="50"/> <br/>
			<sf:errors path="review_name" cssClass="error"/>
			</td>
			
			<td id="title"><b>비밀번호</b></td>
			<td><sf:input type="password" path="password" size="50" maxlength="50"/> <br/>
			<sf:errors path="password" cssClass="error"/>
			</td>
		</tr>
		
		<tr colspan="2">
			<td id="title"><b>내용</b></td>
			<td><sf:input path="content" size="200" maxlength="200"/> <br/>
			<sf:errors path="content" cssClass="error"/>
			</td>
		</tr>
		
		<tr>

			<td id="title"><b>맛</b></td>
			<td><sf:select path="star_taste">
				<sf:option value="0">==선택하세요==</sf:option>
				<sf:option value="1">1</sf:option>
				<sf:option value="2">2</sf:option>
				<sf:option value="3">3</sf:option>
				<sf:option value="4">4</sf:option>
				<sf:option value="5">5</sf:option>
			</sf:select>
			</td>	
			<td id="title"><b>분위기</b></td>
			<td><sf:select path="star_mood">
				<sf:option value="0">==선택하세요==</sf:option>
				<sf:option value="1">1</sf:option>
				<sf:option value="2">2</sf:option>
				<sf:option value="3">3</sf:option>
				<sf:option value="4">4</sf:option>
				<sf:option value="5">5</sf:option>
			</sf:select>
			</td>	
		</tr>
		<tr>
			<td id="title"><b>서비스</b></td>
			<td><sf:select path="star_service">
				<sf:option value="0">==선택하세요==</sf:option>
				<sf:option value="1">1</sf:option>
				<sf:option value="2">2</sf:option>
				<sf:option value="3">3</sf:option>
				<sf:option value="4">4</sf:option>
				<sf:option value="5">5</sf:option>
			</sf:select>
			</td>	
		
			<td id="title"><b>청결</b></td>
			<td><sf:select path="star_clean">
				<sf:option value="0">==선택하세요==</sf:option>
				<sf:option value="1">1</sf:option>
				<sf:option value="2">2</sf:option>
				<sf:option value="3">3</sf:option>
				<sf:option value="4">4</sf:option>
				<sf:option value="5">5</sf:option>
			</sf:select>
			</td>	
		</tr>	

	</table>
	<input type="hidden" name="cafe_id" value="${thisCafe.getCafe_id() }"/>
	<input type="submit" value="등록">
	</center>
</sf:form>