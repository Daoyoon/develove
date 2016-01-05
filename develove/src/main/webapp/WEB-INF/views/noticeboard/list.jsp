<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@include file="../include/header.jsp"%>
<br><br><br><br>

<style>
.table th{
	text-align:center;
}
.table td{
	text-align:center;
}
</style>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header" style="width:70%;margin-left:15%;">
 
        <ol class="breadcrumb" style="margin-bottom:0px; background-color:#F2DEDE;">
           <li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
           <li class="active">공지사항</li>
        </ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div style="width:70%;margin-left:15%;">
			<table class="table tabel-bordered" >
				<tr>
					<th style="width:5%">글번호</th>
					<th style="width:30%">제 목</th>
					<th style="width:15%">작성자</th>
					<th style="width:15%">등록일</th>
					<th style="width:5%">조회수</th>
				</tr>
			
				<c:forEach var="noticeboardVO" items="${list}">
				
					<tr>
						<td>${noticeboardVO.bno}</td>
						<td><a href="${noticeboardVO.bno}">${noticeboardVO.title} [${noticeboardVO.replycnt}]</a></td>
						<td>${noticeboardVO.nickname}</td>
						<td>${noticeboardVO.regdate}</td>
						<td>${noticeboardVO.viewcnt}</td>
					</tr>
				</c:forEach>

			</table>
		</div>

	</section>
	<!-- /.content -->

	<hr align="left" style="border: solid 1px #CCCCCC; width:70%;margin-left:15%;margin-top:-20px;">
	<div align="right" style="width:70%;margin-left:15%;margin-top:-15px;">
		<button>
				<a href="/noticeboard/create">글쓰기</a>
		</button>
	</div>	
	
	<div class="row text-center">
		<div class="col-lg-12" style="width:70%;margin-left:15%;margin-top:-10px;">
			<ul class="pagination" id="pageUL"></ul>
		</div>
		<div class="col-lg-12" style="width:70%;margin-left:15%;margin-top:-10px;margin-bottom:20px;">
			<form id="searchform">
				<select name="searchType" id="searchType" style="height:30px">
					<option value="n">----</option>
					<option value="t">제목</option>
					<option value="c">내용</option>
					<option value="w">작성자</option>
					<option value="tc">제목+내용</option>
					<option value="cw">내용+작성자</option>
					<option value="tcw">전체</option>
				</select> <input id="keyword" type="text" name="keyword" style="width:20%;height:30px;">
				<button id="search" size="50px" style="height:30px">검색</button>
			</form>
		</div>
	</div>
</div>
<!-- /.content-wrapper -->
	<!-- cridata -->
	<form id="cri">
		<input type="hidden" name="pageNo" value="${cri.pageNo}"> 
		<input type="hidden" name="searchType" value="${cri.searchType}"> 
		<input type="hidden" name="keyword" value="${cri.keyword}"> 
		<input type="hidden" name="totalCount" value="${cri.totalCount}"> 
		<input type="hidden" name="perPage" value="${cri.perPage}"> 
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}"> 
		<input type="hidden" name="bno">
	</form>
	<!-- /cridata -->
	
	
	
<%@include file="../include/footer.jsp"%>

<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->

<script>
	$(document).ready(
			function() {

				var cri = ${cri.toString()};
				console.log(cri);

				$("#keyword").val(cri.keyword);
				$("#pageUL").html(makePage(cri));
				console.log($("#pageUL"))

				var criform = $("#cri");

				$("#pageUL").on("click", "li a", function(event) {
					event.preventDefault();
					console.log(this);
					var targetPage = $(this).attr("href");
					criform[0][0].value = targetPage;
					criform.attr("action", "").submit();
				});

				$(".table tr td a").on("click", function(event) {
					event.preventDefault();
					console.log(this);
					var targetPage = $(this).attr("href");
					criform[0][6].value = targetPage;
					criform.attr("action", "/noticeboard/view").submit();
				});

				$("#searchType option[value=" + cri.searchType + "]").attr(
						"selected", "true")
			});
</script>
</body>
</html>