<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="admin" value="ADMIN" />
 <style>

.price-guest{
width:800px;
height:500px;
border:1px solid black;
margin:100px;
border-radius:4px;
margin:0 auto;

}

.subtitle{
   font-size:40px;
   font-weight:300;
   text-align: center;
 }


.prices{
  display:flex;
  margin:0 auto;
}

.price-guest-title{
font-size:60px;
background: rgba(0,0,0,.03);
text-align:center;
height:53px;
line-height:53px;
border-bottom:1px solid black;
margin:0 auto;
}

.price-guest-button{


width:150px;
border:1px solid black;
font-weight: bold;
font-size:20px;
border-top-right-radius: 5px;
border-top-left-radius: 5px;
border-bottom-right-radius: 5px;
border-bottom-left-radius: 5px;
background: rgba(0,0,0,.03);


}

.price-guest-info {

font-size:40px;
padding:15px;
text-align:left;
}
.owner-button{
margin-top:-40px;
}


.price-guest-info2 {

font-size:1.5rem;
padding:15px;
text-align:center;
margin-top:-30px;
}






.test2{
border:1px solid black;
width:500px;
margint: 0 auto;
}
 </style>
<sf:form method="get" action="/cafe/notice/noticeRead">
      
      <br><br> <div class="subtitle">
     공지사항
    </div>
      
      
      <div class="price-guest">
     <div class="price-guest-title">
     ${noticeread.getNotice_name()}
     </div>
     <div class="price-guest-info">
     ${noticeread.getContent()}
    
     </div>

     </div> <br><br>
	<center>
		<c:if test="${signedMember.getAuthority().equals(admin)}">


			<input type="button" value="글삭제" margin="center" class="bt2"
				onclick="location.href='/cafe/noticedelete?notice_id=${noticeread.getNotice_id()}'">
		</c:if>

		<input type="button" value="목록" class="bt2"
			onclick="location.href='/cafe/noticeList'">
	</center>

</sf:form>