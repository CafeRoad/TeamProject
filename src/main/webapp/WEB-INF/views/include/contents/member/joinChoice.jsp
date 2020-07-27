<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <style>
  #choice{
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

#choice{
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

font-size:1.5rem;
padding:15px;
margin-top:-30px;
}
.owner-button{
margin-top:-40px;
}


</style>

   <div id="choice">
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
     <br>손님께서는 이쪽에서 회원가입을 해주세요.<br><br>
     <button class="price-guest-button" value="가입하기" onclick="location.href='/cafe/joinUser'">가입하기</button>
     
     </div>

     </div>
   <div class="price-guest">
     <div class="price-guest-title">
     기업회원
     </div>
     <div class="price-guest-info">
     
     <br>카페를 운영하시는<br>사장님께서는 이쪽에서 가입을 해주세요.<br>
      </div>
      <div class="owner-button">
     <button class="price-guest-button" value="가입하기" onclick="location.href='/cafe/joinOwner'">가입하기</button>
     
     
     </div>
     

     </div>
     </div>
   
   


 
 