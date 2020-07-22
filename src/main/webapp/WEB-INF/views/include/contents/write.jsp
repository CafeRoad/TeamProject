<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<form action="write.do" style="color: #D9418C;" method="post"
				enctype="multipart/form-data">
				<table class="table table-striped"
					style="board: 2px solid #FFFFFF; text-align: center; background-color: white">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #EEEEEE; text-align: center;">글쓰기
								양식</th>
						</tr>
					</thead>
					<tr>
						<td><input type="text" placeholder="subject" name="subject"
							class="form-control" /></td>
					</tr>
					<tr>
						<td><textarea rows="10" class="form-control"
								placeholder="content" name="content"></textarea></td>
					</tr>
					<tr></tr>
					<tr>
						<td>파일<input type="button"
							class="btn btn-default btn-xs pull-right" id="add" name="add"
							value="파일추가" class="form-control"> <input type="button"
							class="btn btn-default btn-xs pull-right" onclick="delbtn();"
							value="파일삭제" class="form-control"></td>
					</tr>
					<tr>
						<td><input type="file" class="form-control" name="file"
							id="file"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit"
							style="background-color: white;"
							class="btn btn-default pull-right" value="등록" /> <input
							type="button" style="background-color: white;"
							class="btn btn-default pull-right"
							onclick="javascript:location.href='board.do'" value="글목록" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>