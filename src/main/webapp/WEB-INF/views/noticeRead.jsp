<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<style>
	#wrap{
		margin:0;
		display:flex;
		flex-direction: column;
	}
</style>
<!-- 반복문 처리시킬 것 -->
	<table border="1">
	<tr>
		<td>제목</td>
		<td> 
			${read.title}
		</td>
	</tr>
	<tr>
		<td>카테고리</td>
		<td> 
			${read.category}
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td style="width:300px; height:500px"> 
			${read.content}
		</td>
	</tr>
	<tr> 
		<td colspan="2">
			<a href="modify?bno=${read.bno}">수정</a> |
			<a href="remove?bno=${read.bno}">삭제</a> |
			<a href="${path}/Notice/notice">목록으로</a>
		</td>
	</tr>
	</table>
	<div>
	<!-- 등록된 파일이 있을 시 -->
		<c:if test="${!empty read.files}">
		<ul class="uploadList">
			<c:forEach var="file" items="${read.files}">
				<li data-src="${file}">
					<c:choose>
						<c:when test="${fn:contains(file,'s_')}">
							<img src="${path}/displayFile?fileName=${file}"/>
							<div>
								<a href="${path}/displayFile?fileName=${fn:replace(file,'s_','')}" target="_blank">
									${fn:substringAfter(fn:replace(file,'s_',''),'_')}
								</a>
							</div>
						</c:when>
						<c:otherwise>
							<!-- 일반 파일 -->
							<img src="${path}/resources/img/file.png"/>
							<div>
								<a href="${path}/displayFile?fileName=${file}">
									${fn:substringAfter(file,'_')}
								</a>
							</div>
						</c:otherwise>
					</c:choose>
				</li>
			</c:forEach>
		</ul>
	</c:if>
	</div>
	<br/>
	<div>
	<hr style="clear:both;"/>
	</div>
<%@ include file="comment.jsp" %>
<%@ include file = "footer.jsp" %>