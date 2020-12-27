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


    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo/favicon.ico">
</head>

<body>

<!-- Page Preloder -->

<!-- Breadcrumb Section End -->
<c:import url="/template_header.jsp">
    <c:param name="navbar_opt" value="1"/>
    <c:param name="user" value="faculty"/>
    <c:param name="title" value="DANH SÁCH LỚP HỌC"/>
</c:import>
<!-- Profile Section Begin -->

<!-- Profile Section End -->

<!-- Profile Function Section Begin -->

<div class="row" id="notifice">
    <div class="col-lg-6"></div>
    <div class="col-lg-6">
        <c:choose>
            <c:when test="${status==null}">
            </c:when>
            <c:when test="${status.contains(\"thành công\")}">
                <h5 class="alert alert-info" role="alert"><c:out value="${status}"/></h5>
            </c:when>
            <c:otherwise>
                <h5 class="alert alert-warning" role="alert"><c:out value="${status}"/></h5>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<script>
    setTimeout(() => {
        var elem = document.getElementById("notifice");
        elem.remove();
    }, 6000);
</script>
<section class="profile__featured">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="featured__controls">
                    <ul>
                        <li class="${listall}" data-filter=".general">Danh sách tất cả lớp học</li>
                        <li class="${listlecturer}" data-filter=".lecturer">Danh sách lớp học của giảng viên</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row justify-content-center profile__options__filter">

            <div class="profile__featured__general ${lecturer_featured} col-lg-12 mix lecturer">
                <div class="row justify-content-center align-items-center">
                    <div class="col-lg-5">
                        <form action="classFacultyControler" id="signup_form" method="post">
                            <!-- form field-->
                            <div class="form-group">
                                <label class="control-label" for="memberid">ID Giảng viên</label>
                                <input class="form-control" type="text" name="memberid" id="memberid" required>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="year">Năm học</label>
                                <input class="form-control" type="text" name="year" id="year" required>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="semester">học kỳ</label>
                                <input class="form-control" type="text" name="semester" id="semester" required>
                            </div>

                            <div class="form-group text-center">
                                <button type="submit" class="site-btn" id="btn-form" name="btn-form" value="find">
                                    Search
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <c:choose>
                <c:when test="${listclasslecturer==null}">
                </c:when>
                <c:otherwise>
                <div class="row justify-content-center profile__options__filter">
                    <div class="col-lg-11">
                        <form action="classFacultyControler" method="post">

                            <table id="user_list" class="table table-striped">
                                <thead>
                                <tr class="table-primary">
                                    <th>Học kỳ</th>
                                    <th>Mã Môn học</th>
                                    <th>Tên Môn học</th>
                                    <th>Mã lớp học</th>
                                    <th>Giảng Viên</th>
                                    <th>Giảng Viên phụ</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listclasslecturer}" var="entry" varStatus="loop">
                                    <tr>

                                        <td>
                                            <c:out value="${entry.getSemester()}"/>
                                        </td>
                                        <td>
                                            <c:out value="${entry.getClassId()}"/>
                                        </td>
                                        <td>
                                            <c:out value="${entry.getSubClassId()}"/>
                                        </td>
                                        <td>
                                            <c:out value="${entry.getSubJectName()}"/>
                                        </td>
                                        <td>
                                            <c:out value="${entry.getLecture()}"/>
                                        </td>
                                        <td>
                                            <c:forEach items="${entry.getListlectuer()}" var="lecturer">
                                                <p><c:out value="${lecturer.getName()}"/></p>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <button type="submit" name="btn-form"
                                                    class="site-btn"
                                                    value="detail${" "}${entry.getYear()}${" "}${entry.getSemester()}${" "}${entry.getClassId()}${" "}${entry.getSubClassId()}">
                                                DS sinh viên
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
            </c:otherwise>
            </c:choose>
        </div>
        <div class="profile__featured__general  col-lg-12 mix general">
            <div class="row justify-content-center profile__options__filter">
                <div class="col-lg-12">
                <form action="classFacultyControler" method="post">

                    <table id="user_list" class="table table-striped">
                        <thead>
                        <tr class="table-primary">
                            <th>Học kỳ</th>
                            <th>Mã Môn học</th>
                            <th>Tên Môn học</th>
                            <th>Mã lớp học</th>
                            <th>Giảng Viên</th>
                            <th>Giảng Viên phụ</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listSubclass}" var="entry" varStatus="loop">
                            <tr>

                                <td>
                                    <c:out value="${entry.getSemester()}"/>
                                </td>
                                <td>
                                    <c:out value="${entry.getClassId()}"/>
                                </td>
                                <td>
                                    <c:out value="${entry.getSubClassId()}"/>
                                </td>
                                <td>
                                    <c:out value="${entry.getSubJectName()}"/>
                                </td>
                                <td>
                                    <c:out value="${entry.getLecture()}"/>
                                </td>
                                <td>
                                    <c:forEach items="${entry.getListlectuer()}" var="lecturer">
                                        <p><c:out value="${lecturer.getName()}"/></p>
                                    </c:forEach>
                                </td>
                                <td>
                                    <button type="submit" name="btn-form"
                                            class="site-btn"
                                            value="detail${" "}${entry.getYear()}${" "}${entry.getSemester()}${" "}${entry.getClassId()}${" "}${entry.getSubClassId()}">
                                        DS sinh viên
                                    </button>
                                </td>

                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </form>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>

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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/customer/main.js"></script>
</body>
</html>
