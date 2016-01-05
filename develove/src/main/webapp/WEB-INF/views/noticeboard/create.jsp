<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<br><br><br><br>
<!-- Content Wrapper. Contains page content -->
<style>
.fileDrop {
	width : 80%;
	height : 200px;
}

small {
	margin-left : 3px;
	font-weight : bold;
	color : gray;
	
}
</style>

<div class="content-wrapper">
   <!-- Content Header (Page header) -->
	<section class="content-header"  style="width:70%;margin-left:15%;">
      <ol class="breadcrumb">
         <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
         <li class="active">글쓰기</li>
      </ol>
   </section>

   <!-- Main content -->
	<section class="content"  style="margin-left:20%">
		<div class="box-body">
			 <form id="createform">
				<div class="form-group" style="width:70%;">
					<label for="exampleInputEamil1">Title</label>
						<input type="text" name='title' class="form-control">		
				</div>
				<div class="form-group" style="width:70%;">
					<label for="exampleInputPassword1">Content</label>
						<textarea rows="7" cols="" name='content' class="form-control"></textarea>
				</div>
				<div class="form-group" style="width:70%;">
					<label for="exampleInputEamil1">Writer</label>
						<input type="text" name='nickname' class="form-control">		
				</div>
				<div class="form-group" style="width:70%;">
					<label for="exampleInputEamil1">Mno</label>
						<input type="text" name='mno' class="form-control">		
				</div>


			</form>
			      
			<div style="width:70%;" class="pull-right">
				<form  id="createform" >
					<input type="hidden" name="bno" value="${board.bno}">
				    <button id="cre" type="button" >저장</button>
				    <button id="cancel" type="button" >취소</button>
			   </form>
			</div>		
	   </div>
   
   </section>
   
<div class='fileDrop'></div>

<div class='uploadedList'></div>     
   <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@include file="../include/footer.jsp"%>
<script>
    var target = $("#createform")[0];
    $("#cre").click(function(){
        target.action="/noticeboard/create";
        target.method="post";
        target.submit();
    });
    $("#cancel").click(function(){
        target.action="/noticeboard/list";
        target.submit();
    });
    
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();		
	});
	
	$(".fileDrop").on("drop", function(event){
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		
		var file = files[0];
		
		console.og(file);
		
	});
</script>
</body>
</html>