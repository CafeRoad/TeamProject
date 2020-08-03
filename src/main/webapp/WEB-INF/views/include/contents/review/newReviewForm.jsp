<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*, javax.servlet.http.*, java.io.*, java.text.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<style type="text/css">
#reviewContent {
	height : 100%;
	width : 100%;
	}

#title {
	vertical-align: middle;
	text-align: center;
	height : 50px;
	width : 150px;
	
}
</style>

<hr/>
<c:url var="writeReview" value="/review/writeAction"/>
<sf:form modelAttribute="newReviewVO" method="POST" action="${writeReview }">
	<center>
	<br> <b><font size="6" color="gray">리뷰 등록</font></b> <br><br>
	
	
		<table>
			<tr>
				<td width="80%"><b>제목</b>
			<sf:input path="review_name" size="50" maxlength="50" placeholder="제목은 3~20자 이내로 입력해 주세요."/>
			<sf:errors path="review_name" cssClass="error"/> </td>

				<td width="20%"><b>비밀번호</b>
			<sf:input type="password" path="password" size="50" maxlength="50" placeholder="비밀번호는 4~10자 이내"/>
			<sf:errors path="password" cssClass="error"/></td>
			</tr>
		</table>
		<table>
			<tr>
				<td width="25%"><font size="4"><b>맛</b>
			<sf:select path="star_taste">
				<sf:option value="1">1</sf:option>
				<sf:option value="2">2</sf:option>
				<sf:option value="3">3</sf:option>
				<sf:option value="4">4</sf:option>
				<sf:option value="5">5</sf:option>
			</sf:select>
				</font></td>
				<td width="25%"><font size="4"><b>청결</b>
			<sf:select path="star_clean">
				<sf:option value="1">1</sf:option>
				<sf:option value="2">2</sf:option>
				<sf:option value="3">3</sf:option>
				<sf:option value="4">4</sf:option>
				<sf:option value="5">5</sf:option>
			</sf:select>
				</font></td>
				<td width="25%"><font size="4"><b>서비스</b>
			<sf:select path="star_service">
				<sf:option value="1">1</sf:option>
				<sf:option value="2">2</sf:option>
				<sf:option value="3">3</sf:option>
				<sf:option value="4">4</sf:option>
				<sf:option value="5">5</sf:option>
			</sf:select>
				</font></td>
				<td width="25%"><font size="4"><b>분위기</b>
			<sf:select path="star_mood">
				<sf:option value="1">1</sf:option>
				<sf:option value="2">2</sf:option>
				<sf:option value="3">3</sf:option>
				<sf:option value="4">4</sf:option>
				<sf:option value="5">5</sf:option>
			</sf:select>
				</font></td>
			</tr>

		</table>
		<div class="box">
			<div id="reviewContent"><sf:textarea path="content" size="2000" maxlength="2000" placeholder="내용은 5~2000자 까지 입력 할 수 있습니다." />
			<sf:errors path="content" cssClass="error"/></div>
		</div>
	
	<input type="hidden" name="cafe_id" value="${thisCafe.getCafe_id() }"/>
	<input type="submit" value="등록">
	</center>
</sf:form>
		