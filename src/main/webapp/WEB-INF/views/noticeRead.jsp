<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>

<div style="height:auto;">
	<br/>
	<h1>공지사항</h1>
	<br/>
	<hr/>
	<br/><br/>
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
		<td style="resize:none; width:800px; height:200px"> 
			${read.content}
		</td>
	</tr>
	<tr> 
		<td colspan="2" align="center">
		<c:if test="${loginMember.getUjob() == '관리자'}">
			<a href="modify?bno=${read.bno}">수정</a> |
			<a href="remove?bno=${read.bno}">삭제</a> |
		</c:if>
			<a href="${path}/Notice/notice">목록으로</a>
		</td>
	</tr>
	</table>
	<div>
	
	<!-- 등록된 파일이 있을 시 -->
		<c:if test="${!empty read.files}">
		<ul class="uploadList" style="height:auto;">
			<c:forEach var="file" items="${read.files}">
				<li data-src="${file}">
					<c:choose>
						<c:when test="${fn:contains(file,'s_')}">
							<img src="${path}/displayFile?fileName=${file}"/>
							<div>
								<a href="${path}/displayFile?fileName=${fn:replace(file,'s_','')}" target="_blank" style="color:black;">
									${fn:substringAfter(fn:replace(file,'s_',''),'_')}
								</a>
							</div>
						</c:when>
						<c:otherwise>
							<!-- 일반 파일 -->
							<img src="${path}/resources/img/file.png"/>
							<div>
								<a href="${path}/displayFile?fileName=${file}" style="color:black;">
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
