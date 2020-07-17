<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table cellpadding=5 border=1 width=500>
		<tr>
			<td><b>User_id</b></td>
			<td><c:out value="${user.getUser_id() }" /></td>
		</tr>
		<tr>
			<td><b>password</b></td>
			<td><c:out value="${user.getPassword() }" /></td>
		</tr>
		<tr>
			<td><b>이메일</b></td>
			<td><c:out value="${user.getEmail() }" /></td>
		</tr>
		<tr>
			<td><b>성별</b></td>
			<td><c:out value="${user.getGender() }" /></td>
		</tr>
		<tr>
			<td><b>nickname</b></td>
			<td><c:out value="${user.getNickname() }" /></td>
		</tr>
		<tr>
			<td><b>local</b></td>
			<td><c:out value="${user.getLocal() }" /></td>
		</tr>
		<tr>
			<td><b>birth</b></td>
			<td><c:out value="${user.getBirth() }" /></td>
		</tr>
		<tr>
			<td><b>interesting</b></td>
			<td><c:out value="${user.getInteresting() }" /></td>
		</tr>
		<tr>
			<td><b>create_time</b></td>
			<td><c:out value="${user.getCreate_time() }" /></td>
		</tr>
	</table>


</body>
</html>