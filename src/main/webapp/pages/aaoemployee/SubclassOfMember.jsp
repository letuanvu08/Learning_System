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
    <c:param name="user" value="aaoemployee"/>
    <c:param name="title" value="DANH SÁCH LỚP CỦA SINH VIÊN/GIẢNG VIÊN"/>
</c:import>
<!-- Profile Section Begin -->

<!-- Profile Section End -->

<!-- Profile Function Section Begin -->
<section class="profile">
    <div class="container">


    </div>
</section>
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

                        <li class="active" data-filter=".general">Thông tin lớp học của mỗi sinh viên</li>
                        <li class="" data-filter=".lecturer">Thông tin lớp học của mỗi Giảng Viên</li>

                    </ul>
                </div>
            </div>
        </div>
        <div class="row justify-content-center profile__options__filter">
            <!-- General info -->

            <!-- End General info -->

            <!-- View users -->

            <div class="profile__featured__general  col-lg-12 mix general">
                <div class="row justify-content-center align-items-center">
                    <div class="col-lg-9 profile__name">
                        <form action="subclassOfmemberController" id="signup_form" method="post">
                            <!-- form field-->
                            <div class="form-group">
                                <label class="control-label" for="memberid">Mã số sinh viên</label>
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
                                <button type="submit" class="site-btn" id="btn-form" name="btn-form" value="student">
                                    Search
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${listclasss==null}">
                    </c:when>
                    <c:otherwise>
                <div class="col-lg-12">
                    <p id="account_prompt" style="display:none">Danh sách lớp học của sinh viên</p>
                    <form action="updateclassController" method="post">
                        <div class="shoping__cart__table">

                            <table id="user_list">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>Năm học</th>
                                    <th>Học kỳ</th>
                                    <th>Mã môn học</th>
                                    <th>Mã lớp học</th>
                                    <th>Tên môn học</th>
                                    <th>Giảng viên</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listclasss}" var="entry" varStatus="loop">
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="userlist"
                                                   value="${entry.getClassId()}${" "}${entry.getYear()}${" "}${entry.getSemester()}${" "}${entry.getSubClassId()}">
                                        </td>

                                        <td>
                                            <c:out value="${entry.getYear()}"/>
                                        </td>

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

                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>
                    </c:otherwise>
                </c:choose>


            </div>
            <div class="profile__featured__general ${lecturer_featured} col-lg-12 mix lecturer">

                <div class="row justify-content-center align-items-center">
                    <div class="col-lg-9 profile__name">

                        <form action="subclassOfmemberController" method="post">
                            <!-- form field-->
                            <div class="form-group">
                                <label class="control-label" for="memberid">Mã Giảng viên</label>
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
                                <button type="submit" class="site-btn" id="btn-form" name="btn-form" value="lecturer">
                                    Search
                                </button>
                            </div>
                        </form>

                    </div>
                </div>
                <c:choose>
                    <c:when test="${listclassl==null}">
                    </c:when>
                    <c:otherwise>
                <div class="col-lg-12">
                    <p id="account_prompt" style="display:none">Danh sách lớp học của Giảng viên</p>
                    <form action="updateclassController" method="post">
                        <div class="shoping__cart__table">

                            <table id="user_list">
                                <thead>
                                <tr>

                                    <th>Mã môn học</th>
                                    <th>Mã lớp học</th>
                                    <th>Tên môn học</th>

                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listclassl}" var="entry" varStatus="loop">
                                    <tr>
                                        <td>
                                            <c:out value="${entry.getClassId()}"/>
                                        </td>
                                        <td>
                                            <c:out value="${entry.getSubClassId()}"/>
                                        </td>
                                        <td>
                                            <c:out value="${entry.getSubJectName()}"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>
                    </c:otherwise>
                </c:choose>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/customer/main.js"></script>
</body>
</html>
