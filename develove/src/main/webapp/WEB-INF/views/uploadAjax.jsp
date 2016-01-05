<%@include file="../views/include/header.jsp"%>
<style>
	.fileDrop {
		width:100%;
		height:200px;
		border: 1px dotted blue;
	}
	small {
		margin-left: 3px;
		font-weight: bold;
		color: gray;
	}
</style>
</head>
<body>
<br><br><br><br>
	<h3>Ajax File Upload</h3>
	<div class='fileDrop'></div>
	
	<div class='uploadedList'></div>
	
	<%@include file="../views/include/footer.jsp"%>
		
	<script>
		$(".fileDrop").on('dragenter dragover', function(event){
			event.preventDefault();
		});
		
		$(".fileDrop").on("drop", function(event){
			event.preventDefault();
			var files = event.originalEvent.dataTransfer.files;
			var file = files[0];
			console.log(file);
			var formData = new FormData();
			formData.append("file", file);
			$.ajax({
				url: '/uploadAjax',
				data: formData,
				dataType: 'text',
				processData: false,
				contentType: false,
				type: 'post',
				success: function(data){
					var str = "";
					
					if(checkImageType(data)){
					str="<div class='thumbNailModal'><a  href='displayFile?fileName="+getImageLink(data)+"'><img src='displayFile?fileName="+data+"'/></a>"
							+"<small data-src="+data+">X</small></div>";
					}else{
						str = "<div><a href='displayFile?fileName="+data+"'>"+getOriginalName(data)+"</a>"
								+"<small data-src="+data+">X</small></div>";
					}
					$(".uploadedList").append(str);
				}
			})
		});
		
		function checkImageType(fileName){
			var pattern = /jpg|gif|png|jpeg/i;
			return fileName.match(pattern);
		}
		
		function getOriginalName(fileName){
			if(checkImageType(fileName)){
				return;
			}
			var idx = fileName.indexOf("_") + 1;
			return fileName.substr(idx);
		}
		
		function getImageLink(fileName){
			if(!checkImageType(fileName)){
				return;
			}
			var front = fileName.substr(0,12);
			var end = fileName.substr(14);
			
			return front+end;
		}
		
		$(".uploadedList").on("click", "small", function(event){
			var that = $(this);
		
			$.ajax({
				url: "/deleteFile",
				type: "post",
				data: {fileName:$(this).attr("data-src")},
				dataType:"text",
				success:function(result){
					if(result == 'deleted'){
						that.parent("div").remove();
					}
				}
			});
		});
		
	</script>
</body>
</html>