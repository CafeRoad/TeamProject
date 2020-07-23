<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <style type="text/css">
        #update{
            width:900px;
            margin-left:auto; 
            margin-right:auto;
            border:3px;
        }
        
        td{
            border:1px;
             background-color:white;
          }
       #mail1,#mail2 {
   
     display: inline-block;
        }
        #title{
            background-color:white
        }
        #mail1{
        width : 200px;
        }
        #mail2{
        width : 200px;
        }
        #update{
        width : 600px;
        }
   
    
    
    
    
    </style>
    <jsp:include page="myPageTopButton.jsp" flush="false"/>
    <form>
   
    
 
        <br><br>
       <center> <b><font size="6" color="gray">회원정보 수정</font></b></center>
        
           
            <br><br>    
            <table id="update">
                <tr>
                    <td id="title">아이디</td>
                    <td id="title">chbr101</td>
                </tr>
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="password" maxlength="50" 
                            value="">
                    </td>
                
                </tr>
                <tr>
                    <td id="title">이름</td>
                    <td>
                     <input type="text" name="name" maxlength="50" value="" id="name">
                     </td>
                </tr>
                <tr>
                    <td id="title">이메일</td>
                    <td id="mail">
                        <input type="text" name="mail1" maxlength="10" value="" id="mail1">
                        @
                        <select width="200" name="mail2" id="mail2">
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="daum.net" >daum.net</option>
                            <option value="nate.com">nate.com</option>                        
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">휴대전화</td>
                    <td>
                        <input type="text" name="phone" value="" id="phone">
                    </td>
                </tr>
                
            </table>
            
            <center><input type="button" value="취소" onclick="javascript:window.location='MainForm.jsp'">
            <input type="submit" value="수정"/></center><br><br>  
        </form>
        

