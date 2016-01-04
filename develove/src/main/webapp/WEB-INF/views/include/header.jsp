<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>짤파인더 ZzalFinder season1</title>

    <link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/resources/font-awesome/css/font-awesome.min.css" />
	<link href="/resources/css/nivo-lightbox.css" rel="stylesheet" />
	<link href="/resources/css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css" />
	<link href="/resources/css/animate.css" rel="stylesheet" />
    <link href="/resources/css/style.css" rel="stylesheet">
	<link href="/resources/css/default.css" rel="stylesheet">
</head>
<body data-spy="scroll">

    <div class="container">
        <ul id="gn-menu" class="gn-menu-main">
            <li class="gn-trigger">
                <a class="gn-icon gn-icon-menu"><span>Menu</span></a>
                <nav class="gn-menu-wrapper">
                    <div class="gn-scroller">
                        <ul class="gn-menu">
                            <li><a href="/noticeboard/list" class="gn-icon gn-icon-help">공지사항</a></li>
                            <li><a href="/board/list" class="gn-icon gn-icon-pictures">짤방게시판</a></li>
                            <li><a href="/board/list" class="gn-icon gn-icon-none">짤방게시판</a></li>
                            <li><a href="/board/list" class="gn-icon gn-icon-none">짤방게시판</a></li>
                            <li><a href="/board/list" class="gn-icon gn-icon-none">짤방게시판</a></li>
                            <li><a href="/board/freeboard" class="gn-icon gn-icon-article">자유게시판</a></li>
                            <li><a href="/qna" class="gn-icon gn-icon-archive">문의하기</a></li>
                        </ul>
                    </div>
                    <!-- /gn-scroller -->
                </nav>
            </li>
            <li><a href="/">ZZAL FINDER</a></li>
            <ul class="topMenu">
                <li><a href="/register">Register</a></li>
                <li><a href="#" data-toggle="modal" id ="loginModalBtn" data-target="#login-modal">Login</a></li>
            </ul>
        </ul>
    </div>
    <!--LOGIN MODAL-->
    <div id="loginModal" class="modal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" id="closeBtn" data-dismiss="modal" aria-hidden="true">×</button>
                    <h1 class="text-center">Login</h1>
                </div>
                <div class="modal-body">
                    <form class="form col-md-12 center-block">
                        <div class="form-group">
                            <input type="text" class="form-control input-lg" placeholder="Email">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control input-lg" placeholder="Password">
                        </div>
                        <div class="form-group">
                            <button id="loginBtn" class="btn btn-primary btn-lg btn-block">Log In</a></button>
                            <br>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <div class="col-md-12">
                        <button class="btn" id="registerBtn" data-dismiss="modal" aria-hidden="true"><a href="/register">Register</a></button>
                        <button class="btn" id="cancelBtn" data-dismiss="modal" aria-hidden="true"><a href="">Cancel</a></button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--LOGIN MODAL END-->