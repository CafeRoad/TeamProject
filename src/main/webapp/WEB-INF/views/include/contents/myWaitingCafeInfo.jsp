<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style type="text/css">
#info {
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
<center>
	<br> <br> <b><font size="6" color="gray">내 대기중인 카페</font></b> <br>
	<br> <br>

	<table id="info">
		<tr>
			<td id="title">카페 아이디.</td>
			<td>${myWaitingCafe.getCafe_id() }</td>
		</tr>

		<tr>
			<td id="title">오너 아이디</td>
			<td>${myWaitingCafe.getOwner_id() }</td>
		</tr>

		<tr>
			<td id="title">카페 이름.</td>
			<td>${myWaitingCafe.getCafe_name() }</td>
		</tr>

		<tr>
			<td id="title">성별</td>
			<td></td>
		</tr>

		<tr>
			<td id="title">생일</td>
			<td></td>
		</tr>

		<tr>
			<td id="title">이메일</td>
			<td>${signedMember.getEmail() }</td>
		</tr>

		<tr>
			<td id="title">권한</td>
			<td>${signedMember.getAuthority() }</td>
		</tr>
		<tr>
			<td id="title">주소</td>
			<td></td>
		</tr>
	</table>
</center>
<br>