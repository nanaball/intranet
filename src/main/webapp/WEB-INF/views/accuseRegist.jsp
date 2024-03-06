<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
	<div id="wrap">
		<div id="borders">
			<br />
			<h1>사내고발 게시판</h1>
			<br />
			<hr />
			<br /> 
			<br />
			<form method="POST">
				<table border="1">
					<tr>
						<th colspan="2"><h1>사내고발 게시판 글쓰기</h1></th>
					</tr>
					<tr>
						<td>작성자</td>
						<td><c:if test="${not empty loginMember}">
								<input name="writer" value="${loginMember.getUname()}" readonly />
							</c:if></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" autofocus required
							style="width: 100%;" /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" required
								style="resize: none; width: 800px; height: 200px;"></textarea></td>
					</tr>
					<tr>

						<th colspan="2">
							<input type="reset" id="freereset" value="작성취소" />
							<input type="submit" id="freesus" value="작성완료" /> 
						</th>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script>
		// 작성완료 버튼 클릭시
		$("#freesus").click(function() {


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
		$("#freereset").on("click",function() {
			if (confirm("정말 취소하시겠습니까?")) {
				location.href = "${pageContext.request.contextPath}/accuse";
			}
		});
	</script>