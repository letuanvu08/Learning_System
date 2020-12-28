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
    <title>Smart Food Court System</title>

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

<c:import url="/template_header.jsp">
    <c:param name="navbar_opt" value="1"/>
    <c:param name="user" value="${user.getUserType().toString()}"/>
    <c:param name="title" value="TÀI KHOẢN"/>

</c:import>

<!-- Breadcrumb Section Begin -->
<!-- Breadcrumb Section End -->

<!-- Profile Section Begin -->
<div class="row" id="notifice">
    <div class="col-lg-6"></div>
    <div class="col-lg-6">
        <c:choose>
            <c:when test="${error==null}">
            </c:when>
            <c:otherwise>
                <h5 class="alert alert-info" role="alert"><c:out value="${error}"/></h5>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script>
    setTimeout(() => {
        var elem = document.getElementById("notifice");
        elem.remove();
    }, 5000);
</script>
<section class="profile">
    <div class="container">
        <div class="profile__title">
            <h4>Tài khoản</h4>
        </div>

        <div class="row justify-content-center align-items-center">
            <div class="col-6 col-md-3 profile__name">
                <h2>${user.getUsername()}</h2>
                <p class="text-muted">@${user.getAccountName()}</p>
            </div>
            <div class="col-6 col-md-3 profile__img">
                <img src="${pageContext.request.contextPath}/img/user/1.jpg">
            </div>
        </div>
    </div>
</section>
<!-- Profile Section End -->

<!-- Profile Function Section Begin -->
<section class="profile__featured">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="featured__controls">
                    <ul>
                        <li class="active" data-filter=".general">Thông tin chung</li>
                        <%--     <li data-filter=".paid-orders">Thông tin Sinh Viên</li> --%>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row justify-content-center profile__options__filter">
            <!-- General info -->
            <div class="profile__featured__general col-lg-6 mix general">
                <ul class="list-unstyled">
                    <li>
                        <h4>Loại tài khoản</h4>
                        <span>${user.getUserType().toString()}</span>
                    </li>
                    <li>
                        <h4>Email</h4>
                        <span>
            					<c:choose>
                                    <c:when test="${empty user.getemail()}">
                                        Chưa có thông tin
                                    </c:when>
                                    <c:otherwise>
                                        ${user.getemail()}
                                    </c:otherwise>
                                </c:choose>
            				</span>
                    </li>

                    <li><a href="changepassword" class="site-btn">Đổi mật khẩu</a></li>
                </ul>
            </div>
        </div>
    </div>
</section>


<!-- Profile Function Section End -->

<c:import url="/footer.jsp"/>

<!-- Js Plugins -->
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
<script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>
