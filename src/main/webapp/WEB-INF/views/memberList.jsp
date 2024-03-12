<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<title>Insert title here</title>


<%@ page import=
	"java.sql.*, java.util.*, com.bitc.intranet.vo.MemberVO, com.bitc.intranet.util.*" %>
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
			<h1>회원 정보 관리</h1>	
			<br/>
			<hr/>
			<br/>
			<br/>
			 <table border="1" class="list" width="70%">
                <tr >
                    <th>회원번호</th>
                    <th>아이디</th>
                    <th>비밀번호</th>
                    <th>회원이름</th>
                    <th>이메일</th>
                    <th>부서</th>
                    <th>직책</th>
                    <th>입사일</th>
                </tr>
				<c:choose>
					<c:when test="${!empty List }">
						<c:forEach var="m" items="${List}">
								<tr>
									<td align="center">${m.uno}</td>
									<td align="center">${m.uid}</td>
									<td align="center">${m.upw}</td>
									<td>
										<a href="${path}/memberDelete?uno=${m.uno}"> 
											&nbsp;${m.uname} 
										</a>
									</td>
									<td align="center">${m.uemail}</td>											<td align="center">${m.uphone}</td>										</td>
									<td align="center">${m.udep}</td>
									<td align="center">${m.ujob}</td>
								</tr>
							</c:forEach>
							<c:if test="${!empty pm and pm.maxPage > 1}">
								<tr>
									<th colspan="8">
										<c:if test="${pm.first}">
											<a href="memberInfo?page=1">[&laquo;]</a>
										</c:if>
										<c:if test="${pm.prev}">
											<a href="memberInfo?page=${pm.startPage-1}">[%lt;]</a>
										</c:if>
										<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
											<a href="memberInfo?page=${i}">[${i}]</a>
										</c:forEach>
										<c:if test="${pm.next}">
											<a href="memberInfo?page=${pm.endPage+1}">[&gt;]</a>
										</c:if>
										<c:if test="${pm.last}">
											<a href="memberInfo?page=${pm.maxPage}">[&raquo;]</a>
										</c:if>
									</th>
								</tr>
							</c:if>
						</c:when>
					<c:otherwise>
						<tr>
							<td colspan="8"> 등록된 회원이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
            </table>
            <br/>
			<span class="search">
            	<input type="text" id="search" placeholder="검색할 회원 이름" style="border:1px solid gray;" />
				<input type="button" id="searchBtn" value="검색" />
			</span>
		</div>
	</div>
	
	<script>
			
		// 게시글 제목 검색
		$("#searchBtn").click(function(){
			let search = $("#search").val();
			
			$.ajax({
				url : "${path}/member/memberSearch",
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

			          
			            html.append("<tr><th>회원번호</th><th>아이디</th><th>비밀번호</th><th>회원이름</th><th>이메일</th><th>부서</th><th>직책</th><th>입사일</th></tr>");
			            for (let i = 0; i < data.length; i++) {
			            	console.log(data[i]);
			                let row = $("<tr>");
			                row.append($("<td>").text(data[i].uno));
			                row.append($("<td>").text(data[i].uid));
			                row.append($("<td>").text(data[i].upw));
			                row.append($("<td>").append($("<a>").attr("href", "${path}/memberDelete?uno=" + data[i].uno).text(data[i].uname)));
			                row.append($("<td>").text(data[i].uemail));
			                row.append($("<td>").text(data[i].udep));
			                row.append($("<td>").text(data[i].ujob));
			                row.append($("<td>").text(data[i].udate));
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
</body>
</html>
	
<%@ include file="/WEB-INF/views/footer.jsp" %>