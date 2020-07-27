<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        if(${result.equals("success")}){
            alert('${filename} 파일 저장 성공');
        } else if(${result.equals("file")}) {
            alert('파일 저장 실패');
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
    <input type="submit" value="업로드">
</form>
</body>
</html>