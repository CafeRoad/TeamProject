<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select * from member</title>
</head>
<body>

	<table cellpadding=5 border=1 width=500>
		<tr>
			<td><b>User_id</b></td>
			<td><c:out value="${member.getId() }" /></td>
		</tr>
		<tr>
			<td><b>password</b></td>
			<td><c:out value="${member.getPassword() }" /></td>
		</tr>
		<tr>
			<td><b>이메일</b></td>
			<td><c:out value="${member.getEmail() }" /></td>
		</tr>
		<tr>
			<td><b>create_time</b></td>
			<td><c:out value="${member.getCreate_time() }" /></td>
		</tr>
		<tr>
			<td><b>tel</b></td>
			<td><c:out value="${member.getTel() }" /></td>
		</tr>
		<tr>
			<td><b>authority</b></td>
			<td><c:out value="${member.getAuthority() }" /></td>
		</tr>
	</table>


</body>
</html>