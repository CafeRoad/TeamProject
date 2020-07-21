<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<p/><p/><p/><p/><p/><p/><p/><p/>
<center>
<button type="button" class="btn btn-warning">내정보</button>
<button type="button" class="btn btn-primary">내가쓴리뷰</button>
<button type="button" class="btn btn-secondary">즐겨찾기</button>


<button type="button" class="btn btn-warning">내카페</button>
</center>

   <title>현재 유저정보 출력화면</title>
   
   <style type="text/css">
      table{
         width:500px;
         margin-left:150; 
         margin-right:150;
         border:3px;
         float: none;
         
      }
      
      td{
         border:1px 
      }
      
      
      }
   </style>
   
   
      
   </script>
   
</head>
<body>
   
   <center> 
      <br><br>
      <b><font size="6" color="gray">내 정보</font></b>
      <br><br><br>
           
      <table>
         <tr>
            <td id="title">아이디</td>
            <td></td>
         </tr>
                  
         <tr>
            <td id="title">비밀번호</td>
            <td></td>
         </tr>
               
         <tr>
            <td id="title">이름</td>
            <td></td>
         </tr>
               
         <tr>
            <td id="title">성별</td>
            <td></td>
         </tr>
               
         <tr>
            <td id="title">생일</td>
            <td>
               
            </td>
         </tr>
               
         <tr>
            <td id="title">이메일</td>
            <td>
              
            </td>
         </tr>
               
         <tr>
            <td id="title">휴대전화</td>
            <td></td>
         </tr>
         <tr>
            <td id="title">주소</td>
            <td>
               
            </td>
         </tr>
      </table>
  </center>    
      <br>
      <center>
      <input type="button" value="뒤로" onclick="changeForm(-1)">
      <input type="button" value="회원정보 변경" onclick="changeForm(0)">
      <input type="button" value="회원탈퇴" onclick="changeForm(1)">
        </center>
</body>
