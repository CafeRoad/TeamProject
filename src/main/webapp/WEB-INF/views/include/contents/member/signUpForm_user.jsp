<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*, javax.servlet.http.*, java.io.*, java.text.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<script>
	function submitSignUpForm(form) {
		form.SignUpFormId.value = form.SignUpFormId.value.trim();

		if (form.SignUpFormId.value.length == 0) {
			alert('아이디를 입력해 주세요.');
			form.SignUpFormId.focus();

			return false;
		}

		form.SignUpFormPasswd.value = form.SignUpFormPasswd.value.trim();

		if (form.SignUpFormPasswd.value.length == 0) {
			alert('비밀번호를 입력해 주세요.');
			form.SignUpFormPasswd.focus();

			return false;
		}

		form.SignUpFormPasswdConfirm.value = form.SignUpFormPasswdConfirm.value
				.trim();

		if (form.SignUpFormPasswd.value != form.SignUpFormPasswdConfirm.value) {
			alert('비밀번호가 일치하지 않습니다.');
			form.SignUpFormPasswdConfirm.focus();

			return false;
		}

		form.email.value = form.email.value.trim();

		if (form.email.value.length == 0) {
			alert('이메일을 입력해 주세요.');
			form.email.focus();

			return false;
		}

		form.phone.value = form.phone.value.trim();

		if (form.phone.value.length == 0) {
			alert('전화번호를 입력해 주세요.');
			form.phone.focus();

			return false;
		}

		form.submit();
	}
</script>

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
	height: 50px;
	width: 150px;
}
</style>


<c:url var="signUpUrl" value="/userSignUpAction"/>
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
		
		<tr>
			<td id="title"><b>이름</b></td>
			<td><sf:input path="name" size="50" maxlength="50"/> <br/>
			<sf:errors path="name" cssClass="error"/>
			</td>
		</tr>
	
		<tr>
			<td id="title"><b>닉네임</b></td>
			<td><sf:input path="nickname" size="50" maxlength="50"/> <br/>
			<sf:errors path="nickname" cssClass="error"/>
			</td>
		</tr>
		
		<tr>
			<td id="title"><b>구</b></td>
			<td><sf:input path="gu" size="50" maxlength="50"/> <br/>
			<sf:errors path="gu" cssClass="error"/>
			</td>
		</tr>
	
	
	</table>
	<input type="submit" value="회원가입">
	</center>
</sf:form>