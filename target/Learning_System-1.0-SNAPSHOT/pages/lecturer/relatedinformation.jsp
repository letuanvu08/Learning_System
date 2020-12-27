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
    <c:param name="user" value="lecturer"/>
    <c:param name="title" value="THÔNG TIN LIÊN QUAN"/>
    <%--    <c:param name="description" value="Đăng ký môn học"/>--%>
</c:import>

<section class="profile__featured">
    <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-lg-10" STYLE="padding-top:  40px">
                <fieldset>
                    <legend class="text-success"><b>Số lớp phụ trách trong 3 học kỳ gần nhất:</b></legend>

                    <form action="attend" method="post">
                        <table class="table table-striped" id="user_list">
                            <thead>
                            <tr class="table-primary">
                                <th scope="col">Năm học</th>
                                <th scope="col">Học kỳ</th>
                                <th scope="col">số lớp</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listThreenearly}" var="semester">
                                <tr>

                                    <td>
                                        <c:out value="${semester.get(0)}"/>
                                    </td>
                                    <td>
                                        <c:out value="${semester.get(1)}"/>
                                    </td>
                                    <td>
                                        <c:out value="${semester.get(2)}"/>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>

                    </form>
                </fieldset>

            </div>
            <div class="clearfix"></div>
            <div class="col-lg-10" STYLE="padding-top: 40px">
                <fieldset>
                    <legend class="text-success"><b>Top 5 lớp có nhiều sinh viên đăng ký::</b></legend>
                    <form action="attend" method="post">
                        <table class="table table-striped" id="user_list">
                            <thead>
                            <tr class="table-primary">
                                <th scope="col">Năm học</th>
                                <th scope="col">Học Kỳ</th>
                                <th scope="col">Mã Môn học</th>
                                <th scope="col">Mã lớp học</th>
                                <th scope="col">Tên Môn học</th>
                                <th scope="col">Số sinh viên đăng ký</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listTopFiveClass}" var="subclass">
                                <tr>

                                    <td>
                                        <c:out value="${subclass.getYear()}"/>
                                    </td>
                                    <td>
                                        <c:out value="${subclass.getSemester()}"/>
                                    </td>
                                    <td>
                                        <c:out value="${subclass.getSubClassId()}"/>
                                    </td>
                                    <td>
                                        <c:out value="${subclass.getClassId()}"/>
                                    </td>
                                    <td>
                                        <c:out value="${subclass.getSubJectName()}"/>
                                    </td>
                                    <td>
                                        <c:out value="${subclass.getNumberStudent()}"/>
                                    </td>

                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>

                    </form>
                </fieldset>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-10" STYLE="padding-top:  40px">
                <fieldset>
                    <legend class="text-success"><b>Năm học kỳ có số lớp phụ trách nhiều nhất:</b></legend>

                    <form action="attend" method="post">
                        <table class="table table-striped" id="user_list">
                            <thead>
                            <tr class="table-primary">
                                <th scope="col">Năm học</th>
                                <th scope="col">Học kỳ</th>
                                <th scope="col">số lớp</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listFiveSemestermostlytClass}" var="semester">
                                <tr>

                                    <td>
                                        <c:out value="${semester.get(0)}"/>
                                    </td>
                                    <td>
                                        <c:out value="${semester.get(1)}"/>
                                    </td>
                                    <td>
                                        <c:out value="${semester.get(2)}"/>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>

                    </form>
                </fieldset>

            </div>
        </div>
    </div>
</section>


<!-- Profile Section End -->

<!-- Profile Function Section Begin -->


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