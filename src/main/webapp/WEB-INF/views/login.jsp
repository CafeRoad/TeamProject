<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Cafe Road Login Page</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!-- http://localhost:8080/cafe/index -->
	<!-- css 뒤에 ? ver='숫자'로 값을 주면 바뀐 파일 적용됨.  https://kanu.tistory.com/30  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main3.css?ver=9" />
	<link href="${pageContext.request.contextPath}/resources/assets/css/main3.css?ver=9" rel="stylesheet" type="text/css" />

	<!-- Scripts -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/skel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

</head>
<body>
	<!-- Header -->
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

	<!-- Nav -->
	<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>

	<!-- Banner -->
	<jsp:include page="/WEB-INF/views/include/banner.jsp"></jsp:include>

	<!-- login -->
	<jsp:include page="/WEB-INF/views/include/loginForm.jsp"></jsp:include>

	<!-- One -->
	<jsp:include page="/WEB-INF/views/include/one.jsp"></jsp:include>

	<!-- Two -->
	<jsp:include page="/WEB-INF/views/include/two.jsp"></jsp:include>

	<!-- Three -->
	<jsp:include page="/WEB-INF/views/include/three.jsp"></jsp:include>

	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

</body>
</html>