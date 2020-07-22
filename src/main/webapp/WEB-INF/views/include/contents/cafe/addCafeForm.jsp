<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*, javax.servlet.http.*, java.io.*, java.text.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<style type="text/css">
#addCafe {
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


<c:url var="addCafeUrl" value="/cafe/signUpAction"/>
<sf:form modelAttribute="waitingCafeVO" method="POST" action="${addCafeUrl }">
	<center>
	<br> <b><font size="6" color="gray">카페 등록</font></b> <br><br>
	<table id="addCafe" width=400 border=1 cellpadding=5>
		<tr>
			<td id="title"><b>이름</b></td>
			<td><sf:input path="cafe_id" size="50" maxlength="50"/> <br/>
			<sf:errors path="cafe_id" cssClass="error"/>
			</td>
		</tr>
		<tr>
			<td id="title"><b>주소</b></td>
			<td><sf:input path="address" size="50" maxlength="50"/> <br/>
			<sf:errors path="address" cssClass="error"/>
			</td>
		</tr>
	
		<tr>
			<td id="title"><b>SNS</b></td>
			<td><sf:input path="sns" size="50" maxlength="50"/> <br/>
			<sf:errors path="sns" cssClass="error"/>
			</td>
		</tr>
		
		<tr>
			<td id="title"><b>행사</b></td>
			<td><sf:input path="event" size="50" maxlength="50"/> <br/>
			<sf:errors path="event" cssClass="error"/>
			</td>
		</tr>
		
		<tr>
			<td id="title"><b>홈페이지</b></td>
			<td><sf:input path="homepage" size="50" maxlength="50"/> <br/>
			<sf:errors path="homepage" cssClass="error"/>
			</td>
		</tr>
	</table>
	<input type="submit" value="등록">

	</center>
</sf:form>