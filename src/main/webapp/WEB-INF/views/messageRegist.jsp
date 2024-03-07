<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>

 <h2></h2>
 <form id="registerForm" method="POST">
 	 <input type="hidden" name="uno" value="${LoginMember.uno}"/>
	 <table>
	 	<tr>
	 		<td>제목</td>
	 		<td>
	 			<input type="text" name="title" required/>
	 		</td>
	 	</tr>
	 	<tr>
	 		<td>작성자</td>
	 		<td>
	 			<input type="text" name="writer" value="${loginMember.uname}" readonly/>
	 		</td>
	 	</tr>
	 	<tr>
	 		<td>내용</td>
	 		<td>
	 			<textarea id="content" name="content" cols="50" rows="20" required></textarea>
	 		</td>
	 	</tr>
	 	<tr>
	 		<th colspan="2">
	 			<input type="button" id="saveBtn" value="보내기"/>
	 		</th>
	 	</tr>
	 </table>
	 </form>
 <!-- Place the first <script> tag in your HTML's <head> -->
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
	
 	$("#saveBtn").click(function(){
 		let str = "";
 		let fileList = $(".uploadList .delBtn");
 		console.log(fileList);
 		for(let i = 0; i < fileList.length; i++){
 			str += "<input type='hidden' name='files' value='"+fileList[i].getAttribute("href")+"' />";
 		}
 		$("#registerForm").append(str);
 		$("#registerForm").submit();
 	});

</script>

<%@ include file = "footer.jsp" %>