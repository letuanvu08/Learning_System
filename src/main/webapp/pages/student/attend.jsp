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

<c:import url="/template_header.jsp">
    <c:param name="navbar_opt" value="1"/>
    <c:param name="user" value="student"/>
    <c:param name="title" value="ĐĂNG KÝ MÔN HỌC"/>
    <%--    <c:param name="description" value="Đăng ký môn học"/>--%>
</c:import>

<!-- Breadcrumb Section Begin -->
<!-- Breadcrumb Section End -->
<%--<div class="row">--%>
<%--    <div class="col-md-5"></div>--%>
<%--    <div class="col-md-4 ">--%>
<%--        <h3 class="header__logo"></h3>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- Profile Section Begin -->
<div class="row" id="notifice">
    <div class="col-lg-6"></div>
    <div class="col-lg-6">
        <c:choose>
            <c:when test="${statusAttend==null}">
            </c:when>
            <c:when test="${statusAttend.equals(\"Môn học này đã được bàn đăng ký\")}">
                <h5 class="alert alert-warning" role="alert">Môn học này đã được bạn đăng ký</h5>
            </c:when>
            <c:when test="${statusAttend.contains(\"thành công\")}">
                <h5 class="alert alert-info" role="alert"><c:out value="${statusAttend}"/></h5>
            </c:when>

            <c:otherwise>
                <h5 class="alert alert-warning" role="alert"><c:out value="${statusAttend}"/></h5>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<section class="spad">
    <div class="account__manangement col-lg-12">

        <script>
            setTimeout(() => {
                var elem = document.getElementById("notifice");
                elem.remove();
            }, 5000);
        </script>

        <section class="profile__featured">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="featured__controls">
                            <ul>

                                <li class="active" data-filter=".general">Đăng ký môn học</li>
                                <li class="" data-filter=".lecturer">Các môn học đã đăng ký</li>

                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center profile__options__filter">
                    <div class="col-lg-12">

                        <div class="profile__featured__general  col-lg-12 mix general">
                            <form action="attend" method="post">
                                    <table class="table table-striped" id="user_list">
                                        <thead>
                                        <tr class="table-primary">

                                            <th scope="col">Mã Môn học</th>
                                            <th scope="col">Mã lớp học</th>
                                            <th scope="col">Tên Môn học</th>
                                            <th scope="col">Số tín chỉ</th>

                                            <th></th>
                                            <%--                            class="hidden_column"--%>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listSubclass}" var="subclass">
                                            <tr>

                                                <td>
                                                    <c:out value="${subclass.getClassId()}"/>
                                                </td>
                                                <td>
                                                    <c:out value="${subclass.getSubClassId()}"/>
                                                </td>
                                                <td>
                                                    <c:out value="${subclass.getSubJectName()}"/>
                                                </td>
                                                <td>
                                                    <c:out value="${subclass.getNoCreadits()}"/>
                                                </td>


                                                <td>
                                                    <button type="submit" name="btn_dk" class="site-btn"
                                                            value="${subclass.getSubClassId()}${" "}${subclass.getClassId()}${" "}${subclass.getYear()}">
                                                        Đăng ký
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>

                            </form>
                        </div>

                    </div>

                    <div class="profile__featured__general ${lecturer_featured} col-lg-12 mix lecturer">
                        <form action="attend" method="post">
                            <div class="card-body">
                                <table class="table table-striped" id="user_list">
                                    <thead>
                                    <tr class="table-primary">
                                        <th>Mã Môn học</th>
                                        <th>Mã lớp hoc</th>
                                        <th>Tên Môn học</th>
                                        <th>Số tín chỉ</th>

                                        <th></th>
                                        <%--                            class="hidden_column"--%>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listattended}" var="subclass">
                                        <tr>

                                            <td>
                                                <c:out value="${subclass.getClassId()}"/>
                                            </td>
                                            <td>
                                                <c:out value="${subclass.getSubClassId()}"/>
                                            </td>
                                            <td>
                                                <c:out value="${subclass.getSubJectName()}"/>
                                            </td>
                                            <td>
                                                <c:out value="${subclass.getNoCreadits()}"/>
                                            </td>


                                            <td>
                                                <button type="submit" name="btn_dk" class="site-btn btn-danger"
                                                        value="xoa ${subclass.getSubClassId()}${" "}${subclass.getClassId()}${" "}${subclass.getYear()}">
                                                    Xóa Môn
                                                </button>
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
        </section>
    </div>
</section>


<!-- Profile Section End -->

<!-- Profile Function Section Begin -->

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
<script src="${pageContext.request.contextPath}/js/aaoemployee/main1.js"></script>
</body>
</html>