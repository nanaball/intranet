<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    

<style>
	 
	body{
		background-color:#F3F3F3;
	}
	 
	/* 게시판 모음 */
	#wrap{
    	/* border:1px solid red; */
        width:1730px;
        height:800px;
        margin:10px;
        display:flex;
        flex-direction:column;
        justify-content:space-between;
    }
    
     
    /* 각자 게시판들 모음 */ 
    #borders{
        display:flex;
        flex-wrap:wrap;
        justify-content:space-between;
        height:620px;
    }
    
    
    #borders div:last-child{
        width:36.5%    
    }
    
    #borders div{
        width:48%;
        height:300px;
        margin:10px 10px 10px 20px;
        padding:20px;
        background-color:white;
        border-radius:30px;
        box-sizing:border-box;
        background-size:cover;
        border: 2px solid #1BBC9B;
        box-shadow:7px 7px 5px #BDBDBD;
    } 
   
    #borders{
        display:flex;
        flex-wrap:wrap;
        justify-content:space-between;
        height:620px;
    }

    /*  
    #border1 {
 	   border: 2px solid #1BBC9B; 
	}
    
     #border2{
    	border: 2px solid #1BBC9B; 
    }
    
     #border3{
    	border:2px solid #1BBC9B; 	
    }
    
    #border4{
    	border:2px solid #1BBC9B;
    }
    
    #border5{
    	border:2px solid #1BBC9B;
    }
     */
	
	span{
		float:right;
	}
	
	span:hover {
		color: gray;
		cursor: pointer;
		font-weight:bolder;	
		/* font-style:italic; */
		text-decoration: underline;
	}
	


</style>
</head>
<body>
<%-- 	<div class="wrapper" style="display: flex;">
		<div class="selfinfo">
			<img src="resources/img/profile.jpg" height="100px"><br/>
			<img src="resources/img/mail.jpg" height="30px"><br/>
				<!-- 부서 이름 / 사원명 -->
				<c:if test="${not empty loginMember}">					
  		  			<h5>${loginMember.getUdep()} / ${loginMember.getUname()}</h5>
				</c:if>
				<c:if test="${empty loginMember}">
					없음 
				</c:if>		
		</div> --%>
		<div id="wrap">
			<div id="borders">
				<div id="border1">
					<h3>공지사항</h3>
					<h6>&nbsp;</h6>
					<span onclick="location.href='Board/board';"><h5>더보기</h5></span>					
					<h3>&nbsp;</h3>
					<h3>&nbsp;</h3>
					<table  cellspacing="10"  cellpadding="10" board="1">
<!-- 		                
						<tr>
		                    <th>글 번호</th>
		                    <th>카테고리</th>
		                    <th>제목</th>
		                    <th>작성시간</th>
		                    <th>조회수</th>
		                </tr>
-->
		                <c:if test="${!empty notice}">
		                	<c:forEach var="n" items="${notice}">
		                	<tr>
								<td>${n.bno}</td>
								<td>
									${n.category}
								</td>
								<td>
									<a href="Board/readPage?bno=${n.bno}">
										${n.title}
									</a>
								<td>
									<f:formatDate value="${n.regdate}" pattern="yy-MM-dd" />
							</tr>
							</c:forEach>
						</c:if>
					</table>					
				</div>
				<div id="border2">
					<h3>결재</h3>
				</div>
				<div id="border3">
					<h3>자유게시판</h3>
					<h6>&nbsp;</h6>
					<span onclick="location.href='free/free';"><h5>더보기</h5></span>					
					<h3>&nbsp;</h3>
					<h3>&nbsp;</h3>
					<table boarder="1" cellspacing="10"  cellpadding="10" >
		                 <c:if test="${!empty free}">
		                	<c:forEach var="f" items="${free}">
		                	<tr>
								<td>${f.bno}</td>
								<td>
									${f.category}
								</td>
								<td>
									<a href="free/readPage?bno=${f.bno}">
										${f.title}
									</a>
								<td>
									${f.writer} 
								</td>
								<td>
									<f:formatDate value="${f.regdate}" pattern="yy-MM-dd" />
							</tr>
							</c:forEach>
						</c:if>
					</table>				
				</div>
				<div id="border4"><h3>직원복지</h3></div>
				<div id="border5"><h3>일정</h3></div>
			</div>
		</div>

	
	
	
	<script>
	/*
	// border1 에 공지사항 목록 요청
	$(document).ready(function() {
	    $.ajax({
	        type: "GET",
	        url: "${path}/Board/recentNotices",
	        success: function(notices) {
	        	// List<BoardVO> == notices
	        	console.log(notices);
	        	$(notices).each(function(){
		            $("#border1").append("<p onclick='alert(\"멍청한!!!!!!!!"+this.bno+"\");'>" + this.bno +"|"+this.title + "</p>");
	        	});
	         },
	        error : function(res){
				console.log(res);
	        }
	    });
	});
	*/
</script>
<%@ include file="/WEB-INF/views/footer.jsp" %>