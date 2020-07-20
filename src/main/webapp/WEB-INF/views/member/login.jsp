<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<header>
		<h1 class="text-center">
			<a href="home.do">로그인폼 헤더.</a>
		</h1>
	</header>

	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form action="loginAction" method="post">
					<br>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="id"
							name="id">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="password"
							name="password">
					</div>
					<div class="form-group">
						<input type="submit" class="form-control"
							style="background-color: orange; color: white;" value="로그인">
					</div>
					<div class="form-group">
						<a href="signUp" class="form-control"
							style="background-color: ornage; text-align: center; color: white;">회원가입. 얘는 대체 어디 숨어서 보이지도 않는거지..</a>
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
