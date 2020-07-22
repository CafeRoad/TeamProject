<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
<style>
.con {
	width: 1000px;
	margin: 0 auto;
}

.article-list-box>table {
	width: 100%;
	border-collapse: collapse;;
}

.article-list-box>table th, .article-list-box>table td {
	border: 1px solid black;
	padding: 20px;
}
</style>
</head>
<body>
<<<<<<< HEAD:src/main/webapp/WEB-INF/views/board/list.jsp
	<h1>게시물 리스트</h1>

	<div class="con menu-box">
		<a href="/article/list">글 리스트</a> <a href="/article/write">글쓰기</a>
	</div>

	<div class="con article-list-box">
		<table>
			<colgroup>
				<col width="10" />
				<col width="200" />
				<col />
				<col width="100" />
			</colgroup>
			<thead>
				<tr>
					<th>ID</th>
					<th>날짜</th>
					<th>제목</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${articles}" var="article">
					<tr>
						<td>${article.id}</td>
						<td>${article.regDate}</td>
						<td><a href="#">${article.title}</a></td>
						<td></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
=======
등록된 이메일로 인증 경로가 전송되었습니다.
이메일을 확인해주세요.
>>>>>>> master:src/main/webapp/WEB-INF/views/include/contents/checkEmailPlease.jsp
</body>
</html>