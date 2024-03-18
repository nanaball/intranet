<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>

 <h2></h2>
 <form id="modifyForm" method="POST">
 	 <input type="hidden" name="uno" value="${loginMember.uno}"/>
	 <table>
	 	<tr>
	 		<td>제목</td>
	 		<td>
	 			<input type="text" name="title" value="${messageVO.title}"/>
	 		</td>
	 	</tr>
	 	
	 	<tr>
	 		<td>작성자</td>
	 		<td>
	 			<input type="text" name="writer" value="${loginMember.uname}" readonly/>
	 		</td>
	 	</tr>
	 	<tr>
	 		<td>받는사람 ID</td>
	 		<td>
	 			<input type="text" name="targetid" value="${messageVO.targetid}"/>
	 		</td>
	 	</tr>
	 	<tr>
	 		<td>내용</td>
	 		<td>
	 			<textarea id="content" name="content" cols="50" rows="20" required>${messageVO.content}</textarea>
	 		</td>
	 	</tr>
	 	<tr>
	 		<th colspan="2">
	 			<a href="read?mno=${messageVO.mno}">
	 			<input type="button" id="sendBtn" value="수정완료"/>
	 		</th>
	 	</tr>
	 </table>
	
	 
	  <!-- 첨부파일 목록 추가 -->
	 <div>
	 	
	 	<div class="fileDrop"></div>
	
	 	<c:if test="${!empty messageVO.files}">
		 	<ul class="uploadList">
		 		<c:forEach var="file" items="${messageVO.files}">
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
		 						<!-- 일반파일 -->
		 						<img src="${path}/resources/img/file.png" />
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
	<!--  <hr style="clear:both;"/> -->
 </form>
 <script src="https://cdn.tiny.cloud/1/ap1f056585x6jymzi07is63leo72fk9o06qhw1eekg5x4s75/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
<script>
tinymce.init({
	  selector: '#content',
	  plugins: 'image code',
	  toolbar: 'undo redo | link image | code',
	  /* enable title field in the Image dialog*/
	  image_title: true,
	  /* enable automatic uploads of images represented by blob or data URIs*/
	  automatic_uploads: true,
	  /*
	    URL of our upload handler (for more details check: https://www.tiny.cloud/docs/configure/file-image-upload/#images_upload_url)
	    images_upload_url: 'postAcceptor.php',
	    here we add custom filepicker only to Image dialog
	  */
	  file_picker_types: 'image',
	  /* and here's our custom image picker*/
	  file_picker_callback: (cb, value, meta) => {
	    const input = document.createElement('input');
	    input.setAttribute('type', 'file');
	    input.setAttribute('accept', 'image/*');

	    input.addEventListener('change', (e) => {
	      const file = e.target.files[0];

	      const reader = new FileReader();
	      reader.addEventListener('load', () => {
	        /*
	          Note: Now we need to register the blob in TinyMCEs image blob
	          registry. In the next release this part hopefully won't be
	          necessary, as we are looking to handle it internally.
	        */
	        const id = 'blobid' + (new Date()).getTime();
	        const blobCache =  tinymce.activeEditor.editorUpload.blobCache;
	        const base64 = reader.result.split(',')[1];
	        const blobInfo = blobCache.create(id, file, base64);
	        blobCache.add(blobInfo);

	        /* call the callback and populate the Title field with the file name */
	        cb(blobInfo.blobUri(), { title: file.name });
	      });
	      reader.readAsDataURL(file);
	    });

	    input.click();
	  },
	  content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'
	});
</script>
<script>
	
$("#sendBtn").click(function(){
	let str = "";
	let fileList = $(".uploadList .delBtn");
	console.log(fileList);
	for(let i=0; i< fileList.length; i++){
		str += "<input type='hidden' name='files' value='"+fileList[i].getAttribute("href")+"'/>";
	}
	
	/* if(arr.length >0){
		$.post(contextPath+"/deleteAllfiles",{file : arr},function(result){
			alert(result);
		})
	} */
	
	$("#modifyForm").append(str);
	$("#modifyForm").submit();
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
	
	// console.log(files);
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
				console.log(html);
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
		imgSrc = contextPath+"/displayFile?fileName="+fullName;
		getLink = contextPath+"/displayFile?fileName="+fullName.replace("s_","");
	}else{
		imgSrc = contextPath + "/resources/img/file.png";
		getLink = contextPath + "/displayFile?fileName="+fullName;
	}
	fileName = fullName.substr(fullName.lastIndexOf("_")+1);
	return {fileName : fileName, imgSrc : imgSrc, getLink : getLink};
}

</script>

<%@ include file = "footer.jsp" %>
