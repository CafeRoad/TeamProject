<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.writeform_1 {
width: 700px;
height: 700px;
margin: auto;
border: 3px;
}

</style>

</head>
<body>
 
    <br>
    <center>
    <b><font class="formfont" size="6" color="gray">글쓰기</font></b>
    </center>
    
    <sf:form method="post" action="noticeWriteAction" name="noticeWriteAction"/>
    
    <table class="writeform_1">
        <tr>
            <td id="title">작성자</td>
            <td>관리자</td>
        </tr>
            <tr>
            <td id="title">
                제 목
            </td>
            <td>
                <input name="board_subject" type="text" size="70" maxlength="100" value=""/>
            </td>        
        </tr>
        <tr>
            <td id="title">
                내 용
            </td>
            <td>
                <textarea name="board_content" cols="72" rows="20"></textarea>            
            </td>        
 
        <tr align="center" valign="middle">
            <td colspan="5">
                <input type="reset" value="작성취소">
                <input type="submit" value="등록" >
                <input type="button" value="목록" onclick="history.back()">            
            </td>
        </tr>
    </table>    
    
    
</body>
</html>