<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<Style>
div {text-align:center; }

#search{
width:300px;
height:100px;
border:1px solid black;

}
.button{
margin:0 auto;
width:700px;
height:200px;
background:white;

}

.main{
font-size: 20px;
   font-weight: bold;
   text-align: center;

}


</Style>







<div>
<img src="${pageContext.request.contextPath}/resources/assets/css/images/airplane.png" alt="" />

</div>
<div class="main">
등록된 이메일로 인증 메일이 전송되었습니다.<br>
이메일을 확인해주세요.<br><br>
</div>
<div class="go">

웹 브라우저 바로가기↓↓↓
</div><br>

<div style="text-align : center;">

<input id="search" onclick="location.href='http://www.naver.com'"  type="image"  src="${pageContext.request.contextPath}/resources/assets/css/images/naver.png">

<input id="search" onclick="location.href='http://www.google.com'" type="image" src="${pageContext.request.contextPath}/resources/assets/css/images/google.png">
<input id="search" onclick="location.href='http://www.nate.com'" type="image" src="${pageContext.request.contextPath}/resources/assets/css/images/nate.png">
</div><br><br><br>


