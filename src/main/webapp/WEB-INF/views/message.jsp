<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
  <%@ page import=
	"java.sql.*, java.util.*,com.bitc.intranet.vo.NoticeVO, com.bitc.intranet.util.*" %>
<style>
	body{
		height : 600px;
	}
	.member{
		border : "1";
		height : "163px";
	}
	#wrap{
 
        width:1450px;
        height:600px;
        margin:10px 0 10px 30px;
        display:flex;
        flex-direction:column;
        justify-content:space-between;
    }
</style>
<script src="http://code.jquery.com/jquery-latest.min.js">
	/* 2/28 작업 */
	let result = '${result}';
	if(result != '' ){
		alert(result);
	}
</script>
</head>
<body>
	<!-- 게시판 리스트 -->
	<div id="wrap">
		<div id="borders">
			<h2>결재사항</h2>	
			<br/>
			<hr/>
			<br/>
			<br/>

	<table border="1" class="list"  width="70%">

                <tr>
                    <th>글 번호</th>
                    <th>제목</th>
                    <th>발신자</th>
                    <th>작성시간</th>
                   
                </tr>
				<c:choose>
					<c:when test="${!empty list}">
						<c:forEach var="m" items="${list}">
							<tr>
								<td>${m.mno}</td>
								<td>
									<a href="messageRead?mno=${m.mno}">
										${m.title}
									</a>
								</td>
								<td>
									${m.writer}
								</td>
								<td>
									<f:formatDate value="${m.senddate}" pattern="yyyy-MM-dd HH:mm" />
								</td>
							</tr>
						</c:forEach>
						<!-- 페이징처리 -->
						<c:if test="${!empty pm and pm.maxPage > 1}">
								<tr>
									<th colspan="5">
										<c:if test="${pm.first}">
											<a href="message?page=1">[&laquo;]</a>
										</c:if>
										<c:if test="${pm.prev}">
											<a href="message?page=${pm.startPage-1}">[%lt;]</a>
										</c:if>
										<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
											<a href="message?page=${i}">[${i}]</a>
										</c:forEach>
										<c:if test="${pm.next}">
											<a href="message?page=${pm.endPage+1}">[&gt;]</a>
										</c:if>
										<c:if test="${pm.last}">
											<a href="message?page=${pm.maxPage}">[&raquo;]</a>
										</c:if>
									</th>
								</tr>
							</c:if>
						
						
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5"> 등록된 게시글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			
            </table>
            <br/>
            <input type="button" id="regist" value="새 글 작성" />
		</div>
	</div>
	
	<script>
		$(function(){
			$("#regist").on("click",function(){
				if(confirm("새 글 작성 페이지로 이동합니다")){
					location.href="${pageContext.request.contextPath}/messages/messageRegist";
				}
			});
		});
	</script>
</body>
</html>