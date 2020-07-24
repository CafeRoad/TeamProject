<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<center>
	<c:url var="user" value="USER"/>
	<c:url var="owner" value="OWNER"/>
	<c:url var="admin" value="ADMIN"/>
	<button type="button" class="btn btn-warning" onclick="location.href='/cafe/myPage'">내정보</button>
	<c:if test="${signedMember.getAuthority().equals(user)}">
	<button type="button" class="btn btn-primary">내가쓴리뷰</button>
	<button type="button" class="btn btn-secondary">즐겨찾기</button>
	</c:if>
	<c:if test="${signedMember.getAuthority().equals(owner)}">
	<button type="button" class="btn btn-warning" onclick="location.href='/cafe/searchMyAddedCafes'">내 카페</button>
	<button type="button" class="btn btn-warning" onclick="location.href='/cafe/searchMyWaitingCafes'">대기중인 카페</button>
	</c:if>
	<c:if test="${signedMember.getAuthority().equals(admin)}">
	<button type="button" class="btn btn-warning" onclick="location.href='/cafe/searchAddedCafes'">승인된 카페</button>
	<button type="button" class="btn btn-warning" onclick="location.href='/cafe/searchWaitingCafes'">승인 대기중인 카페</button>
	</c:if>
		<button type="button" class="btn btn-warning">회원 탈퇴</button>
</center>