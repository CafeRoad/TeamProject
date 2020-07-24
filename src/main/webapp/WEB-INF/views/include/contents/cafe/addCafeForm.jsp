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
			<td id="title"><b>구</b></td>
			<td><sf:select path="gu">
			<sf:option value="none">==선택하세요==</sf:option>
			<sf:option value="강남구">강남구</sf:option>
			<sf:option value="강동구">강동구</sf:option>
			<sf:option value="강북구">강북구</sf:option>
			<sf:option value="강서구">강서구</sf:option>
			<sf:option value="관악구">관악구</sf:option>
			<sf:option value="광진구">광진구</sf:option>
			<sf:option value="구로구">구로구</sf:option>
			<sf:option value="금천구">금천구</sf:option>
			<sf:option value="노원구">노원구</sf:option>
			<sf:option value="도봉구">도봉구</sf:option>
			<sf:option value="동대문구">동대문구</sf:option>
			<sf:option value="동작구">동작구</sf:option>
			<sf:option value="마포구">마포구</sf:option>
			<sf:option value="서대문구">서대문구</sf:option>
			<sf:option value="서초구">서초구</sf:option>
			<sf:option value="성동구">성동구</sf:option>
			<sf:option value="성북구">성북구</sf:option>
			<sf:option value="송파구">송파구</sf:option>
			<sf:option value="양천구">양천구</sf:option>
			<sf:option value="영등포구">영등포구</sf:option>
			<sf:option value="용산구">용산구</sf:option>
			<sf:option value="은평구">은평구</sf:option>
			<sf:option value="종로구">종로구</sf:option>
			<sf:option value="중구">중구</sf:option>
			<sf:option value="중랑구">중랑구</sf:option>
		
			</sf:select>
			</td>	
		</tr>
	
		
		
		
		<tr>
			<td id="title"><b>주소</b></td>
			<td><sf:input path="address" size="50" maxlength="50"/> <br/>
			<sf:errors path="address" cssClass="error"/>
			</td>
		</tr>
	
		
		<tr>
			<td id="title"><b>행사</b></td>
			<td><sf:radiobutton path="event" value="true" label="있음" size="50" maxlength="50"/>
			<sf:radiobutton path="event" value="false" label="없음" size="50" maxlength="50"/> <br/>
			<sf:errors path="event" cssClass="error"/>
			</td>
		</tr>
		
		<tr>
		
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