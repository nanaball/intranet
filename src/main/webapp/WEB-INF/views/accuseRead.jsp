<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div>
	<br />
	<h1>사내고발 게시판</h1>
	<br />
	<hr />
	<br /> <br />
	<!-- 반복문 처리시킬 것 -->
	<table border="1">
		<tr>
			<td>제목</td>
			<td>${read.title}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<c:choose>
				<c:when test="${'admin' == loginMember.getUid()}">
					<td>${read.writer}</td>							
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${read.writer == '관리자'}">
							<td>관리자</td>
						</c:when>
						<c:otherwise>
							<td></td>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<td>작성시간</td>
			<td><f:formatDate value="${read.regdate}"
					pattern="yyyy-MM-dd HH:mm" /></td>
		</tr>
		<tr>
			<td>내용</td>
			<td style="resize: none; width: 800px; height: 200px;">${read.content}</td>

		</tr>
		<tr>
			<td colspan="2" align="center">
				<c:if test="${loginMember.uno eq read.uno or loginMember.uid eq 'admin'}">
					<input type="button" id="deleteBtn" value="게시글 삭제" />					
				</c:if>
				<input type="button" id="replyBtn" value="답변글 작성" />
				<input type="button" id="listBtn" value="게시글 목록" /> 
				<c:if test="${loginMember.uno eq read.uno}">
					<input type="button" id="modifyBtn" value="게시글 수정" />
				</c:if>
			</td>
		</tr>
	</table>
	<form id="readForm">
 		<input type="hidden" name="bno" value="${read.bno}"/>
 	</form>	
 	<script>

 	// 게시글 목록 페이지 이동
 	$("#listBtn").click(function(){
 							// controller(/accuse)/getMapping(accuse)
 		location.href="${path}/accuse/accuse";
 	});
 
 	// 답글, 수정, 삭제 요청 페이지 이동
 	let formObj = $("#readForm");
 	
 	$("#replyBtn").click(function(){
 		formObj.attr("action","${path}/accuse/accuseReplyRegister");
 		formObj.submit();	
 	});
 	
 	$("#modifyBtn").click(function(){
 		formObj.attr("action","${path}/accuse/modify").submit();
 	});
 
 	$("#deleteBtn").click(function(){
 		// 게시글 삭제
 		if(confirm("게시글을 삭제하시겠습니까?")){
 			formObj.attr("action","${path}/accuse/remove");
 			formObj.attr("method","POST");
 			formObj.submit();
 		} 	
 	});
 	
 </script>
 <%@ include file="/WEB-INF/views/footer.jsp" %>