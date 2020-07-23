<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<% response.setStatus(200);%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!--
	Hielo by TEMPLATED 
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
	<title>Cafe Road Main Page</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!-- http://localhost:8080/cafe/include -->
	<!-- css 뒤에 ? ver='숫자'로 값을 주면 바뀐 파일 적용됨.  https://kanu.tistory.com/30  -->
	<link href="${pageContext.request.contextPath}/resources/assets/css/main3.css?ver=7" rel="stylesheet" type="text/css" />

	<!-- Scripts -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
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
	<c:if test="${banner_full != null}">
	<jsp:include page="/WEB-INF/views/include/banner.jsp"></jsp:include>
	</c:if>
	<c:if test="${banner_full == null}">
	<jsp:include page="/WEB-INF/views/include/banner_half.jsp"></jsp:include>
	</c:if>
	
	
	<!-- 에러페이지 문구 작성 -->
	<br>
	<br>

<article>

		<div class="container">

			<p>데이터를 처리 하는 과정에서 문제가 발생하였습니다.</p>

			<p>관리자에게 문의하여 주십시오.</p>

		</div>
</article>
<br>


	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

</body>
</html>