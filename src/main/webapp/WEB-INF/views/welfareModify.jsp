<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!-- page import 할땐 패키지명을 다 기입할 것. 파일을 열어서 제일 상단에 있는 1줄 -->
<%@ page import=
	"java.sql.*, java.util.*, com.bitc.intranet.vo.WelfareVO, com.bitc.intranet.util.*" %>
<style>
	body{
		height : 600px;
	}
	.member{
		border : "1";
		height : "163px";
	}
	#wrap{
    	border:1px solid red;
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
		<div id="modify">
			<h2>상품 수정</h2>	
			 <table border="1" class="list">
                <tr>
                    <th>글 번호</th>
                    <th>카테고리</th>
                    <th>제목</th>
                    <th>작성시간</th>
                    <th>조회수</th>
                </tr>
				<c:choose>
					<c:when test="${!empty List}">
						<c:forEach var="m" items="${List}">
							<tr>
								<td>${m.mNo}</td>
								<td>

									[${m.mName}]
								</td>
								<td>
									<a href="${path}welfareDetail?mNo=${m.mNo}">
										${b.price}
									</a>
								</td>
								<td>
									<f:formatDate value="${m.pDate}" pattern="yyyy-MM-dd" />
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5"> 등록된 게시글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			
            </table>
            <input type="button" id="modify" value="수정 완료" />
            <input type="button" id="cancel" value="수정 취소" />
		</div>
	</div>
	
	<script>
		$(function(){
			$("#modify").on("click",function(){
				if(confirm("상품 정보를 수정합니다.")){
					location.href="${pageContext.request.contextPath}/welfareDetail";
				}
			});
			
			$("#cancel").on("click",function(){
				if(confirm("수정을 취소하겠습니까?")){
					location.href="${pageContext.request.contextPath}/welfareDetail";
				}
			});
			
		});
	</script>
</body>
</html>