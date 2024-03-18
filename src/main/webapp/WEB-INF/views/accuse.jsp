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
    
    #wrap > .search{
    	justify-content: center;
    }
    
    #div > #wrap > #searchBtn{
    	hegiht : 500px;
    }
    
    #regist {
        margin-left: auto; /* 버튼을 오른쪽으로 이동 */
    }
    
</style>
<script src="http://code.jquery.com/jquery-latest.min.js">
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
                    <th>글번호</th>
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
												&nbsp;[수정]
												</c:if>
												&nbsp;${b.title} 
											</a>
											</td>
											<c:choose>
											    <c:when test="${'admin' == loginMember.getUid()}">
											        <td align="center">${b.writer}</td>							
											    </c:when>
											    <c:otherwise>
											        <c:choose>
											            <c:when test="${b.writer == '관리자'}">
											                <td align="center">관리자</td>
											            </c:when>
											            <c:otherwise>
											                <td></td>
											            </c:otherwise>
											        </c:choose>
											    </c:otherwise>
											</c:choose>
											<td align="center">
												<f:formatDate value="${b.updatedate}" pattern="yyyy-MM-dd HH:mm" />
											</td>
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
							<c:if test="${!empty pm and pm.maxPage > 1}">
								<tr>
									<th colspan="5">
										<c:if test="${pm.first}">
											<a href="accuse?page=1">[&laquo;]</a>
										</c:if>
										<c:if test="${pm.prev}">
											<a href="accuse?page=${pm.startPage-1}">[%lt;]</a>
										</c:if>
										<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
											<a href="accuse?page=${i}">[${i}]</a>
										</c:forEach>
										<c:if test="${pm.next}">
											<a href="accuse?page=${pm.endPage+1}">[&gt;]</a>
										</c:if>
										<c:if test="${pm.last}">
											<a href="accuse?page=${pm.maxPage}">[&raquo;]</a>
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
					location.href="${pageContext.request.contextPath}/accuse/accuseRegist";
				}
			});
		});

			
		// 게시글 제목 검색
		$("#searchBtn").click(function(){		
			let search = $("#search").val();
			let page = 1; // 페이지 번호는 기본적으로 1로 설정

			searchAccuse(search, page);
			
		});

		function searchAccuse(search, page) {
		
			$.ajax({
				url : "${path}/accuse/accuseSearch/" + page,
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
			            
			            // 검색 결과를 테이블에 추가			          
			            html.append("<tr><th>글번호</th><th>제목</th><th>작성자</th><th>작성시간</th><th>조회수</th></tr>");
			            for (let i = 0; i < data.length; i++) {
			            	console.log(data[i]);
			                let row = $("<tr>");
			                row.append($("<td>").text(data[i].bno));
			                row.append($("<td>").append($("<a>").attr("href", "${path}/accuse/readPage?bno=" + data[i].bno).text(data[i].title)));
			                if (data[i].writer === '관리자') {
			                    row.append($("<td>").text('관리자'));
			                } else {
			                    row.append($("<td>"));
			                }			                
			                let regdate = new Date(data[i].updatedate);
			                let fmtUpdatedate = regdate.getFullYear().toString().substr(-2) + '-' + ('0' + (regdate.getMonth() + 1)).slice(-2) + '-' + ('0' + regdate.getDate()).slice(-2) + ' ' + ('0' + regdate.getHours()).slice(-2) + ':' + ('0' + regdate.getMinutes()).slice(-2);
			                row.append($("<td>").text(fmtUpdatedate));
			                row.append($("<td>").text(data[i].viewcnt));
			                html.append(row);
			            }	
			            
			         // 페이징 처리
			            let pagingHtml = generatePagingHtml(data.pm);
			            $("#paging").html(pagingHtml);
				 },
				error:function(e, status){
					alert(e);
					console.log("error response : ", e);
					console.log("처리상태 : " , status);
					console.log("error message : " , e.responseText);
				}
			});

		}
		
		function generatePagingHtml(pm) {
		    let pagingHtml = "";

		    if (pm.totalCount > 0) {
		        pagingHtml += "<tr><th colspan='5'>";
		        if (pm.prev) {
		            pagingHtml += "<a href='#' onclick='searchAccuse(\"" + search + "\", " + (pm.startPage - 1) + ")'>Previous</a>";
		        }
		        for (let i = pm.startPage; i <= pm.endPage; i++) {
		            pagingHtml += "<a href='#' onclick='searchAccuse(\"" + search + "\", " + i + ")'>" + i + "</a>";
		        }
		        if (pm.next) {
		            pagingHtml += "<a href='#' onclick='searchAccuse(\"" + search + "\", " + (pm.endPage + 1) + ")'>Next</a>";
		        }
		        pagingHtml += "</th></tr>";
		    }

		    return pagingHtml;
		}
		
		$(function(){
			$("#search").keydown(function(event){
				if(event.keyCode === 13){
					$("#searchBtn").click();
				}
			})
		});
	</script>

<%@ include file="/WEB-INF/views/footer.jsp" %>

