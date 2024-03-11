<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	color:black;
}
</style>
</head>
<body>
	<h3>게시글 수정</h3>
		<!-- model boardVO -->
		<!-- board/modify POST -->
		<form id="modifyForm" method="POST">
			<input type="hidden" name="bno" value="${noticeVO.bno}"/>
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
							<option value="${noticeVO.category}"></option>
							<option value="공지">공지</option>
							<option value="알림" >알림</option>
							<option value="이벤트">이벤트</option>
							<option value="당첨">당첨</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="title" autofocus required style="width:100%;" value="${noticeVO.title}"/>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea name="content" required style="resize:none; width:700px; height:200px;">${noticeVO.content}</textarea>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<a href="read?bno=${noticeVO.bno}">
							<input type="button" value="이전으로" />
						</a>
						<input type="submit" id="notiSuccess" value="수정완료" />
						<input type="reset" id="notiReset" value="초기화" />
					</th>
				</tr>
			</table>
			<!-- 첨부파일 목록 추가 -->
			<div>
			<label>파일을 넣어주세요</label>
			<div class="fileDrop"></div>
				<!-- 게시글 : board, 첨부파일 : board.files -->
				<c:if test="${!empty noticeVO.files}">
					<ul class="uploadList">
						<c:forEach var="file" items="${noticeVO.files}">
							<li data-src="${file}">
								<c:choose>
									<c:when test="${fn:contains(file,'s_')}">
										<img src="${path}/displayFile?fileName=${file}"/>
										<div>
											<a href="${path}/displayFile?fileName=${fn:replace(file,'s_','')}" target="_blank">
												${fn:substringAfter(fn:replace(file,'s_',''),'_')}
											</a>
										</div>
									</c:when>
									<c:otherwise>
										<!-- 일반 파일 -->
										<img src="${path}/resources/img/file.png"/>
										<div>
											<a href="${path}/displayFile?fileName=${file}">
												${fn:substringAfter(file,'_')}
											</a>
										</div>
									</c:otherwise>
								</c:choose>
								<div>
									<a href="${file}" class="delBtn">[삭제]</a>
								</div>
							</li>
						</c:forEach>
					</ul>
				</c:if>
			</div>
		</form>
		<script>
			// drag & drop 시 브라우저가 파일을 해석하려는 기본이벤트를 제거
			$(".fileDrop").on("dragenter dragover", function(e){
				e.preventDefault();
			});
			
			$(".fileDrop").on("drop",function(e){
				e.preventDefault();
				
				let files = e.originalEvent.dataTransfer.files;
				let maxSize = 31457280;
				
				let formData = new FormData();
				for(let i = 0; i<files.length; i++){
					if(files[i].size > maxSize){
						alert("업로드할수 없는 용량입니다.");
						return false;
					}
					formData.append("file",files[i]);
				}
				// javaScript로 설정하고 처리하는 이벤트
				$.ajax({
					type : "POST",
					url : "${path}/uploadFile",
					data : formData,
					contentType : false,
					processData : false,
					dataType : "json",
					success : function(data){
						for(let i=0; i<data.length; i++){
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
			
			// 이미지파일 유무 확인
			function checkImage(fileName){
				return fileName.indexOf("s_") > 0 ? true : false;
			}
			
			var contextPath = '${path}'
				
			function getFileInfo(fullName){
				let imgSrc, 	fileName,	getLink;
				if(checkImage(fullName)){
					imgSrc = contextPath+"/displayFile?fileName="+fullName;
					getLink = contextPath+"/displayFile?fileName="+fullName.replace("s_","");
				}else{
					imgSrc = contextPath+"/resources/img/file.png";
					getLink = contextPath+"/displayFile?fileName="+fullName;
				}
				fileName = fullName.substr(fullName.lastIndexOf("_")+1);
				return {fileName : fileName, imgSrc : imgSrc, getLink : getLink};
			}
			
			var arr = [];
			
			// 첨부파일 삭제
			$(".uploadList").on("click",".delBtn",function(event){
				event.preventDefault();	
				let target = $(this);
				let fullName = target.attr("href");
				arr.push(fullName);
				target.closest("li").remove();
			});
			
			// 게시글 등록 버튼이 click 되면
			$("#notiSuccess").click(function(){
				let str = "";
				let fileList = $(".uploadList .delBtn");
				console.log(fileList);
				for(let i=0; i< fileList.length; i++){
					str += "<input type='hidden' name='files' value='"+fileList[i].getAttribute("href")+"'/>";
				}
				
				if(arr.length >0){
					$.post(contextPath+"/deleteAllfiles",{file : arr},function(result){
						alert(result);
					})
				}
				
				$("#modifyForm").append(str);
				$("#modifyForm").submit();
			});
		</script>
</body>
</html>