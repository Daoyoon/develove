<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>

	

    <!-- Core JavaScript Files -->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/jquery.easing.min.js"></script>
    <script src="/resources/js/classie.js"></script>
    <script src="/resources/js/gnmenu.js"></script>
    <script src="/resources/js/jquery.scrollTo.js"></script>
    <script src="/resources/js/nivo-lightbox.min.js"></script>
    <script src="/resources/js/stellar.js"></script>
    <script src="/resources/js/pageMaker.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="/resources/js/custom.js"></script>
 
    <script>
    
    	$("#loginModalBtn").on('click',function(){
            $("#loginModal").show();
        });
        $("#closeBtn").on('click', function(){
            $("#loginModal").hide();
        });
        $("#loginBtn").on('click',function(){
            $("#loginModal").hide();
        });
        $("#cancelBtn").on('click',function(){
            $("#loginModal").hide();
        });

    
    </script>