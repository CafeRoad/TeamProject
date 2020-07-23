<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
#info {
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

<jsp:include page="myPageTopButton.jsp" flush="false"/>


<center>
	<br> <br> <b><font size="6" color="gray">내 정보</font></b> <br>
	<br> <br>

	<table id="info">
		<tr>
			<td id="title">아이디</td>
			<td>${signedMember.getId() }</td>
		</tr>

		<tr>
			<td id="title">비밀번호</td>
			<td>${signedMember.getPassword() }</td>
		</tr>

		<tr>
			<td id="title">이메일</td>
			<td>${signedMember.getEmail() }</td>
		</tr>

		<tr>
			<td id="title">권한</td>
			<td>${signedMember.getAuthority() }</td>
		</tr>
	</table>
</center>
<br>
<center>
	<input type="button" value="뒤로" onclick="history.go(-1)"> 
	<input type="button" value="회원정보 변경" onclick="changeForm(0)"> 
	<input type="button" value="회원탈퇴" onclick="location.href='/cafe/deleteForm'">
</center>
