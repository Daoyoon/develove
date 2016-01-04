<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<br><br><br><br>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
	<div class="content-header" style="width:70%;margin-left:15%;">

        <ol class="breadcrumb" style="margin-bottom:0px; background-color:#F2DEDE;">
           <li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
           <li class="active"><a href="/noticeboard/list">공지사항</a></li>
           <li class="active">글 번호:${board.bno}</li>
        </ol>
	</div>

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
    <div class="content" style="width:70%;margin-left:15%;border:solid 1px #CCCCCC;">
    	
    	<div>
    		<div style="margin-top:10px;margin-left:5%;">
    			<h4 style="">${board.title}</h4>
    		</div>
    		<div style="margin-top:-40px;">
    			<h6 align="right" style="margin-right:5%">${board.regdate}</h6>
    		</div>
    		<hr align="center" style="border:dashed 1px #CCCCCC; width:90%;margin-top:-25px;"> 
    	</div>
    	<div style="margin-top:-15px">
    		<div style="margin-top:10px;margin-left:5%;">
    			<h5 style="">작성자:&nbsp;${board.nickname}</h5>
    		</div>
    		<div style="margin-top:-45px;">
    			<h6 align="right" style="margin-right:5%">댓글수:${board.replycnt}&nbsp;|&nbsp;조회수:${board.viewcnt}</h6>
    		</div>
    	</div>
        <div>
    		<div style="height:400px">
    			<h5 style="margin-left:5%;">${board.content}</h5>
    		</div>    		
    	</div>
    	
      		<hr align="center" style="border:solid 1px #CCCCCC; width:90%;margin-top:-25px;"> 
      		
		<!-- 댓글부분 -->
		<div style="margin-top:-10px;margin-left: 4%; width:80%;">
			<input  id="replyToggle" type="button" value="댓글보기 [${board.replycnt}]" style="margin-left:10px">
        </div>
  		<div>
  			<div class="row" id="replyTable">
         		<div class="col-sm-4 col-lg-4 col-md-4" style="width: 90%;margin-left:5%;">
            		<div >
              			 <ul id="replyLi" style="width: 90%;margin-right:5%;">
                  			<li id="replies" style="width: 90%;margin-right:5%;"></li>
               			 </ul>
            		</div>   
         		</div>
      		</div>
  		</div>
  		
		<div>	
			<div>
				<div >
					닉네임<input id="newReplyWriter" value="${board.nickname }">
				</div>
	    		<div style="margin-top:10px;margin-left:15%;">
            		<textarea rows="0" cols="0" onpaste="return" type="text" name="replyer" id="newReplyText" style="width: 71%;height:70px;" placeholder="댓글을 작성하세요"></textarea>
	    		</div>
	    		<div  align="right" style="margin-top:-75px;margin-right:15%;">
                	<button id="replyAddBtn"  style="width:10%;height:70px;">확인</button>
	    		</div>
	    	</div>
		<br>
        </div>  		
  
    </div>



</div>
<!-- /.content -->

<!-- 글쓰기/수정/삭제/목록 버튼 -->
<div align="right" style="width:70%;margin-left:15%;margin-top:10px; background-color:#fff;">
	<form id="viewform" >
    	<input type="hidden" name="bno" value="${board.bno}">
        <a href="/noticeboard/create"><input type="button" value="글쓰기"></a>
        <input id="mod" type="button" value="수정">
        <input id="del" type="button" value="삭제">
        <input id="list" type="button" value="목록">
	</form>
</div>

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
			                  +"<img src='img/reply.png'>&nbsp;&nbsp;"+"닉네임:"+this.replyer+"<dl><span><img src='img/arrow-right.png'>&nbsp;&nbsp;"+this.replytext
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
				     url : "/noticereplies/"+rno,
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