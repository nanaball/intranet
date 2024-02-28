<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>새 글 작성</h1>
	<form method="GET" action="Boardregist">
	<table border="1">
		<tr>
				<th colspan = "2"><h1>공지글 작성</h1></th>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="writer" readonly />
				</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
					<select name="notice_category">
						<option value="공지" selected>공지</option>
						<option value="알림" >알림</option>
						<option value="이벤트" >이벤트</option>
						<option value="당첨" >당첨</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" autofocus required style="width:100%;"/>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" required style="resize:none; width:700px; height:200px;"></textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="작성완료" />
					<input type="reset" value="초기화	" />
				</th>
			</tr>
	</table>
	</form>
</body>
</html>