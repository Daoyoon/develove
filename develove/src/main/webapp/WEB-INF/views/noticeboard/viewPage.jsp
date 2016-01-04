<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<br><br><br><br>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
	<section class="content-header" style="width:80%;margin-left:150px;">

        <ol class="breadcrumb">
           <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
           <li class="active">공지사항</li>
           <li class="active">글 번호:${board.bno}</li>
        </ol>
	</section>

    <style>
        #replyLi li{
            margin-top: 10px;
            border-bottom: 1px solid #cccccc;
            width : 900px;

        }
        dt{
            margin-bottom: 5px;
            margin-left: 840px;
            margin-top: -50px;
        }


        dl{
            margin-top: 10px;
            margin-left: 20px;
        }

        ul{
            list-style: none;
        }

        #modDiv{
            width : 500px;
            height : 140px;
            background-color: #BDBDBD;
            position : absolute;
            top : 70%;
            left : 50%;
            margin-top: -50px;
            margin-left: -150px;
            padding : 10px;
            z-index:500;
        }
    </style>
    <!-- Main content -->
    <section class="content" style="margin-left:10%">
        <div class="row">
            <div class="col-sm-4 col-lg-4 col-md-4" style="width: 1000px">
                <div style="border:solid 1px #CCCCCC; background-color: white;">
                    <h4 style="margin-left:20px" >${board.title}</h4>
                    <h5 style="margin-left:20px">작성자:&nbsp;${board.nickname}</h5>
                    <h5 align="right">조회수:${board.viewcnt}&nbsp;|&nbsp;&nbsp;${board.regdate}&nbsp;</h5>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4 col-lg-4 col-md-4" style="width: 1000px">
                <div style="border:solid 1px #CCCCCC; background-color: white;">

                    
                    <h5 style="margin-left:20px"><br>${board.content}</h5>
                </div>
            </div>
        </div>

        <div style="width:1000px; background-color:#fff;">
            <form id="viewform" style="margin-left:805px" >
                <input type="hidden" name="bno" value="${board.bno}">
                <input id="list" type="button" value="목록가기">
                <input id="mod" type="button" value="수정">
                <input id="del" type="button" value="삭제">
            </form>
				<input  id="replyToggle" type="button" value="댓글보기 [${board.replycnt}]" style="margin-left:10px">
        </div>
    </section>

  <!-- 댓글부분 -->
   <section class="content" style="margin-left:10%; height:100%;">
      <div class="row" id="replyTable">
         <div class="col-sm-4 col-lg-4 col-md-4" style="width: 1000px">
            <div >
               <ul id="replyLi">
                  <li id="replies" ></li>
               </ul>
            </div>   
         </div>
      </div>
      <br>
      <div class="row">
         <div class="col-sm-4 col-lg-4 col-md-4" style="width: 1000px">
            <div style="border:solid 1px #CCCCCC; background-color: white;">
               <br>
                  <div style="margin-left:20px;margin-right: 20px;"><input  type="text" name="replyer" id="newReplyWriter" style="width:200px" placeholder="작성자"></div>
                  <div style="margin-left:20px;margin-right: 20px;margin-top: 20px;">
                     <textarea rows="0" cols="0" onpaste="return" type="text" name="replyer" id="newReplyText" style="width: 100%;height:85px;" placeholder="댓글을 작성하세요"></textarea>
                  </div>   
                <div style="margin-left:20px;margin-right: 20px;"><hr style="border:solid 1px #CCCCCC; width:100%;"></div>
                <div style="margin-left:20px;margin-right: 20px;margin-bottom: 20px;">
                   <span><button id="replyAddBtn"> 댓글쓰기</button></span>
                </div>
            </div>   
         </div>
      </div>
   </section>
</div>
<!-- /.content -->

<!-- cridata -->
<form id="cri">
    <input type="hidden" name="pageNo" value="${cri.pageNo}" >
    <input type="hidden" name="searchType" value="${cri.searchType}">
    <input type="hidden" name="keyword" value="${cri.keyword}">
    <input type="hidden" name="totalCount"  value="${cri.totalCount}">
    <input type="hidden" name="perPage"  value="${cri.perPage}">
    <input type="hidden" name="perPageNum"  value="${cri.perPageNum}">
    <input type="hidden" name="bno" >
</form>

  <ul class='pagination'></ul>

