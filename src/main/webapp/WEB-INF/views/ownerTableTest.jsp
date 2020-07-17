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
			<td><b>owner_id</b></td>
			<td><c:out value="${owner.getOwner_id() }" /></td>
		</tr>
		<tr>
			<td><b>password</b></td>
			<td><c:out value="${owner.getPassword() }" /></td>
		</tr>
		<tr>
			<td><b>이메일</b></td>
			<td><c:out value="${owner.getEmail() }" /></td>
		</tr>
		<tr>
			<td><b>tel</b></td>
			<td><c:out value="${owner.getTel() }" /></td>
		</tr>
		<tr>
			<td><b>create_time</b></td>
			<td><c:out value="${owner.getCreate_time() }" /></td>
		</tr>
	</table>


</body>
</html>