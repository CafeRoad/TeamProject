<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Nav -->
<nav id="menu">
	<ul class="links">
		<li><a href="index.html">login</a></li>
		<li><a href="generic.html">Sign up</a></li>
		<li><a href="elements.html">login check > if</a></li>
		
		<c:if test="${signedMember.getId() != null}">
		<li><a href="elements.html">로그인 되었을 경우에 보임.</a></li>
		<li><c:out value="${signedMember.getId() }" />님 환영합니다.</li>
		<li><a href="/cafe/logout">로그아웃.</a></li>
		</c:if>
		
		<c:if test="${signedMember.getId() == null}">
		<li><a href="/cafe/login">로그인.</a></li>
		</c:if>
	</ul>
</nav>