<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String uploadPath = 
request.getSession().getServletContext().getRealPath("/");

%>
<!DOCTYPE html>
<html>
<head>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        if(${filename.length() > 0 }){
            alert('${filename} 파일 저장 성공');
        }
    });
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>파일 업로드</h1>
<form action="/cafe/fileupload" method="post" enctype="multipart/form-data">
    <input type="file" name="uploadfile" placeholder="파일 선택" /><br/>
    <input type="hidden" name="dir" value="<%=uploadPath %>" />
    <input type="submit" value="업로드">
</form>
</body>
</html>