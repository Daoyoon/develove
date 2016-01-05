<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../views/include/header.jsp"%>
<container>
    <!-- Section: intro -->
    <section id="intro" class="intro" style="background:url('resources/images/img-bg.jpg') no-repeat center center; background-size: cover;">
        <div class="slogan">
            <h1>세상의 모든 감정을 찾는다.<br>EmoPicture FINDER</h1>
                <span>
                    <div class="searchtext" ><p><input type="text" name="keyword">
                    <a href="#" id="goSearch"class="btn btn-skin page-scroll" >검색</a></p>
                    </div>
                </span>
        </div>
    </section>
</container>


<%@include file="../views/include/footer.jsp"%>

<script>
	$("#goSearch").on('click',function(){
		$(".slogan").hide();
	});
</script>
</body>
</html>