<div id="modDiv" class="modal " style="display: none;">
   <div class="modal-title"></div>
   <div>
      <textarea rows="0" cols="0" type="text" id="replytext" onpaste="return" style="width: 100%;height:50px;"></textarea>
   </div>
   <div>
      <button type="button" id="replyModBtn">수정</button>
      <button type="button" id="replyDelBtn">삭제</button>
      <button type="button" id="closeBtn" >닫기</button>
   </div>
</div>





<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<script>
    
			var bno = ${board.bno};
			getAllList();
			
			
			$("#replyTable").hide();
			$("#replyToggle").on('click', function(){
				$("#replyTable").toggle();
			});
			
			function addReply(){
			   $("#replyAddBtn").on("click", function(){
			      var replyer = $("#newReplyWriter").val();
			      var replytext = $("#newReplyText").val(); 
			      $.ajax({
			         type : 'post',
			         url : '/noticereplies/',
			         headers : {
			            'content-Type' : 'application/json',
			            'X-HTTP-Method-Override' : 'POST'
			         },
			         dataType : 'text',
			         data : JSON.stringify({
			            bno : bno,
			            replyer : replyer,
			            replytext : replytext
			         }),
			         success : function(result){
			            if(result == 'Success'){
			               alert("등록되었습니다.")
			               event.preventDefault();
			               getAllList();
			            }
			         }
			      });
			   });
			}
			addReply();

			  
			function getAllList(){   
			   var str = "";
			   $.getJSON("/noticereplies/" + bno, function(data){
				   console.log(data.length);
			      $(data).each(
			            function(){
			               str += "<li data-rno='"+this.rno+"' data-text='"+this.replytext+"' class='replyLi'>"
			                  +"<img src='img/reply.png'>&nbsp;&nbsp;"+this.replyer+"<dl><span><img src='img/arrow-right.png'>&nbsp;&nbsp;"+this.replytext
			                  +"</span></dl><dt><span><button>수정</button></sapn></dt></li>";
			            });
			      $("#replies").html(str);
			   });
			}

			   $("#replies").on("click", ".replyLi dt span button", function(){
			      var reply = $(this).parent().parent().parent();
			      var rno = reply.attr("data-rno");
			      var replytext = reply.attr("data-text");
			      
			      $("#modDiv").show("slow");		      
			      $(".modal-title").html(rno);
			      $("#replytext").val(replytext);
			   });
			   
				$("#modDiv").on('click', 'div #closeBtn', function(){
					$("#modDiv").hide("slow");
				});
			   
			   
			  $("#replyModBtn").on("click",function(){
			  var rno = $(".modal-title").html(); 
			  console.log(rno);
			  var replytext = $("#replytext").val();
			
			  $.ajax({
			     type : "put",
			     url : "/noticereplies/"+rno,
			     headers : {
			        'content-Type' : 'application/json',
			        'X-HTTP-Method-Override' : 'PUT'
			     },
			     data : JSON.stringify({replytext : replytext}),
			     dataType : "text",
			     success : function(result){
			        console.log("result: "+result);
			        if(result == 'Success'){
			           alert("수정 되었습니다.");
			           $("#modDiv").hide("slow");
			           getAllList();
			        }
			     }
			  });
			});
			
			
	
			$("#replyDelBtn").on("click", function(){
			  var rno =$(".modal-title").html();
			  var replytext =$("#replytext").val();
			  console.log(rno);
			  $.ajax({
				     type : "DELETE",
				     url : "/qnareplies/"+rno,
				     headers : {
				        'content-Type' : 'application/json',
				        'X-HTTP-Method-Override' : 'DELETE'
				     },
				     data : JSON.stringify({replytext : replytext}),
				     dataType : "text",
				     success : function(result){
				        console.log("result: "+result);
				        if(result == 'Success'){
				           alert("삭제되었습니다.");
				           $("#modDiv").hide("slow");
				           getAllList();
			            }
			         }
			      });
			   });
			   		
			   
			    var target = $("#viewform")[0];
			    $("#list").click(function(){
			        var criform = $("#cri");
			    	criform.attr("action","/noticeboard/list").submit();
			    });
			    $("#mod").click(function(){
			        target.action="/noticeboard/modify";
			        target.submit();
			    });
			    $("#del").click(function(){
			        target.action="/noticeboard/delete";
			        target.method="post";
			        target.submit();
			    });
			

</script>
<%@include file="../include/footer.jsp"%>
</body>
</html>