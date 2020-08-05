<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <style>
  
   
  .main_1{
  width:1200px;
  height:500px;
  margin: 0 auto;
  margin-top:60px;
   
  
  }
  
  
   .prices{
   display:flex;
   
   }
   
   
   .price-item{
   width: 1000px;
   height:200px;
   margin-top:-60px;
   margin:100px;
   margin-left:-48px;
   margin-bottom:-20px;
   }
   
   .subtitle1{
  
     font-size: 30px;
   font-weight: bold;
   color:orange;
   margin-bottom:-60px;
   }
   
   </style>

   <!-- Three -->
   
   <div class="main_1">
  
   <br><br><div class="subtitle1">
    카페로드 추천 리스트
   </div>
   
   <div class="prices">
   <div class="price-item"><a href="/cafe/article?article_name=article01">
  <img alt="" img src="${pageContext.request.contextPath}/resources/assets/css/images/bestMood.jpg"> </a>
  
   </div>
   <div class="price-item">
   <img alt="" src="${pageContext.request.contextPath}/resources/assets/css/images/BestAmericano.jpg"> 
  
   </div>
   <div class="price-item">
<img alt="" src="${pageContext.request.contextPath}/resources/assets/css/images/bestBingsu.jpg"> 
  
   </div>
   </div>
    <div class="prices">
   <div class="price-item">
  <img alt="" src="${pageContext.request.contextPath}/resources/assets/css/images/bestDesert.jpg"> 
  
   </div>
   <div class="price-item">
   <img alt="" src="${pageContext.request.contextPath}/resources/assets/css/images/BestJonggak.jpg"> 
  
   </div>
   <div class="price-item">
<img alt="" src="${pageContext.request.contextPath}/resources/assets/css/images/bestMood.jpg"> 
  
   </div>
   </div>
   </div><br><br><br><br><br><br><br><br><br><br><br><br><br>
   
     
   
 