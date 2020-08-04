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
		<br> <b><font size="6" color="gray">아이디 찾기</font></b> <br> <br>
		<table id="login">

			<tr>
				<td id="title"><b>이름</b></td>
				<td><sf:input id="loname" autofocus="autofocus" path="id"
						size="40" maxlength="40" placeholder="이름을 입력해 주세요." /> <br /> <sf:errors
						path="name" cssClass="error" /></td>
				<td id="title"><b>이메일</b></td>
				<td><sf:input path="email" size="50" maxlength="50"
						placeholder="이메일 주소를 입력해 주세요." /> <br /> <sf:errors path="email"
						cssClass="error" /></td>
			</tr>

		</table>
		<input type="button" value="확인" onclick="">
	</center>

	<center>
		<br> <b><font size="6" color="gray">비밀번호 찾기</font></b> <br>
		<br>
		<table id="login">
			<tr>
				<td id="title"><b>아이디</b></td>
				<td><sf:input id="loginId" autofocus="autofocus" path="id"
						size="50" maxlength="50" placeholder="아이디를 입력해 주세요." /> <br /> <sf:errors
						path="id" cssClass="error" /></td>
			</tr>

			<tr>
				<td id="title"><b>이메일</b></td>
				<td><sf:input path="email" size="50" maxlength="50"
						placeholder="이메일 주소를 입력해 주세요." /> <br /> <sf:errors path="email"
						cssClass="error" /></td>
			</tr>

		</table>
		<input type="button" value="확인" onclick="">
	</center>
</sf:form>