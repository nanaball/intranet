<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!-- page import 할땐 패키지명을 다 기입할 것. 파일을 열어서 제일 상단에 있는 1줄 -->
<%@ page import=
	"java.sql.*, java.util.*, com.bitc.intranet.vo.BoardVO, com.bitc.intranet.util.*" %>
<%
	String strPageNum = request.getParameter("page");
	int pageNum = 1;
	if(strPageNum != null){
		pageNum = Integer.parseInt(strPageNum);
	}
	
	/* Criteria cri = new Criteria(pageNum, 10);
	PageMaker pm = new PageMaker();
	pm.setCri(cri); */
	
	List<BoardVO> boardList = new ArrayList<>();
%>
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
</head>
<body>
	<div class="wrapper" style="display: flex;">
		<div class="member">
			<img src="resources/img/profile.jpg" height="100px"><br>
			<img src="resources/img/mail.jpg" height="30px"><br>
			<h3>부서명/이름</h3>
		</div>
	</div>
	<div id="wrap">
		<div id="borders">
			<h2>공지사항</h2>	
			 <table border="1" class="list">
                <tr>
                    <th>글 번호</th>
                    <th>글 제목</th>
                    <th>작성자</th>
                    <th>작성시간</th>
                    <th>조회수</th>
                </tr>
                <c:if test="${!empty boardList}">
               	<c:forEach var="n" items="${boardList}">
               	<tr>
					<td>${n.bno}</td>
					<td>
						<a href="#">
							[${n.category}] ${n.title}
						</a>
					</td>
					<td>${n.writer}</td>
					<td>${n.regdate}</td>
					<td>${n.viewcnt}</td>
				</tr>
				</c:forEach>
			</c:if>
                <%-- <tr>
	                <th colspan="4">
					<%if(pm.isFirst()){ %>
						<a href="<%=pm.makeQuery(1)%>">[처음]</a>
					<%}%>
					<%if(pm.isPrev()){ %>
						<a href="<%=pm.makeQuery(pm.getStartPage()-1)%>">[이전]</a>
					<%}%>
					<% for(int i = pm.getStartPage(); i <= pm.getEndPage(); i++){ %>
						<a href="<%=pm.makeQuery(i)%>">[<%=i%>]</a>					
					<%} %>
					<%if(pm.isNext()){ %>
						<a href="<%=pm.makeQuery(pm.getEndPage()+1)%>">[다음]</a>
					<%}%>
					<% if(pm.isLast()){ %>
						<a href="<%=pm.makeQuery(pm.getMaxPage())%>">[마지막]</a>
					<%}%>
					</th>
				</tr> --%>
			<c:if test="${empty boardList}">
					<tr><th colspan="4">등록된 게시물이 없습니다</th></tr>
			</c:if>
            </table>
		</div>
	</div>
</body>
</html>