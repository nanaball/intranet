<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>새 글 작성</h1>
	<form method="POST">
		<table border="1">
			<tr>
				<th colspan="2"><h1>자유게시판</h1></th>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<c:if test="${not empty loginMember}">
						 ${loginMember.getUname()}
					</c:if> <c:if test="${empty loginMember}">
					없음 
					</c:if>
				</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td><select name="category">
						<option value="공지">공지</option>
						<option value="사담">사담</option>
						<option value="질문">질문</option>
				</select> <label>카테고리를 선택해주세요</label></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" autofocus required
					style="width: 100%;" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" required
						style="resize: none; width: 700px; height: 200px;"></textarea></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" id="freesus" value="작성완료" />
					<input type="reset" id="freereset" value="초기화" /></th>
			</tr>
		</table>
	</form>

	<script>
		// 작성완료 버튼 클릭시
		$("#freesus").click(function() {

			// 각 칸별 빈칸 알림
			if ($("#category") == null) {
				alert("카테고리를 선택해주세요.");
				$("#category").val("");
				$("#category").focus();
				return;
			}

			if ($("#title").val().length <= 0) {
				alert("제목을 입력해주세요.");
				$("#title").val("");
				$("#title").focus();
				return;
			}

			if ($("#content").val().length <= 0) {
				alert("카테고리를 선택해주세요.");
				$("#content").val("");
				$("#content").focus();
				return;
			}
		});

		// reset 버튼
		$("#freereset")
				.on(
						"click",
						function() {
							if (confirm("정말 취소하시겠습니까?")) {
								location.href = "${pageContext.request.contextPath}/free/free/";
							}
						});
	</script>
</body>
</html>