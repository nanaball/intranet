<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
	 
	body{
		background-color:#F3F3F3;
	}
	 
	 
	 /* 회원 프로필 */
	.selfinfo{
		border : 1px;
		margin:10px;
		padding-left:25px;
		height : 200px;
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
    
    
</style>
</head>
<body>
	<div class="wrapper" style="display: flex;">
		<div class="selfinfo">
			<img src="resources/img/profile.jpg" height="100px"><br>
			<img src="resources/img/mail.jpg" height="30px"><br>
				<c:if test="${loginMember != null}">					
  		  			<h5>${loginMember.getUdep()} / ${loginMember.getUname()}</h5>
				</c:if>
		</div>
		<div id="wrap">
			<div id="borders">
				<div id="border1"><h3>공지사항</h3></div>
				<div id="border2"><h3>결재</h3></div>
				<div id="border3"><h3>자유게시판</h3></div>
				<div id="border4"><h3>직원복지</h3></div>
				<div id="border5"><h3>일정</h3></div>
			</div>
		</div>
	</div>	
	<script>
	
	// border1 에 공지사항 목록 요청
	$(document).ready(function() {
	    $.ajax({
	        type: "GET",
	        url: "/border/recentNotices",
	        success: function(notices) {	          
	            notices.forEach(function(notice) {
	                $("#latestPosts").append("<p>" + notice.title + "</p>");
	            });
	        },
	        error: function(xhr, status, error) {
	            console.error("Recent notice Fail : " + error);
	        }
	    });
	});
	
	// border 컨트롤러
	@RestController
	@RequestMapping("/border")
	public class NoticeController {

    private final NoticeService noticeService;

    public NoticeController(NoticeService noticeService) {
        this.noticeService = noticeService;
    }

    @GetMapping("/recentNotices")
    public List<Notice> getRecentNotices() {
        // borderserviceImple에서 최근 목록 가져오기
        return noticeService.getRecentNotices();
   	 	}
	}
	
	</script>
</body>
</html>