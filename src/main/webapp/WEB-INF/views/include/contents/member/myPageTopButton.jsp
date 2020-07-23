<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<center>
	<c:url var="owner" value="OWNER"/>
	<button type="button" class="btn btn-warning" onclick="location.href='/cafe/myPage'">내정보</button>
	<button type="button" class="btn btn-primary">내가쓴리뷰</button>
	<button type="button" class="btn btn-secondary">즐겨찾기</button>
	<c:if test="${signedMember.getAuthority().equals(owner)}">
	<button type="button" class="btn btn-warning" onclick="location.href='/cafe/searchMyAddedCafes'">내카페</button>
	<button type="button" class="btn btn-warning" onclick="location.href='/cafe/searchMyWatingCafes'">대기중인 카페.</button>
	</c:if>
</center>