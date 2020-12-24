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

<!-- Page Preloder -->
<c:import url="/template_header.jsp">
    <c:param name="navbar_opt" value="1"/>
    <c:param name="user" value="aaoemployee"/>
    <c:param name="title" value="THÔNG TIN LỚP HỌC"/>
</c:import>
<!-- Breadcrumb Section End -->

<!-- Profile Section Begin -->

<!-- Profile Section End -->

<!-- Profile Function Section Begin -->
<section class="profile">
    <div class="container">
        <div class="profile__title">
            <h4>Tài khoản</h4>
        </div>

    </div>
</section>
<section class="profile__featured">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="featured__controls">
                    <ul>

                        <li class="active" data-filter=".general">Danh sách Sinh viên</li>
                        <li data-filter=".lecturer">Danh sách Giảng viên</li>

                    </ul>
                </div>
            </div>
        </div>
        <div class="row justify-content-center profile__options__filter">
            <!-- General info -->

            <!-- End General info -->

            <!-- View users -->
            <div class="profile__featured__general col-lg-12 mix general">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-8  text-center">
                            <div class="card mb-2 justify-content-center">
                                <form action="updateclassController" method="post">
                                    <div class="shoping__cart__table">
                                        <table id="user_list">
                                            <thead>
                                            <tr>

                                                <th>Mã số sinh viên</th>
                                                <th>Học và tên</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${subclassDetail.getListstudent()}" var="entry"
                                                       varStatus="loop">
                                                <tr>

                                                    <td>
                                                        <c:out value="${entry.getStudentID()}"/>
                                                    </td>

                                                    <td>
                                                        <c:out value="${entry.getName()}"/>
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="profile__featured__general col-lg-12 mix lecturer">
                    <div class="row">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-8  text-center">
                            <div class="card mb-2 justify-content-center">

                                <form action="updateclassController" method="post">
                                    <div class="shoping__cart__table">
                                        <table>
                                            <thead>
                                            <tr>
                                                <th>Mã số Nhân viên</th>
                                                <th>Học và tên</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${subclassDetail.getListlecturer()}" var="entry"
                                                       varStatus="loop">
                                                <tr>
                                                    <td>
                                                        <c:out value="${entry.getLecturerID()}"/>
                                                    </td>

                                                    <td>
                                                        <c:out value="${entry.getName()}"/>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
<!-- End View users -->

<!-- View vendors -->

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
<script src="${pageContext.request.contextPath}/js/aaoemployee/main.js"></script>
</body>
</html>
