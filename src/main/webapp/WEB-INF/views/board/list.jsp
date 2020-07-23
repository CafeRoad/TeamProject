<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<h1>리뷰 목록</h1>
<div class="container">
	<div class="row">
		<form>
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #FFOODD;">
				<thead>
					<tr>
						<th style="background-color: #EEEEEE; text-align: center;">ID</th>
						<th style="background-color: #EEEEEE; text-align: center;">날짜</th>
						<th style="background-color: #EEEEEE; text-align: center;">제목</th>
						<th style="background-color: #EEEEEE; text-align: center;">비고</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>ㅎㅎ</td>
						<td>ㅎㅎ</td>
						<td>ㅎㅎ</td>
						<td>123</td>
					</tr>
				</tbody>
				<tr>
					<td colspan="4"><input type="button"
						style="background-color: #D9418C" value="글쓰기"
						class="btn btn-primary pull-right"
						onclick="javacript:location.href='write.do'"></td>
				</tr>
			</table>
		</form>

	</div>
</div>