<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.*, java.sql.*, javax.servlet.http.*, java.io.*, java.text.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<style type="text/css">
#title {
	height: 16;
	font-family: '돋움';
	font-size: 12;
	text-align: center;
}
</style>

<br>
<b><font size="6" color="gray">글쓰기</font></b>
<br>
<c:url var="noticeUrl" value="/notice/noticeWriteAction"/>
<sf:form modelAttribute="newNoticeVO" method="post" action="${noticeUrl }"/>

<table width="700" border="3" bordercolor="lightgray" align="center">
	<tr>
		<td id="title">작성자</td>
		<td>${signedMember.getId() }</td>
	</tr>
	<tr>
		<td id="title">제 목</td>
		<td><sf:input path="notice_name" type="text" size="70" maxlength="100"/></td>
	</tr>
	<tr>
		<td id="title">내 용</td>
		<td><sf:textarea path="content" cols="72" rows="20"/>
		</td>
	</tr>
	<tr align="center" valign="middle">
	<td colspan="2">
		<input type="reset" value="작성취소"> 
		<input type="submit" value="등록">
		<input type="button" value="목록" onclick="history.back()">
	</td>
	</tr>
</table>

