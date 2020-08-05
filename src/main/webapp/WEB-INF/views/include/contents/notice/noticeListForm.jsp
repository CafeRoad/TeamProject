<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:url var="admin" value="ADMIN"/>
<!DOCTYPE html>

<html>
<head>

    <style type="text/css">
        #wrap {
            width: 800px;
            margin: 0 auto 0 auto;
        }
        #topForm{
            text-align :right;
        }
        #board, #pageForm, #searchForm{
            text-align :center;
        }
        
        #bList{
            text-align :center;
        }
    </style>

</head>
<body>    
 <c:url var="noticeFormUrl" value="/noticeList"/>
<div id="wrap">
	<br><br>
	<center>
	<b><font size="6" color="gray">공　지　사　항</font></b>
	</center>
    <br>
    <div id="topForm">
    <c:if test="${signedMember.getAuthority().equals(admin)}">    
            <input type="button" value="글쓰기" onclick="location.href='/cafe/noticeWriteForm'">
     </c:if>
    </div>
    

    <br>
    <div id="board">
        <table id="bList" width="800" border="3" bordercolor="lightgray">
            <tr heigh="30">
                <td>글번호</td>
                <td>제목</td>
                <td>작성자</td>
                <td>작성일</td>
            </tr>
        
            <tr>
                <td>1</td>
                <td>리스트 테스트</td>
                <td>관리자</td>
                <td>2020.08.10 </td>
            </tr>
        </table>
    </div>

    </div>
 
</body>
</html>