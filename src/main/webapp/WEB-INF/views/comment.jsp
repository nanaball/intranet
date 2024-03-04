<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<!-- 전체 댓글 목록 -->
	<div>
		<ul id="comments"></ul>
	</div>
	
	
	
	<script>
	
		var bno = ${read.bno}
		
		function getCommentList(){
			let url = "${path}/comment/"+bno+"/list";
			
			$.getJSON(url, function(data){
				console.log(data);
				printList(data);
			});
		}	
	
		 function printList(list){
			let str ="";
			for(var i = 0; i<list.length;i++){
				str += `<li>
							\${list[i].noti_cno} - \${list[i].author} - <button data-cno='\${list[i].cno}' data-content='\${list[i].content}' data-author='\${list[i].author}'>수정</button>
							<br/><hr/>
							\${list[i].content}
						</li>`;
				}
			console.log(str);
			$("#comments").html(str); 
		}
	</script>
</body>
</html>