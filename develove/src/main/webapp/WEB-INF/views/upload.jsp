<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="include/header.jsp"%>
<br><br><br><br>
<!-- Content Wrapper. Contains page content -->
<style>
iframe {
	width: 0px;
	height: 0px;
	border: 0px;
}


</style>
   
    <form id='form1' action="upload" method="post" enctype ="multipart/form-data" target="zeroFrame">
   		<input type='file' name='file'>
   		<input type='submit'>
    </form>
   
 	<iframe name="zeroFrame"></iframe>
 
 
 
 
<%@include file="include/footer.jsp"%>
<script>
	function addFilePath(msg){
		alert(msg);
		document.getElementById("form1").reset();
	}

</script>
</body>
</html>