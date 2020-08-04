<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="user" value="USER"/>
<c:url var="owner" value="OWNER"/>
<c:url var="admin" value="ADMIN"/>

<!-- Nav -->
<nav id="menu">
	<ul class="links">
	
	<c:if test="${signedMember.getId() == null}">
		<li><a href="/cafe/login">로그인</a></li>
		<li><a href="/cafe/joinChoice">회원가입</a></li>
	</c:if>
		
	<c:if test="${signedMember.getId() != null}">
		<li>[<c:out value="${signedMember.getAuthority() }" />] <c:out value="${signedMember.getId() }" />님 환영합니다.</li>
		<li><a href="/cafe/myPage">마이페이지</a></li>

	<c:if test="${signedMember.getAuthority().equals(user)}">
		<li><a href="/cafe/myReview">내가 쓴 리뷰</a></li>
		<li><a href="/cafe/컨트롤러 미구현">즐겨찾기</a></li>
	</c:if>
	
	<c:if test="${signedMember.getAuthority().equals(owner)}">
		<li><a href="/cafe/searchMyAddedCafes">내 승인된 카페</a></li>
		<li><a href="/cafe/searchMyWaitingCafes">내 승인 대기중인 카페</a></li>
		<li><a href="/cafe/cafe/signUp">카페 등록하기</a></li>
	</c:if>

	<c:if test="${signedMember.getAuthority().equals(admin)}">
		<li><a href="/cafe/searchAddedCafes">승인된 카페</a></li>
		<li><a href="/cafe/searchWaitingCafes">승인 대기중인 카페</a></li>
	</c:if>
	
		<li><a href="/cafe/컨트롤러 미구현">공지사항</a></li>
		<li><a href="/cafe/logout">로그아웃</a></li>
		<li><a href="/cafe/deleteForm">회원 탈퇴</a></li>
	</c:if>
	</ul>
</nav>