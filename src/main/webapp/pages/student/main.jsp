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

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@200;300;400;600;900&display=swap" rel="stylesheet">

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

    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo/favicon.ico">
</head>

<body>

<!-- Page Preloder -->

<jsp:include page="/template.jsp"></jsp:include>
<!-- Breadcrumb Section End -->

<!-- Profile Section Begin -->
<div class="container-fluid ">
    <div class="row px-5 ">
        <div class="col-lg-4 p-4 border rounded btn">
            <a href="attend">Đăng ký môn học</a>
        </div>
        <div class="col-lg-4 p-4 border rounded btn">
            <a href="">xem các môn hoc mở trong kỳ</a>
        </div>
        <div class="col-lg-4 p-4 border rounded btn">
            <a href="">Xem danh sách môn học và giáo trình chính cho mỗi môn học mà mình đăng ký ở một học kỳ.</a>
        </div>
        <div class="clearfix"></div>
        <div class="col-lg-4 p-4 border rounded btn">
            <a href="">Xem danh sách lớp học của mỗi môn học mà mình đăng ký ở một học kỳ.</a>
        </div>
        <div class="col-lg-4 p-4 border rounded btn">
            <a href="">Xem danh sách lớp học của mỗi môn học mà mình đăng ký có nhiều hơn 1 giảng viên phụ trách ở một học kỳ.</a>
        </div>
        <div class="col-lg-4 p-4 border rounded btn">
            <a href="">Xem tổng số tín chỉ đã đăng ký được ở một học kỳ.</a>
        </div>
        <div class="clearfix"></div>
        <div class="col-lg-4 p-4 border rounded btn">
            <a href="">Xem tổng số môn học đã đăng ký được ở một học kỳ.</a>
        </div>
        <div class="col-lg-4 p-4 border rounded btn">
            <a href="">Xem 3 học kỳ có số tổng số tín chỉ cao nhất mà mình đã từng đăng ký.</a>
        </div>




    </div>


    </div>
</div>
<!-- Profile Section End -->

<!-- Profile Function Section Begin -->
<c:import url="/footer.jsp" />

<!-- Js Plugins -->
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
<script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script src="${pageContext.request.contextPath}/js/foodcourtmanager/main.js"></script>
</body>
</html>