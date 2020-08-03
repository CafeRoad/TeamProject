<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:url var="admin" value="ADMIN"/>
<!DOCTYPE html>
<html>
<head>
    <title>전체 게시글</title>
    
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
    
    <script type="text/javascript">
        function writeForm(){
            location.href="BoardWriteForm.bo";
        }
    </script>
    
</head>
<body>    
 <c:url var="noticeFormUrl" value="/noticeList"/>
<div id="wrap">
	<br><br>
	<h4>공지사항</h4>
    <!-- 글목록 위 부분-->
    <br>
    <div id="topForm">
    <c:if test="${signedMember.getAuthority().equals(admin)}">    
            <input type="button" value="글쓰기" onclick="writeForm()">
     </c:if>
    </div>
    
    <!-- 게시글 목록 부분 -->
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
                <td>글번호 글번호 글번호</td>
                <td>
                    
                   제목 제목 제목작성일작성일작성일작성일작성일작성일작성일작성일작성일작성일작성일작성일작성일작성일
                </td>
                <td>
                   작성자 작성자 작성자
                </td>
                <td>작성일 작성일 작성일 </td>
            </tr>
        </table>
    </div>
    
    
    
    </div>
 
</body>
</html>