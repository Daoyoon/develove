<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="include/header.jsp"%>
<br><br><br><br>
<!-- Content Wrapper. Contains page content -->

<style>
.fileDrop {
	width : 80%;
	height : 200px;
	border : 1px dotted blue;
}

small {
	margin-left : 3px;
	font-weight : bold;
	color : gray;
	
}
</style>


<h3> Ajax File Upload</h3>

<div class='fileDrop'></div>

<div class='uploadedList'></div>  
 
 
 
 
 
<%@include file="include/footer.jsp"%>
<script>

	function checkImageType(fileName){
		var pattern = /jpg|gif|png|jpeg/i;
		return fileName.match(pattern);
	}


	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();
	});
	
	$(".fileDrop").on("drop", function(event){
		event.preventDefault();
		
		$.ajax({
			
			url : '/uploadAjax',
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data){
				var str ="";
				if(checkImageType(data)){
					str = "<div>" +"<img src='displayFile?fileName=/"+data"'/>" + data+"</div>";
				}else{
					str ="<div> "+data+"</div>";
				}
				
				$(".uploadedList").append(str);
				
			}
			
		});
		
	});

</script>
</body>
</html>