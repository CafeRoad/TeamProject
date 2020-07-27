<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<style type="text/css">
#login {
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
</style>

<c:url var="loginUrl" value="/loginAction" />
<sf:form modelAttribute="memberVO" method="POST" action="${loginUrl }"
	onsubmit="submitloginForm(this); return false;">
	<center>
		<br> <b><font size="6" color="gray">로그인</font></b> <br> <br>
		<table id="login">
			<tr>
				<td id="title"><b>아이디</b></td>
				<td><sf:input id="loginId" autofocus="autofocus" path="id"
						size="50" maxlength="50" /> <br /> <sf:errors path="id"
						cssClass="error" /></td>
			</tr>

			<tr>
				<td id="title"><b>비밀번호</b></td>
				<td><sf:input id="loginPasswd" type="password" path="password"
						size="50" maxlength="50" /> <br /> <sf:errors path="password"
						cssClass="error" /></td>
			</tr>

		</table>
		<input type="submit" value="로그인">
	</center>
</sf:form>

<br>
