<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="admin" value="ADMIN" />
<style type="text/css">
#title {
	height: 16;
	font-family: '돋움';
	font-size: 12;
	text-align: center;
}

.writeform_1 {

	width: 700px;
	height: 700px;
	margin: auto;
	border: 3px;
}
</style>


<br>
<b><center><font size="6" color="gray">공지사항</font></center></b>
<br>

<sf:form method="get" action="/cafe/notice/noticeRead">
		<table class="writeform_1">
		<tr>
			<td id="title">제 목</td>
			<td>${noticeread.getNotice_name()}</td>
		</tr>
		<tr>
			<td id="admin">글쓴이</td>
			<td>관리자</td>
		</tr>
		<tr>
			<td id="title">내 용</td>
			<td>${noticeread.getContent()}</td>
		<tr>
			<td id="date">작성일</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${noticeread.getCreate_time()}"/></td>
		</tr>
		<tr align="center" valign="middle">
			<td colspan="5">		
			
			<c:if test="${signedMember.getAuthority().equals(admin)}">
			<input type="button" value="글삭제"
				onclick="location.href='/cafe/noticedelete?notice_id=${noticeread.getNotice_id()}'">
			</c:if>
			
			<input type="button" value="목록" onclick="history.back()">
			</td>
		</tr>
	</table>
</sf:form>