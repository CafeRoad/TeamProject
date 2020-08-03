<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*, javax.servlet.http.*, java.io.*, java.text.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<style type="text/css">
#addCafe {
	width: 700px;
	margin-left: 150;
	margin-right: 150;
	border: 3px;
	float: none;
}

#title {
	vertical-align: middle;
	text-align: center;
	height : 50px;
	width : 150px;
	
}
</style>


<c:url var="addCafeUrl" value="/cafe/signUpAction"/>
<sf:form modelAttribute="waitingCafeVO" method="POST" action="${addCafeUrl }">
	<center>
	<br> <b><font size="6" color="gray">카페 등록</font></b> <br><br>
	<table id="addCafe" width=400 border=1 cellpadding=5>
		<tr>
			<td id="title"><b>이름</b></td>
			<td><sf:input path="cafe_name" size="50" maxlength="50" placeholder="카페명은 2~15자 이내로 입력해주세요."/> <br/>
			<sf:errors path="cafe_name" cssClass="error"/>
			</td>
		</tr>
	
		<tr>
			<td id="title"><b>구</b></td>
			<td><sf:select path="gu">
			<sf:option value="none">==선택하세요==</sf:option>
			<sf:option value="강남구">강남구</sf:option>
			<sf:option value="강동구">강동구</sf:option>
			<sf:option value="강북구">강북구</sf:option>
			<sf:option value="강서구">강서구</sf:option>
			<sf:option value="관악구">관악구</sf:option>
			<sf:option value="광진구">광진구</sf:option>
			<sf:option value="구로구">구로구</sf:option>
			<sf:option value="금천구">금천구</sf:option>
			<sf:option value="노원구">노원구</sf:option>
			<sf:option value="도봉구">도봉구</sf:option>
			<sf:option value="동대문구">동대문구</sf:option>
			<sf:option value="동작구">동작구</sf:option>
			<sf:option value="마포구">마포구</sf:option>
			<sf:option value="서대문구">서대문구</sf:option>
			<sf:option value="서초구">서초구</sf:option>
			<sf:option value="성동구">성동구</sf:option>
			<sf:option value="성북구">성북구</sf:option>
			<sf:option value="송파구">송파구</sf:option>
			<sf:option value="양천구">양천구</sf:option>
			<sf:option value="영등포구">영등포구</sf:option>
			<sf:option value="용산구">용산구</sf:option>
			<sf:option value="은평구">은평구</sf:option>
			<sf:option value="종로구">종로구</sf:option>
			<sf:option value="중구">중구</sf:option>
			<sf:option value="중랑구">중랑구</sf:option>
		
			</sf:select>
			</td>	
		</tr>
	
		<tr>
			<td id="title"><b>주소</b></td>
			<td><sf:input path="address" size="50" maxlength="50" placeholder="주소는 3~20자 이내로 입력해 주세요."/> <br/>
			<sf:errors path="address" cssClass="error"/>
			</td>
		</tr>
		
		<tr>
			<td id="title"><b>소개</b></td>
			<td><sf:input path="intro" size="200" maxlength="200" placeholder="카페 소개글을 입력해주세요."/> <br/>
			<sf:errors path="intro" cssClass="error"/>
			</td>
		</tr>
		
		<tr>
			<td id="title"><b>영업시간</b></td>
			<td><sf:input path="operating_time" size="50" maxlength="50" placeholder="영업시간을 입력해주세요. ex)07:30~20:00"/> <br/>
			<sf:errors path="operating_time" cssClass="error"/>
			</td>
		</tr>
	
		<tr>
			<td id="title"><b>카페 연락처</b></td>
			<td><sf:input path="cafe_tel" size="50" maxlength="50" placeholder="전화번호를 입력해 주세요."/> <br/>
			<sf:errors path="cafe_tel" cssClass="error"/>
			</td>
		</tr>
		
		<tr>
			<td id="title"><b>홈페이지</b></td>
			<td><sf:input path="homepage" size="50" maxlength="50"/> <br/>
			<sf:errors path="homepage" cssClass="error"/>
			</td>
		</tr>
		
		<tr>
			<td id="title"><b>행사</b></td>
			<td><sf:radiobutton path="event" value="true" label="있음" size="50" maxlength="50"/>
			<sf:radiobutton path="event" value="false" label="없음" size="50" maxlength="50"/> <br/>
			<sf:errors path="event" cssClass="error"/>
			</td>
		</tr>
		
			<tr>
			<td id="title"><b>콘센트</b></td>
			<td><sf:radiobutton path="concent" value="true" label="돼요" size="50" maxlength="50"/>
			<sf:radiobutton path="concent" value="false" label="안 돼요" size="50" maxlength="50"/> <br/>
			<sf:errors path="concent" cssClass="error"/>
			</td>
		</tr>
		
		<tr>
			<td id="title"><b>반려 동물 입장</b></td>
			<td><sf:radiobutton path="pet" value="true" label="돼요" size="50" maxlength="50"/>
			<sf:radiobutton path="pet" value="false" label="안 돼요" size="50" maxlength="50"/> <br/>
			<sf:errors path="pet" cssClass="error"/>
			</td>
		</tr>
		
		<tr>
			<td id="title"><b>와이파이</b></td>
			<td><sf:radiobutton path="wifi" value="true" label="있음" size="50" maxlength="50"/>
			<sf:radiobutton path="wifi" value="false" label="없음" size="50" maxlength="50"/> <br/>
			<sf:errors path="wifi" cssClass="error"/>
			</td>
		</tr>
		
		<tr>
			<td id="title"><b>주차 공간</b></td>
			<td><sf:radiobutton path="parking_zone" value="true" label="있음" size="50" maxlength="50"/>
			<sf:radiobutton path="parking_zone" value="false" label="없음" size="50" maxlength="50"/> <br/>
			<sf:errors path="parking_zone" cssClass="error"/>
			</td>
		</tr>
		
		<tr>
			<td id="title"><b>흡연실</b></td>
			<td><sf:radiobutton path="smoking_room" value="true" label="있음" size="50" maxlength="50"/>
			<sf:radiobutton path="smoking_room" value="false" label="없음" size="50" maxlength="50"/> <br/>
			<sf:errors path="smoking_room" cssClass="error"/>
			</td>
		</tr>
		
		
		<tr>
			<td id="title"><b>화장실</b></td>
			<td><sf:radiobutton path="toilet" value="true" label="있음" size="50" maxlength="50"/>
			<sf:radiobutton path="toilet" value="false" label="없음" size="50" maxlength="50"/> <br/>
			<sf:errors path="toilet" cssClass="error"/>
			</td>	
		</tr>

	</table>
	<input type="submit" value="등록">
	</center>
</sf:form>