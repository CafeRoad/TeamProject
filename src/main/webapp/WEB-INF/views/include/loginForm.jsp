<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!-- id, password 받아서 /loginAction 으로 쏘면 main 호출. -->
<c:url var="loginUrl" value="/loginAction"/>

<sf:form method="POST" action="${loginUrl }">
	<table width=400 border=1 cellpadding=5>	
		<tr>
			<td><b>아이디</b></td>
			<td><input name="id" size="50" maxlength="50"/> <br/>
			<sf:errors path="id" cssClass="error"/>
			</td>
		</tr>
		
		<tr>
			<td><b>비밀번호</b></td>
			<td><input name="password" size="50" maxlength="50"/> <br/>
			<sf:errors path="password" cssClass="error"/>
			</td>
		</tr>	
		
		<tr>
			<td><input type="submit" value="로그인"></td>
		</tr>
	</table>
</sf:form>