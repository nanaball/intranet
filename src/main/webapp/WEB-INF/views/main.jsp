<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 
	body{
		background-color:#F3F3F3;
	}
	 
	 
	 /* 회원 프로필 */
	.member{
		border : "1";
		margin:10px;
		padding-left:25px;
		height : "163px";
	}
	
	/* 게시판 모음 */
	#wrap{
    	border:1px solid red;
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
        width:66.5%
      
    }
    #borders div{
        width:48%;
        height:300px;
        margin:10px;
        padding:10px;
        background-color:white;
        border:1px solid black;
        border-radius:30px;
        box-sizing:border-box;
        background-size:cover;
        box-shadow:7px 7px 5px #BDBDBD;
    } 
  
    
    #borders{
        display:flex;
        flex-wrap:wrap;
        justify-content:space-between;
        height:620px;
    }
    
    #border1{
    	border:1px solid black;
    	height : 150px;
    	width : 500px:
    }
    
     #border2{
    	border:1px solid black;
    	height : 150px;
    	width : 300px:
    }
    
     #border3{
    	border:1px solid black;
    	height : 150px;
    	width : 300px:
    }
    
     #border4{
    	border:1px solid black;
    	height : 150px;
    	width : 300px:
    }
</style>
</head>
<body>
	<div class="wrapper" style="display: flex;">
		<div class="member">
			<img src="resources/img/profile.jpg" height="100px"><br>
			<img src="resources/img/mail.jpg" height="30px"><br>
			<h5> \${udep}/\${uname}</h5>
		</div>
		<div id="wrap">
			<div id="borders">
				<div id="border1">공지사항</div>
				<div id="border2">결재</div>
				<div id="border3">자유게시판</div>
				<div id="border4">직원복지</div>
				<div id="border5">기타</div>
			</div>
		</div>
	</div>
	
	<script>
	$(document).ready(function() {
	    // 서버에 최근 공지사항 목록을 요청합니다.
	    $.ajax({
	        type: "GET",
	        url: "/member/recentNotices",
	        success: function(notices) {
	            // 받은 공지사항 목록을 처리합니다.
	            notices.forEach(function(notice) {
	                // 공지사항 목록을 border1에 동적으로 추가합니다.
	                $("#border1").append("<p>" + notice.title + "</p>");
	            });
	        },
	        error: function(xhr, status, error) {
	            console.error("Failed to fetch recent notices: " + error);
	        }
	    });
	});
	</script>
</body>
</html>