<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<br><br><br><br>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
   <!-- Content Header (Page header) -->
	<section class="content-header"  style="margin-left:10%">

		<ol class="breadcrumb">
			<li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">묻고 답하기</li>
			<li class="active">글 번호 : ${board.bno}</li>
			<li class="active">글 수정</li>
		</ol>
	</section>

   <!-- Main content -->
   <section class="content" style="margin-left:20%">

      <form action="/noticeboard/modify" method="post">
      <input type="hidden" name="bno" value="${board.bno}">
		<div class="box-body">
			<div class="form-group" style="width:70%;">
				<label for="exampleInputEamil1">Title</label>
					<input type="text" name='title' class="form-control" value="${board.title}">		
			</div>
			<div class="form-group" style="width:70%;">
				<label for="exampleInputPassword1">Content</label>
					<textarea class="form-control" name='content' rows="7">${board.content}</textarea>		
			</div>
			<div class="form-group" style="width:70%;">
				<label for="exampleInputEamil1">Writer</label>
					<input type="text" name='nickname' class="form-control" value="${board.nickname}">		
			</div>

		</div>
 			<div style="width:70%;" class="pull-right">
				<form>
				    <button class="btn btn-primary" style="border-color: black;" >저장</button>
				    <button class="btn btn-warning" style="border-color: orange;" >취소</button>
				</form>
			</div>
      
   <script>
         $(document).ready(function(){
            
            var formObj= $("form[role='form']");
            
            $(".btn-warning").on("click",function(){
               //self.location="/noticeboard/view";
               
               formObj.attr("method","get");
               formObj.attr("action","/noticeboard/view");
               fromObj.submit();
               
            });
            
            $(".btn-primary").on("click",function(){
               formObj.submit();
            });
            
         });
      
   
   </script>
   </form>
   
   </section>
   <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@include file="../include/footer.jsp"%>

</body>
</html>