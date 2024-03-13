<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!-- page import 할땐 패키지명을 다 기입할 것. 파일을 열어서 제일 상단에 있는 1줄 -->
<%@ page import=
	"java.sql.*, java.util.*,com.bitc.intranet.vo.NoticeVO, com.bitc.intranet.util.*" %>
<style>
	body{
		height : 600px;
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
			<br/>
			<h1>공지사항</h1>
			<br/>
			<hr/>
			<br/>
			<br/>
			 <table border="1" class="list" width="70%">
                <tr>
                    <th>글 번호</th>
                    <th>카테고리</th>
                    <th>제목</th>
                    <th>작성시간</th>
                    <th>조회수</th>
                </tr>
				<c:choose>
					<c:when test="${!empty List}">
						<c:forEach var="b" items="${List}">
							<tr>
								<td>${b.bno}</td>
								<td>

									[${b.category}]
								</td>
								<td>
									<a href="noticeRead${pm.makeQuery(pm.cri.page)}&bno=${b.bno}">
										${b.title}
									</a>
								</td>
								<td>
									<f:formatDate value="${b.regdate}" pattern="yyyy-MM-dd" />
								</td>
								<td>${b.viewcnt}</td>
							</tr>
						</c:forEach>
							<c:if test="${!empty pm and pm.maxPage > 1}">
								<tr>
									<th colspan="5">
										<c:if test="${pm.first}">
											<a href="notice?page=1">[&laquo;]</a>
										</c:if>
										<c:if test="${pm.prev}">
											<a href="notice?page=${pm.startPage-1}">[%lt;]</a>
										</c:if>
										<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
											<a href="notice?page=${i}">[${i}]</a>
										</c:forEach>
										<c:if test="${pm.next}">
											<a href="notice?page=${pm.endPage+1}">[&gt;]</a>
										</c:if>
										<c:if test="${pm.last}">
											<a href="notice?page=${pm.maxPage}">[&raquo;]</a>
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
            <c:if test="${loginMember.getUjob() == '관리자' }">
           		<input type="button" id="regist" value="새 글 작성" />
            </c:if>
		</div>
	</div>
	
	<script>
		$(function(){
			$("#regist").on("click",function(){
				if(confirm("새 글 작성 페이지로 이동합니다")){
					location.href="${pageContext.request.contextPath}/Notice/noticeRegist";
				}
			});
		});
	</script>
</body>
</html>