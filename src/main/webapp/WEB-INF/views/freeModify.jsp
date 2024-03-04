<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
</head>
<body>
	<br />
	<h1>자유게시판</h1>
	<br/>
	<hr/>
	<br/>
	<br/>
		<!-- model boardVO -->
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
						<select name="category">
							<option >카테고리를 선택해주세요</option>
							<option value="공지">공지</option>
							<option value="사담" >사담</option>
							<option value="질문">질문</option>
							<option value="답변">답변</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="title" autofocus required style="width:100%;" value="${freeVO.title}"/>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea name="content" required style="resize:none; width:700px; height:200px;">${freeVO.content}</textarea>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" id="bodsus" value="수정완료" />
						<input type="reset" id="bodreset" value="초기화" />
					</th>
				</tr>
			</table>
		</form>
</body>
</html>