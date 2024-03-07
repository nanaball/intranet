<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!-- page import 할땐 패키지명을 다 기입할 것. 파일을 열어서 제일 상단에 있는 1줄 -->
<%@ page import=
	"java.sql.*, java.util.*, com.bitc.intranet.vo.AccuseVO, com.bitc.intranet.util.*" %>
<style>

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
	if(result != ''){
		alert(result);
	}
</script>
</head>
<body>
	<!-- 게시판 리스트 -->
	<div id="wrap">
		<div id="borders">
		<br/>
			<h1>사내고발게시판</h1>	
			<br/>
			<hr/>
			<br/>
			<br/>
			 <table border="1" class="list" width="70%">
                <tr >
                    <th>글 번호</th>
                    <th>글제목</th>
                    <th>작성자</th>
                    <th>작성시간</th>
                    <th>조회수</th>
                </tr>
				<c:choose>
					<c:when test="${!empty List }">
						<c:forEach var="b" items="${List}">
							<c:choose>
								<c:when test="${b.showboard == 'y'}">
									<tr>
										<td align="center">${b.bno}</td>
										<td>
											<a href="${path}/accuse/readPage?bno=${b.bno}"> 
												<!-- 답변글일 경우 -->
												<c:if test="${b.depth != 0}">
													<c:forEach var="i" begin="1" end="${b.depth}">
														&nbsp;&nbsp;
													</c:forEach>
														⤷
												</c:if> 
												<c:if test="${b.regdate ne b.updatedate}">
												[수정]
												</c:if>
												${b.title} 
											</a>
											</td>
											<td align="center">${b.writer}</td>
											<td align="center">
												<f:formatDate value="${b.regdate}" pattern="yyyy-MM-dd HH:mm" />
											</td align="center">
											<td align="center">${b.viewcnt}</td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="3" align="center">
												&nbsp;삭제된 게시물 입니다.
											</td>
											<td align="center">
												<!-- 게시글 삭제요청 처리 시간 --> 
												<f:formatDate value="${b.updatedate}" pattern="yyyy-MM-dd HH:mm" />
											</td>
											<td></td>
										</tr>
									</c:otherwise>
								</c:choose>
							</c:forEach>
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
					location.href="${pageContext.request.contextPath}/accuse/accuseRegist";
				}
			});
		});
	</script>
</body>
</html>
</html>



