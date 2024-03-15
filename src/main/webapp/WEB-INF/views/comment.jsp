<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
	#comments li {
		list-style:none;
		padding:10px;
		border: 1px solid #ccc;
		height:150px;
		margin : 5px 0;
	}
	
	#modDiv{
		border:1px solid black;
		padding:10px;
		display:none;
	}
	
	#pagination{
		margin : 0 auto;
		display:flex;
		justify-content: center;
	}
	
	
	#pagination li{
		list-style:none;
		padding:3px;
		border:1px solid skyblue;
		margin:3px;
	}
	
	#pagination li a{
		text-decoration: none;
		color:black;
	}
	
	#pagination li a.active{
		color:red;
	}
	
</style>
	<!-- 댓글 수정 화면 -->
	<div id="modCom">
		<!-- 수정할 댓글 번호 출력 -->
		<div id="numCom"></div>
		<div>
		<!-- 댓글 작성자 -->
			댓글 작성자 - <input type="text" name="writer" class="commentAuth" value="${loginMember.getUname()}" readonly/>
		</div>
		<div>
			<!-- 댓글 내용 수정 -->
			댓글 내용 - <input type="text" id="comText" class="commentContent"/>
		</div>
		<div>
			<button id="modBtn">수정</button>
			<button id="deleteBtn">삭제</button>
			<button id="closeBtn">닫기</button>
		</div>
	</div>
		<!-- 댓글 작성 -->
		<div class="wrapper">
		<div id="commentWrite">
			<div>
				작성자 : <input type="text" id="auth" class="commentAuth" value="${loginMember.getUname()}" readonly/>
			</div>
			<div>
				댓글 내용 : <input type="text" class="commentContent" id="commtext"/>
			</div>
			<button id="addBtn">등록</button>
		</div>
		</div>
	
	<!-- 전체 댓글 목록 -->
	<div>
		<ul id="comments"></ul>
	</div>
	
	
	
	<script>
		var bno = ${read.bno};
		var perPageNum = 5;
		var page = 1;
		
		listPage(page);
		
		function listPage(page){
			$("#modCom").css("display","none");
			$("body").prepend($("#modCom"));
			let url = "${path}/comment/"+bno+"/"+page+"/"+perPageNum;
			$.getJSON(url,function(data){
				console.log(data);
				printPage(data);
			});
		}
		
		function printPage(data){
			let list = data.list;
			let pm = data.pm;
			console.log(list);
			console.log(pm);
			
			let str = "";
			for(let i = 0; i < list.length; i++){
				let comment = list[i];
				let cno = list[i].noti_cno;
				let content = list[i].noti_content;
				let auth = list[i].author;
				console.log(comment, noti_cno, noti_content, auth);
				str += `<li>\${noti_cno}-\${auth} - <span onclick='modifyPage(this,"\${noti_cno}","\${noti_content}","\${auth}");'>수정</span><br/><hr/>\${noti_content}</li>`;
			}
			if(page == 1){
				$("#comments").html(str);
			}else{
				$("#comments").append(str);	
			}
		}
		
		getCommentList();
		
		// 댓글 전체 리스트
		function getCommentList(){
			$("#modCom").css("display","none");
			$("body").prepend($("#modCom"));
			let url = "${path}/comment/"+bno+"/list";
			
			$.getJSON(url, function(data){
				console.log(data);
				printList(data);
			});
		}	
	// 서버에서 전달 받은 댓글 목록을 페이지에 출력
		 function printList(list){
			console.log(list);
			let str ="";
			for(var i = 0; i<list.length; i++){
				str += `<li>
							\${list[i].noti_cno} - \${list[i].author} - <button data-cno='\${list[i].noti_cno}' data-content='\${list[i].noti_content}' data-author='\${list[i].author}'>수정</button>
							<br/><hr/>
							\${list[i].noti_content}
						</li>`;
				}
			console.log(str);
			$("#comments").html(str); 
		};
		
		// 댓글 등록 처리
		$("#addBtn").click(function(){
			let auth = $("#auth").val();
			let text = $("#commtext").val();
			
			$.ajax({
				type : "POST",
				url : "${path}/comment/joinComment",
				data : {
					bno : bno,
					noti_content : text,
					author : auth,
				},
				dataType : "text",
				success : function(result){
					alert(result);
					$("#auth").val("");
					$("#commtext").val("");
					getCommentList();
				},
				error : function(res){
					console.log(res);
					if(res.status === 400){
						alert("잘못된 요청입니다.");
						alert(res.responseText);
					}else if(res.status === 404){
						alert("요청 경로를 확인하세요.");
					}
				}
				
			});
		});
		
		// 댓글 수정 - 삭제 창 호출
		$("#comments").on("click","li button",function(){
			console.log(this);
			let cno = $(this).attr("data-cno");
			let auth = $(this).attr("data-author");
			let content = $(this).attr("data-content");
			
			$("#numCom").text(cno);
			$("#comText").val(content);
			$("#auth").val(auth);
			console.log(cno);
			console.log(content);
			console.log(auth);
			
			$(this).parent().after($("#modCom"));
			
			$("#modCom").toggle("slow");
		})
		
		// 댓글 수정창 호츨 - 수정 버튼 이벤트
		function modifyPage(span, cno, content, auth){
			console.log(cno, content, auth);
			
			$("#numCom").text(cno);
			$("#comText").val(content);
			$("#auth").val(auth);
			
			$(span).parent().after($("#modCom"));
			
			$("#modCom").toggle("slow");
		}
		
		// 댓글 수정 요청 처리
		$("#modBtn").click(function(){
			let cno = $("#numCom").text();
			let content = $("#comText").val();
			let auth = $("#auth").val();
			console.log(cno,content,auth);
/* 화면에 바로 노출되지않음 */		
			$.ajax({
				type : "PATCH",
				url : "${path}/comment/"+cno,
				headers : {
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					// noti_cno : cno,
					// bno : bno,
					author : auth,
					noti_content : content
				}),
				dataType : "text",
				success : function(data){
					alert(data);
					$("#modCom").slideUp("fast");
					//page = 1;
					listPage(page);
				},
				error : function(res){
					alert(res.responseText);
				}
			});
		});
		
		// 댓글 삭제 요청 처리
		$("#deleteBtn").click(function(){
			let cno = $("#numCom").text();
/* 경로문제 */			
			$.ajax({
				type : "DELETE",
				url : "${path}/comment/"+cno,
				dataType : "text",
				success : function(data){
					alert(data);
					page = 1;
					//listPage(page);
				},
				error : function(res){
					console.log(res);
				}
			});
		});
		
		// 수정창 닫기  Close modDiv
		$("#closeBtn").click(function(){
			$("#modCom").slideUp("slow");			
		});
		
		// 마우스 스크롤로 이벤트 처리
		/*  $(window).scroll(function(){
			let dh = $(document).height();
			let wh = $(window).height();
			let wt = $(window).scrollTop();
			
			if((wh+wt)>=(dh)){
				console.log("조건에 만족");
				page++;
				listPage(page);
			}
		}) */
		
	</script>
