<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- 댓글 수정 화면 -->
	<div id="modcom">
		<!-- 수정할 댓글 번호 출력 -->
		<div id="numcom">
			<div>
			<!-- 댓글 작성자 -->
			댓글 작성자 - 
			<c:if test="${!empty loginMember }">
				<input type="text" name="writer" value="${loginMember.getUname()}" readonly />
			</c:if>	
			</div>
			<div>
				<!-- 댓글 내용 수정 -->
				댓글 내용 - <input type="text" id="comText"/>
			</div>
		</div>
		<div>
			<button id="modBtn">수정</button>
			<button id="deleteBtn">삭제</button>
		</div>
		<!-- 댓글 작성 -->
		<div>
			<div>
				작성자 : <input type="text" id="Auth" value="${loginMember.getUname()}" readonly/>
			</div>
			<div>
				댓글 내용 : <input type="text" id="commtext"/>
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
		
		getCommentList();
		
		// 댓글 전체 리스트
		function getCommentList(){
			let url = "${path}/comment/"+bno+"/list";
			
			$.getJSON(url, function(data){
				console.log(data);
				printList(data);
			});
		}	
	
		 function printList(list){
			console.log(list);
			let str ="";
			for(var i = 0; i<list.length;i++){
				str += `<li>
							\${list[i].noti_cno} - \${list[i].author} - <button data-cno='\${list[i].noti_cno}' data-content='\${list[i].noti_content}' data-author='\${list[i].author}'>수정</button>
							<br/><hr/>
							\${list[i].noti_content}
						</li>`;
				}
			console.log(str);
			$("#comments").html(str); 
		};
		
		// 댓글 삽입
		$("#addBtn").click(function(){
			let auth = $("#Auth").val();
			let text = $("#commtext").val();
			
			$.ajax({
				type : "POST",
				url : "${path}/comment/joncomment",
				data : {
					bno : bno,
					noti_content : text,
					author : auth
				},
				dataType : "text",
				success : function(result){
					alert(result);
					$("#Auth").val("");
					$("#Text").val("");
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
	</script>
