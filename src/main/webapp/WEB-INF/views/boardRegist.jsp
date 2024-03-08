<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<style>
.fileDrop{
	width:100%;
	height:150px;
	border:1px solid red;
	background-color:lightgray;
	margin:auto;
}

.uploadList{
	border:1px solid skyblue;
	width:100%;
	height:250px;
}

.uploadList li{
	float:left;
	padding:20px;
	list-style:none;
}
</style>
	<form id="registerForm" method="POST"> 
	<table border="1">
		<tr>
				<th colspan = "2"><h1>공지글 작성</h1></th>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<c:if test="${!empty loginMember }">
						<input type="text" name="writer" value="${loginMember.getUname()}" readonly />
					</c:if>
				</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
					<select name="category">
						<option value="공지">공지</option>
						<option value="알림" >알림</option>
						<option value="이벤트">이벤트</option>
						<option value="당첨">당첨</option>
					</select>
					<label>카테고리를 선택해주세요</label>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" autofocus required style="width:100%;"/>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" required style="resize:none; width:700px; height:200px;"></textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" id="boardSuccess" value="작성완료" />
					<input type="reset" id="boardReset" value="이전으로" />
				</th>
			</tr>
	</table>
	<!-- Drag & Drop file upload -->
	<div>
		<label>파일을 넣어주세요</label>
		<div class="fileDrop"></div>
		<div>
			<ul class="uploadList">
			
			</ul>
		</div>
	</div>
	</form>
	
	<script>
		// 작성완료 버튼 클릭시
		$("#boardSuccess").click(function(){
			
			// 각 칸별 빈칸 알림
			if($("#category") == null){
				alert("카테고리를 선택해주세요.");
				$("#category").val("");
				$("#category").focus();
				return;
			}
			
			if($("#title").val().length <=0){
				alert("제목을 입력해주세요.");
				$("#title").val("");
				$("#title").focus();
				return;
			}
			
			if($("#content").val().length <=0){
				alert("카테고리를 선택해주세요.");
				$("#content").val("");
				$("#content").focus();
				return;
			}
			
			let str = "";
			let fileList = $(".uploadList .delBtn");
			console.log(fileList);
			for(let i=0; i<fileList.length; i++){
				str += "<input type='hidden' name='files' value='"+fileList[i].getAttribute("href")+"'/>";
			}
			$("#registerForm").append(str);
			$("#registerForm").submit();
		});
		
		// reset 버튼
		$("#boardReset").on("click",function(){
			if(confirm("정말 취소하시겠습니까?")){
				location.href = "${pageContext.request.contextPath}/Board/board/";
			}
		});
	</script>
	<script>
		// 브라우저에서 file load 방지
		$(".fileDrop").on("dragenter dragover", function(e){
			e.preventDefault();
		});
		
		$(".fileDrop").on("drop",function(e){
			e.preventDefault();
			
			let files = e.originalEvent.dataTransfer.files;
			
			console.log(files);
			let maxSize = 31457280;			// 30MB
			
			let formData = new FormData();
			for(let i =0; i<files.length; i++){
				if(files[i].size > maxSize){
					alert("업로드할수 없는 용량입니다.");
					return false;
				}
				formData.append("file",files[i]);
			}
			$.ajax({
				type : "POST",
				url : "${path}/uploadFile",
				data : formData,
				contentType : false,
				processData : false,
				dataType : "json",
				success : function(data){
					for(let i = 0; i<data.length; i++){
						console.log(data[i]);
						let fileInfo = getFileInfo(data[i]);
						console.log(fileInfo);
						let html = "<li>";
						html += "<img src='"+fileInfo.imgSrc+"'/>";
						html += "<div>";
						html += "<a href='"+fileInfo.getLink+"' target='_blank'>";
						html += fileInfo.fileName;
						html += "</a>"
						html += "</div>";
						html += "<div>";
						// fullName == data[i]
						html += "<a href='"+data[i]+"' class='delBtn'>[삭제]</a>";
						html += "</div>";
						html += "</li>";
						$(".uploadList").append(html);
					}
				},
				error : function(res){
					alert(res.responseText);
				}
			});
		});
		
		// 이미지 파일 확인
		function checkImage(fileName){
			return fileName.indexOf("s_") > 0 ? true : false;
		}
		
		var contextPath = '${path}'
		
		function getFileInfo(fullName){
			let imgSrc, fileName, getLink;
			
			if(checkImage(fullName)){
				imgSrc = contextPath + "/displayFile?fileName="+fullName;
				getLink = contextPath + "/displayFile?fileName="+fullName.replace("s_","");
			}else{
				imgSrc = contextPath + "/resources/img/file.png";
				getLink = contextPath + "/displayFile?fileName="+fullName;
			}
			fileName = fullName.substr(fullName.lastIndexOf("_")+1);
			return {fileName : fileName, imgSrc : imgSrc, getLint : getLink};
		}
		
		// 첨부파일 삭제
		$(".uploadList").on("click","delBtn",function(event){
			event.preventDefault();
			let target = $(this);
			let fullName = target.attr("href");
			$.ajax({
				type : "POST",
				url : contextPath+"/deleteFile",
				data : {fileName : fullName},
				success : function(data){
					alert(data);
					target.closest("li").remove();
				}
			});
		});
	</script>
	<div style="clear:both;"></div>
<%@ include file = "footer.jsp" %>