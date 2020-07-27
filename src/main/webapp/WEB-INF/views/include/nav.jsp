<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Nav -->
<nav id="menu">
	<ul class="links">
	
	<c:if test="${signedMember.getId() == null}">
		<li><a href="/cafe/login">로그인.</a></li>
		<li><a href="/cafe/joinChoice">회원가입</a></li>
	</c:if>
		
	<c:if test="${signedMember.getId() != null}">
		<li><c:out value="${signedMember.getId() }" />님 환영합니다.</li>
		<li><a href="/cafe/myPage">마이페이지</a></li>
		<li><a href="/cafe/logout">로그아웃</a></li>
	</c:if>
		
	</ul>
</nav>