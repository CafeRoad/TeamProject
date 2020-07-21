<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   
 
    <title>회원정보 수정화면</title>
    
    <style type="text/css">
        table{
            width : 630px;
            margin-left:auto; 
            margin-right:auto;
            border:3px white;
        }
        
        td{
            border:1px white
        }
        
        #title{
            background-color:orange
        }
    </style>
    
   
    
</head>
<body onload="init()">
 
        <br><br>
        <b><font size="6" color="gray">회원정보 수정</font></b>
        <br><br><br>
        
        
                
            
            </table>    
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
                     <input type="text" name="mail1" maxlength="50" 
                            value="">
                </tr>
                    
                
                    
                
                    
                <tr>
                    <td id="title">이메일</td>
                    <td>
                        <input type="text" name="mail1" maxlength="50" 
                            value="">
                        
                        <select name="mail2" id="mail2">
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
                        <input type="text" name="phone" value=""/>
                    </td>
                </tr>
                
            </table>
            <br><br>
            <input type="button" value="취소" onclick="javascript:window.location='MainForm.jsp'">
            <input type="submit" value="수정"/>  
        </form>
        
</body>
</html>

