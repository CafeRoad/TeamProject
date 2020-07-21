<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style type="text/css">
        #deleteTable{
        width : 630px;
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue;
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
    </style>
    
    

</head>
<body>
<br><br>
    <center><b><font size="6" color="gray">내 정보</font></b></center>
    <br><br><br>
 
    <form name="deleteform" method="post" action="MainForm.jsp?contentPage=member/pro/DeletePro.jsp"
        onsubmit="return checkValue()">
 
        <table id="deleteTable">
            <tr>
                <td bgcolor="skyblue">비밀번호</td>
                <td><input type="password" name="password" maxlength="50"></td>
            </tr>
        </table>
        
        <br> 
        <center><input type="button" value="취소" onclick="javascript:window.location='MainForm.jsp'">
        <input type="submit" value="탈퇴" /></center> 
    </form>

</body>
</html>