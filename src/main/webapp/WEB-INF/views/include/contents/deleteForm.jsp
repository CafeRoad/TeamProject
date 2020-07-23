<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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


<p />
<p />
<p />
<p />
<p />
<p />
<p />
<p />
<center>
	<button type="button" class="btn btn-warning">내정보</button>
	<button type="button" class="btn btn-primary">내가쓴리뷰</button>
	<button type="button" class="btn btn-secondary">즐겨찾기</button>
	<button type="button" class="btn btn-warning">내카페</button>
</center>

<center>
	<br> <br> <b><font size="6" color="gray">회원탈퇴</font></b> <br>
	<br> <br>
<c:url var="deleteUrl" value="/deleteAction" />
<sf:form modelAttribute="signedMember" method="POST" action="${deleteUrl }">
<sf:input type="hidden" path="id" size="50" maxlength="50" />
	<table id="info">
		<tr>
			<td id="title">아이디</td>
			<td>${signedMember.getId() }</td>
		</tr>
		<tr>
			<td id="title"><b>비밀번호</b></td>
			<td><sf:input type="password" path="password" size="50" maxlength="50" /><br/> 
			<sf:errors path="password" cssClass="error"/></td>
		</tr>
	</table>
<br>
	<input type="button" value="뒤로" onclick="history.go(-1)">  
	<input type="submit" value="회원탈퇴">
<br>
</sf:form>
</center>
