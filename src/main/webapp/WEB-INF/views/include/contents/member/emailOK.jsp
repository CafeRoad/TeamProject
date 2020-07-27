<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

  <style>
  .main{
   font-size: 60px;
   font-weight: bold;
   text-align: center;
  }
 .
.price-guest{
width:300px;
height:300px;
border:1px solid black;
margin:100px;
border-radius:4px;
background:rgb(255, 255, 255);
}

.prices{
 
   text-align:center;
}



.price-guest-title{
font-size:1.5rem;
background: rgba(0,0,0,.03);
text-align:center;
height:53px;
line-height:53px;
border-bottom:1px solid black;

}

.price-guest-button{

width:300px;
border:1px orange;
background-color:orange;
font-size:20px;

border:1px solid black;

font-size:20px;
border-top-right-radius: 5px;
border-top-left-radius: 5px;
border-bottom-right-radius: 5px;
border-bottom-left-radius: 5px;


}

.price-guest-info {

font-size:1.5rem;

background-color:#f6f6f6;
width:500px;
height:300px;
margin:0 auto;
}



</style>
  
 

   <div class="main">
    
  <div class="prices">
    <br>이메일인증
    </div>
   <div class="price-guest">
    
     <div class="price-guest-info">
     <br>축하합니다!<br>이메일 인증이 완료 되었습니다.<br><br>
           
      <button class="price-guest-button" onClick="location.href='/cafe/login'">
     로그인
    </button>


     </div>
     
     
    

   </div>
   <br><br>

