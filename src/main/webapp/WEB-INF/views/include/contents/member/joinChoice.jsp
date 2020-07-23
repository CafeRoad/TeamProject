<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <style>
  .main{
   font-size: 60px;
   font-weight: bold;
   text-align: center;
  }
 .subtitle{
   font-size:40px;
   font-weight:300;
   text-align: center;
 }
.price-guest{
width:300px;
height:300px;
border:1px solid black;
margin:100px;
border-radius:4px;
}

.prices{
  display:flex;
}

.main{
  width: 1000px;
  margin:0 auto;
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
padding: .5rem 1rem;
font-size:1.25rem;
line-height:1.5;
border-radius:.3rem;
color : #007bff;
background-color: transparent;
background-image:none;
border-color: black;
border:1px solid black;

}

.price-guest-info {

font-size:1.5rem;
padding:15px
}



</style>

   <div class="main">
     <div class="title">
     <br>회원가입
     </div>
    <div class="subtitle">
      카페로그 회원가입에 오신것을 환영합니다.
    </div>
   <div class="prices">
   <div class="price-guest">
     <div class="price-guest-title">
     일반회원
     </div>
     <div class="price-guest-info">
     <br>손님께서는 이쪽에서 회원가입을 해주세요.
     </div>
<input type="button" value="가입하기" onclick="location.href='/cafe/joinUser'">


     </div>
   <div class="price-guest">
     <div class="price-guest-title">
     사장님
     </div>
     <div class="price-guest-info">
     <br>사장님께서는 이쪽에서 <br>회원가입을 해주세요.
     </div>
     
<input type="button" value="가입하기" onclick="location.href='/cafe/joinOwner'">

     </div>
     </div>
   
   
   

 
 