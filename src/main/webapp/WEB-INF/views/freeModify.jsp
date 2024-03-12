<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<div>
		<div>
			<br />
			<h1>자유게시판</h1>
			<br />
			<hr />
			<br /> 
			<br />
		<!-- model FreeVO -->
		<!-- board/modify POST -->
		<form method="POST">
			<input type="hidden" name="bno" value="${freeVO.bno}"/>
			<table border="1">
				<tr>
					<th colspan = "2"><h1>자유게시판 게시글 수정</h1></th>
				</tr>
				<tr>
					<td>작성자</td>
					<td>
						<c:if test="${!empty loginMember }">
							<input type="text" name="writer" value="${loginMember.getUname()}" readonly />
						</c:if>
					</td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td>
						<select name="category"  >
							<option>${read.category}</option>
							<option value="공지">공지</option>
							<option value="사담">사담</option>
							<option value="질문">질문</option>
							<option value="답변">답변</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>
						<input name="title" autofocus required style="width:800px;" value="${read.title}"/>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea name="content" required style="resize:none; width:800px; height:200px;">${read.content}</textarea>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<a href="readPage?bno=${read.bno}">
							<input type="button" value="이전페이지"/>
						</a>
						<input type="reset"  value="수정취소" />
						<input type="submit"  value="수정완료" />
					</th>
				</tr>
			</table>
		</form>
		<div>
	</div>
</body>
</html>