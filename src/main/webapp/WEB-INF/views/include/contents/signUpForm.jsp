<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*, javax.servlet.http.*, java.io.*, java.text.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<style type="text/css">
#signUp {
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

<c:url var="signUpUrl" value="/signUpAction"/>
<sf:form modelAttribute="signUpMemberVO" method="POST" action="${signUpUrl }">
	<center>
	<br> <b><font size="6" color="gray">회원가입</font></b> <br><br>
	<table id="signUp" width=400 border=1 cellpadding=5>
		<tr>
			<td id="title"><b>아이디</b></td>
			<td><sf:input path="id" size="50" maxlength="50"/> <br/>
			<sf:errors path="id" cssClass="error"/>
			</td>
		</tr>
	
		<tr>
			<td id="title"><b>비밀번호</b></td>
			<td><sf:input path="password" size="50" maxlength="50"/> <br/>
			<sf:errors path="password" cssClass="error"/>
			</td>
		</tr>
	
		<tr>
			<td id="title"><b>이메일</b></td>
			<td><sf:input path="email" size="50" maxlength="50"/> <br/>
			<sf:errors path="email" cssClass="error"/>
			</td>
		</tr>
		
		<tr>
			<td id="title"><b>전화번호</b></td>
			<td><sf:input path="tel" size="50" maxlength="50"/> <br/>
			<sf:errors path="tel" cssClass="error"/>
			</td>
		</tr>
	
	</table>
	<input type="submit" value="회원가입">
	</center>
</sf:form>