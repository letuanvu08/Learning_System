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


    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo/favicon.ico">
</head>

<body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/customer/main.js"></script>
<!-- Page Preloder -->

<c:import url="/template_header.jsp">
    <c:param name="navbar_opt" value="1"/>
    <c:param name="user" value="student"/>
    <c:param name="title" value="DANH SÁCH LỚP HỌC"/>
</c:import>
<!-- Breadcrumb Section Begin -->
<!-- Breadcrumb Section End -->
<%--<div class="row">--%>
<%--    <div class="col-md-5"></div>--%>
<%--    <div class="col-md-4 ">--%>
<%--        <h3 class="header__logo">DANH SÁCH CÁC LỚP HỌC CỦA NHỮNG MÔN ĐÃ ĐĂNG KÝ</h3>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- Profile Section Begin -->
<div class="container-fluid ">
    <section class="section bg-light">

        <div class="card mb-4">
            <!--<div class="card-header">
              <i class="fas fa-table mr-1"></i>
              DataTable Example
            </div>-->
            <div class="card-body">
                <div class="table-responsive">
                    <table
                            class="table table-bordered"
                            id="dataTable"
                            width="100%"
                            cellspacing="0"
                    >
                        <thead>
                        <tr>
                            <th>Mã môn học </th>
                            <th>Tên Môn học</th>
                            <th>Mã lớp học</th>
                            <th>Giảng viên</th>

                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${listsubclass}" var="sublass">

                            <tr>
                                <td><c:out value="${sublass.getClassId()}"/></td>
                                <td><c:out value="${sublass.getSubJectName()}"/></td>
                                <td><c:out value="${sublass.getSubClassId()}"/></td>
                                <td><c:out value="${sublass.getLecture()}"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>


</div>


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
<script src="${pageContext.request.contextPath}/js/aaoemployee/main.js"></script>
</body>
</html>