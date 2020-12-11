<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="vi">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="description" content="Ogani Template">--%>
<%--    <meta name="keywords" content="Ogani, unica, creative, html">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <meta http-equiv="X-UA-Compatible" content="ie=edge">--%>
<%--    <title>Learning System</title>--%>

<%--    <!-- Google Font -->--%>
<%--    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@200;300;400;600;900&display=swap" rel="stylesheet">--%>

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/customer/main.js"></script>


<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Pre-set values -->
<c:set var="opt_active_0" value=""/>
<c:set var="opt_active_1" value=""/>
<c:set var="opt_active_2" value=""/>
<c:set var="opt_active_3" value=""/>
<c:set var="opt_active_4" value=""/>

<c:choose>
    <c:when test="${param.navbar_opt == 0}">
        <c:set var="opt_active_0" value="active"/>
    </c:when>
    <c:when test="${param.navbar_opt == 1}">
        <c:set var="opt_active_1" value="active"/>
    </c:when>
    <c:when test="${param.navbar_opt == 2}">
        <c:set var="opt_active_2" value="active"/>
    </c:when>
    <c:when test="${param.navbar_opt == 3}">
        <c:set var="opt_active_3" value="active"/>
    </c:when>
    <c:when test="${param.navbar_opt ==4}">
        <c:set var="opt_active_4" value="active"/>
    </c:when>
</c:choose>

<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Humberger Begin -->
<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
    <div class="humberger__menu__logo">
        <a href="${pageContext.request.contextPath}/faculty/main"><img src="${pageContext.request.contextPath}/img/logobk.png" alt=""></a>
    </div>

    <div class="humberger__menu__widget">
        <div class="header__top__right__auth">
            <a href="${pageContext.request.contextPath}/logout"><i class="fa fa-user"></i> Đăng xuất</a>
        </div>
    </div>
    <nav class="humberger__menu__nav mobile-menu">
        <ul>
            <li class="${opt_active_0}"><a href="${pageContext.request.contextPath}/faculty/main">Trang chủ</a></li>
            <li class="${opt_active_1}"><a href="profileservlet">Tài khoản</a></li>
        </ul>
    </nav>
    <div id="mobile-menu-wrap"></div>
    <div class="header__top__right__social">
        <a href="#"><i class="fa fa-facebook"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-pinterest-p"></i></a>
    </div>

</div>
<!-- Humberger End -->

<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa fa-envelope"></i> support@sfcs.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                            <a href="#"><i class="fa fa-pinterest-p"></i></a>
                        </div>
                        <div class="header__top__right__auth">
                            <a href="${pageContext.request.contextPath}/logout"><i class="fa fa-user"></i> Đăng xuất</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-1 border-top ">
                <div class="header__logo">
                    <a href="${pageContext.request.contextPath}/faculty/main"><img src="${pageContext.request.contextPath}/img/logobk.png" alt="" style="width:50px;height:50px;"></a>
                </div>
            </div>
            <div class="col-lg-10">
                <nav class="header__menu">
                    <p class="header">ĐẠI HỌC QUỐC GIA THÀNH PHỐ HCM</p>
                 <p class="header">TRƯỜNG ĐẠI HỌC BÁCH KHOA </p>
                </nav>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-4"></div>
            <div class="col-lg-6 ">
                <nav class="header__menu">
                    <ul>
                        <li class="${opt_active_0}"><a href="${pageContext.request.contextPath}/faculty/main">Trang chủ</a></li>
                        <li class="${opt_active_1}"><a href="profileservlet">Tài khoản</a></li>

                    </ul>
                </nav>
            </div>

        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>
<!-- Header Section End -->

<!-- Hero Section Begin -->


<!-- Hero Section End -->