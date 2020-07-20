<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<header>
		<h1 class="text-center">
			<a href="home.do"></a>
		</h1>
	</header>

	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form action="loginpro.do" method="post">
					<br>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="id"
							name="userid">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="pw"
							name="userpw">
					</div>
					<div class="form-group">
						<input type="submit" class="form-control"
							style="background-color: orange; color: white;" value="로그인">
					</div>
					<div class="form-group">
						<a href="register.do" class="form-control"
							style="background-color: ornage; text-align: center; color: white;">회원가입</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<c:if test="${msg=='error' }">
		<script type="text/javascript">
			alert("실패");
		</script>
	</c:if>
</body>
</html>