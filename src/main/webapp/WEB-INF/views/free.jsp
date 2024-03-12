<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!-- page import 할땐 패키지명을 다 기입할 것. 파일을 열어서 제일 상단에 있는 1줄 -->
<%@ page import=
	"java.sql.*, java.util.*, com.bitc.intranet.vo.FreeVO, com.bitc.intranet.util.*" %>
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
			<h1>자유게시판</h1>	
			<br/>
			<hr/>
			<br/>
			<br/>
			 <table border="1" class="list" width="70%">
                <tr >
                    <th>글번호</th>
                    <th>카테고리</th>
                    <th>제목</th>
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
										<td align="center">${b.category}</td>
										<td>
											<a href="${path}/free/readPage?bno=${b.bno}"> 
												<!-- 답변글일 경우 -->
												<c:if test="${b.depth != 0}">
													<c:forEach var="i" begin="1" end="${b.depth}">
														&nbsp;&nbsp;
													</c:forEach>
														⤷
												</c:if> 
												<c:if test="${b.regdate ne b.updatedate}">
												&nbsp;[수정]
												</c:if>
												&nbsp;${b.title} 
											</a>
											</td>
											<td align="center">${b.writer}</td>
											<td align="center">
												<f:formatDate value="${b.updatedate}" pattern="yyyy-MM-dd HH:mm" />
											</td>
											<td align="center">${b.viewcnt}</td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4" align="center">
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
							<c:if test="${!empty pm and pm.maxPage > 1}">
								<tr>
									<th colspan="5">
										<c:if test="${pm.first}">
											<a href="free?page=1">[&laquo;]</a>
										</c:if>
										<c:if test="${pm.prev}">
											<a href="free?page=${pm.startPage-1}">[%lt;]</a>
										</c:if>
										<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
											<a href="free?page=${i}">[${i}]</a>
										</c:forEach>
										<c:if test="${pm.next}">
											<a href="free?page=${pm.endPage+1}">[&gt;]</a>
										</c:if>
										<c:if test="${pm.last}">
											<a href="free?page=${pm.maxPage}">[&raquo;]</a>
										</c:if>
									</th>
								</tr>
							</c:if>
						</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6"> 등록된 게시글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
            </table>
            <br/>
			<span class="search">
            	<input type="text" id="search" placeholder="검색할 게시글 제목" style="border:1px solid gray;" />
				<input type="button" id="searchBtn" value="검색" />
			</span>
  			<input type="button" class="regist" id="regist" value="새 글 작성" />
		</div>
	</div>
	
	<script>
		// 새글 작성 
		$(function(){
			$("#regist").click(function(){
				if(confirm("새 글 작성 페이지로 이동합니다")){
					location.href="${pageContext.request.contextPath}/free/freeRegist";
				}
			});
		});

			
		// 게시글 제목 검색
		$("#searchBtn").click(function(){
			let search = $("#search").val();
			
			$.ajax({
				url : "${path}/free/freeSearch",
				type : "get",
				datatype:"json",
				data:{
					"search" : search,
				},
				 success: function(data, statusText, response) {
			            // 결과를 표시할 테이블 요소를 찾기
			            let html = $("#borders table.list tbody");
			            // 이전 검색 결과를 삭제
			            html.empty();
			            // 검색 결과를 테이블에 추가.

			          
			            html.append("<tr><th>글번호</th><th>카테고리</th><th>제목</th><th>작성자</th><th>작성시간</th><th>조회수</th></tr>");
			            for (let i = 0; i < data.length; i++) {
			            	console.log(data[i]);
			                let row = $("<tr>");
			                row.append($("<td>").text(data[i].bno));
			                row.append($("<td>").text(data[i].category));
			                row.append($("<td>").append($("<a>").attr("href", "${path}/free/readPage?bno=" + data[i].bno).text(data[i].title)));
			                row.append($("<td>").text(data[i].writer));
			                row.append($("<td>").text(data[i].regdate));
			                row.append($("<td>").text(data[i].viewcnt));
			                html.append(row);
			            }			           
				 },
				error:function(e, status){
					alert(e);
					console.log("error response : ", e);
					console.log("처리상태 : " , status);
					console.log("error message : " , e.responseText);
				}
			});
		});
	</script>



