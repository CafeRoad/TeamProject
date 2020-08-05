<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
<b><center><font size="6" color="gray">글쓰기</font></center></b>
<br>

<sf:form method="post" action="/cafe/notice/noticeWriteAction"
	modelAttribute="newNoticeVO">
	<table class="writeform_1">
		<tr>
			<td id="title">제 목</td>
			<td><sf:input path="notice_name" type="text" size="70"
					maxlength="100" value="" /></td>
		</tr>
		<tr>
			<td id="title">내 용</td>
			<td><sf:textarea path="content" cols="72" rows="20"></sf:textarea>
			</td>
		<tr align="center" valign="middle">
			<td colspan="5"><input type="reset" value="작성취소"> <input
				type="submit" value="등록"> <input type="button" value="목록">
			</td>
		</tr>
	</table>
</sf:form>