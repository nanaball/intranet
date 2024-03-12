<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!-- page import 할땐 패키지명을 다 기입할 것. 파일을 열어서 제일 상단에 있는 1줄 -->
<%@ page import=
	"java.sql.*, java.util.*, com.bitc.intranet.vo.WelfareVO, com.bitc.intranet.util.*" %>
<style>
	div{
		text-align: center;
	}
	
	table{
		margin : 100px;
		padding : 100px;
		background-color: white;
	  	border-collapse: collapse;
	  	border-radius: 10px;
	  	border-style: hidden;
	  	box-shadow: 0 0 0 1px #000;
	  	text-align: center;
	  	table-layout: fixed;
	  	word-spacing: normal;
	}
  
	
	table tr td{
		width : 1500px;
		height : 200px;
		border-bottom: 1px solid #ccc;
		padding:10px;
		text-align: center;
		word-spacing: normal;
		
	}
	
	#title{
		text-align: center;
		height:30px;
	}
	
	.product:hover{
		cursor: pointer;
		
	}
	
	input[type='button']{
		color: white;
		background-color: #1BBC9B;
		border : 1px;
		border-radius : 10px;
		padding : 10px;
		margin-left : 20px;
		margin-right : 20px;
		width : 130px;
	}
	
	input[type='button']:hover{
	    color: black;
	    cursor: pointer;
	}
	
	input[type='submit']{
		color: white;
		background-color: #1BBC9B;
		border : 1px;
		border-radius : 10px;
		padding : 10px;
		margin-left : 20px;
		margin-right : 20px;
		width : 130px;
	}
	
	input[type='submit']:hover{
	    color: black;
	    cursor: pointer;
	}
	
</style>
<script src="http://code.jquery.com/jquery-latest.min.js">
</script>
</head>
<body>
	<!-- 게시판 리스트 -->
	<form action="welfareBuy" method="POST">
		<div id="wrap">
			<div id="detail">
				<h2>상품 상세보기</h2>	
				 <table border="1" class="list">
	                <tr id="title">
	                    <th>상품 이미지</th>
	                    <th>상품명</th>
	                    <th>상품 설명</th>
	                    <th>가격</th>
	                    <th>재고 수량</th>
	                </tr>
	                <tr>
	                	<td>이미지</td>
						<td>${Detail.model}</td>
						<td>${Detail.intro}</td>
						<td>
							<f:formatNumber value="${Detail.price}" type="number" /> 원
						</td>
						<td>
							<f:formatNumber value="${Detail.stock}" type="number" /> 개
						</td>
					</tr>
	            </table>
	            <hr/>
	            <br/>
	            <input type="submit" id="buy" value="구매하기" />
	            <input type="button" id="back" value="뒤로가기" />
	            <c:choose>
						<c:when test="${'관리자' == loginMember.getUjob()}">
							<input type="button" id="modify" value="상품 수정하기"/>
						</c:when>
				</c:choose>
			</div>
		</div>
	</form>
	<script>
		$(function(){
			$("#buy").on("click",function(){
				if(confirm("상품을 구매합니다.")){
					$("welfareBuy").submit();
					alert("구매가 완료되었습니다.")
					location.href="${pageContext.request.contextPath}/Welfare/welfare";
				}
			});
			
			$("#back").on("click",fucntion(){
				location.href="${pageContext.request.contextPath}/Welfare/welfare"
			});
			
			$("#modify").on("click",function(){
				if(confirm("상품을 수정합니다.")){
					location.href="${pageContext.request.contextPath}/Welfare/welfareModify?num=${Detail.num}";
				}
			})
		});
	</script>
</body>
</html>