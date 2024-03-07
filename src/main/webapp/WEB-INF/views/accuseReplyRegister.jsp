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
			<form method="POST" action="accuseReplyRegister">
				<input type="hidden" name="uno" value="${loginMember.uno}" />
				<input type="hidden" name="origin" value="${origin.origin}"/>
 				<input type="hidden" name="depth" value="${origin.depth}"/>
 	 			<input type="hidden" name="seq" value="${origin.seq}"/>
				<table border="1">
					<tr>
						<th colspan="2"><h1>사내고발 게시판 답변글쓰기</h1></th>
					</tr>
					<tr>
						<td>작성자</td>
						<td>
							<c:if test="${not empty loginMember}">
								<input name="writer" value="${loginMember.getUname()}" readonly />
							</c:if>
						</td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" autofocus required style="width: 100%;" /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea name="content" required style="resize: none; width: 800px; height: 200px;"></textarea>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<input type="reset" id="accreset" value="작성취소" />
							<input type="submit" id="accuseReplyRegister" value="작성완료" /> 
						</th>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script>
	$(document).ready(function() {
		// 작성완료 버튼 클릭시
		$("#accuseReplyRegister").click(function() {
			if ($("#title").val().length <= 0) {
				alert("제목을 입력해주세요.");
				$("#title").val("");
				$("#title").focus();
				return false;
			}
		});

		// reset 버튼
		$("#accreset").on("click",function() {
			if (confirm("정말 취소하시겠습니까?")) {
				location.href = "${pageContext.request.contextPath}/accuse/accuse";
			}
		});
	});
	</script>