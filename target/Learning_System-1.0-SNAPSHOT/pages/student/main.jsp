<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Learning System</title>
    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/NewBiz/img/favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/NewBiz/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">

    <!-- Bootstrap CSS File -->
    <link href="${pageContext.request.contextPath}/NewBiz/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Libraries CSS Files -->
    <link href="${pageContext.request.contextPath}/NewBiz/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/NewBiz/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/NewBiz/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/NewBiz/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/NewBiz/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Main Stylesheet File -->
    <link href="${pageContext.request.contextPath}/NewBiz/css/style.css" rel="stylesheet">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo/favicon.ico">
</head>

<body>

<!-- Page Preloder -->

<c:import url="/template_header.jsp">
    <c:param name="navbar_opt" value="1"/>
    <c:param name="user" value="student"/>
    <c:param name="home" value="1"/>
</c:import>

<!-- Breadcrumb Section Begin -->
<!-- Breadcrumb Section End -->


<main id="main">

    <!--==========================
      About Us Section
    ============================-->


    <!--==========================
      Services Section
    ============================-->
    <section id="services" class="section-bg">
        <div class="container">

<%--            <header class="section-header">--%>
<%--                <h3>Services</h3>--%>
<%--                <p>Laudem latine persequeris id sed, ex fabulas delectus quo. No vel partiendo abhorreant vituperatoribus.</p>--%>
<%--            </header>--%>

            <div class="row">

                <div class="col-md-6 col-lg-5 offset-lg-1 wow bounceInUp" data-wow-duration="1.4s">
                    <div class="box">
                        <div class="icon"><i class="ion-ios-analytics-outline" style="color: #ff689b;"></i></div>
                        <h4 class="title"><a href="attend">Đăng ký môn học</a></h4>
                        <p class="description">Đăng ký những môn học được mở trong học kì hiện tại mà bạn dược đăng ký</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-5 wow bounceInUp" data-wow-duration="1.4s">
                    <div class="box">
                        <div class="icon"><i class="ion-ios-bookmarks-outline" style="color: #e9bf06;"></i></div>
                        <h4 class="title"><a href="subjectattend">Giáo trình chính của môn học.</a></h4>
                        <p class="description">Xem danh sách môn học và giáo trình dùng chinh cho nhưng môn học đã đăng ký ở học kì hiện tại </p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-5 offset-lg-1 wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
                    <div class="box">
                        <div class="icon"><i class="ion-ios-paper-outline" style="color: #3fcdc7;"></i></div>
                        <h4 class="title"><a href="ListSubclassAttended">Danh sách lớp học.</a></h4>
                        <p class="description">Xem danh sách tất cả các lớp học của nhưng môn mà đã đăng ký ở học kỳ hiện tại</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-5 wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
                    <div class="box">
                        <div class="icon"><i class="ion-ios-speedometer-outline" style="color:#41cf2e;"></i></div>
                        <h4 class="title"><a href="NoCreditStudent">Tổng số tín chỉ.</a></h4>
                        <p class="description">xem tổng số tín chỉ tích luỹ ở mỗi kì và tổng số tín chỉ đã tích lũy</p>
                    </div>
                </div>



            </div>

        </div>
    </section><!-- #services -->

    <!--==========================
      Why Us Section
    ============================-->


    <!--==========================
      Portfolio Section
    ============================-->


</main>
<!-- Profile Section Begin -->

<!-- Profile Section End -->

<!-- Profile Function Section Begin -->

<!-- Js Plugins -->





<script src="${pageContext.request.contextPath}/NewBiz/lib/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/NewBiz/lib/jquery/jquery-migrate.min.js"></script>
<script src="${pageContext.request.contextPath}/NewBiz/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/NewBiz/lib/easing/easing.min.js"></script>
<script src="${pageContext.request.contextPath}/NewBiz/lib/mobile-nav/mobile-nav.js"></script>
<script src="${pageContext.request.contextPath}/NewBiz/lib/wow/wow.min.js"></script>
<script src="${pageContext.request.contextPath}/NewBiz/lib/waypoints/waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/NewBiz/lib/counterup/counterup.min.js"></script>
<script src="${pageContext.request.contextPath}/NewBiz/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/NewBiz/lib/isotope/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/NewBiz/lib/lightbox/js/lightbox.min.js"></script>
<!-- Contact Form JavaScript File -->
<script src="${pageContext.request.contextPath}/NewBiz/contactform/contactform.js"></script>

<!-- Template Main Javascript File -->
<script src="${pageContext.request.contextPath}/NewBiz/js/main.js"></script>

</body>
</html>