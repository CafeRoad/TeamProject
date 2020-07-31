<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*, javax.servlet.http.*, java.io.*, java.text.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<style type="text/css">
#update {
	width: 900px;
	margin-left: auto;
	margin-right: auto;
	border: 3px;
}

td {
	border: 1px;
	background-color: white;
}

#mail1, #mail2 {
	display: inline-block;
}

#title {
	background-color: white
}

#mail1 {
	width: 200px;
}

#mail2 {
	width: 200px;
}


#signUp {
	width: 700px;
	margin-left: 150;
	margin-right: 150;
	border: 3px;
	float: none;
}

#title {
	vertical-align: middle;
	text-align: center;
	height: 50px;
	width: 150px;
}

.error {
color: red;
}
</style>









<c:url var="updateUrl" value="updateAction"/>
<sf:form modelAttribute="updateMemberVO" method="POST" action="${updateUrl }">
	<center>
	<br> <b><font size="6" color="gray">회원정보 수정</font></b> <br><br>
	<table id="signUp" width=400 border=1 cellpadding=5>
		<tr>
			<td id="title"><b>아이디</b></td>
			<td><sf:input path="id" size="50" maxlength="50" placeholder="${updateMemberVO.getId() }" readonly="true"/> <br/>
			<sf:errors path="id" cssClass="error"/>
			</td>
		</tr>
	

		<tr>
			<td id="title"><b>이메일</b></td>
			<td><sf:input path="email" size="50" maxlength="50" placeholder="${updateMemberVO.getEmail() }" readonly="true"/> <br/>
			<sf:errors path="email" cssClass="error"/>
			</td>
		</tr>
		
		<tr>
			<td id="title"><b>전화번호</b></td>
			<td><sf:input path="tel" size="50" maxlength="50" placeholder="${updateMemberVO.getTel() }"/> <br/>
			<sf:errors path="tel" cssClass="error"/>
			</td>
		</tr>
		
		<tr>
			<td id="title"><b>이름</b></td>
			<td><sf:input path="name" size="50" maxlength="50" placeholder="${updateMemberVO.getName() }" readonly="true"/> <br/>
			<sf:errors path="name" cssClass="error"/>
			</td>
		</tr>
	
		<tr>
			<td id="title"><b>닉네임</b></td>
			<td><sf:input path="nickname" size="50" maxlength="50" placeholder="${updateMemberVO.getNickname() }"/> <br/>
			<sf:errors path="nickname" cssClass="error"/>
			</td>
		</tr>
		
		<tr>
			<td id="title"><b>구</b></td>
			<td><sf:input path="gu" size="50" maxlength="50" placeholder="${updateMemberVO.getGu() }"/> <br/>
			<sf:errors path="gu" cssClass="error"/>
			</td>
		</tr>
	
		<tr>
			<td id="title"><b>비밀번호 확인</b></td>
			<td><input type="password" name="passwordcheck" size="50" maxlength="50" placeholder="비밀번호를 다시 한번 입력해 주세요."/> <br/>
			</td>
		</tr>
		
	</table>
	<input type="submit" value="정보 수정">
	</center>
</sf:form>