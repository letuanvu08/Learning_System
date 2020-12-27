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
    <c:param name="title" value="DANH SÁCH MÔN HOC PHỤ TRÁCH"/>
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
<section class="spad">
    <div class="account__manangement col-lg-12">

        <script>
            setTimeout(() => {
                var elem = document.getElementById("notifice");
                elem.remove();
            }, 5000);
        </script>
    </div>
</section>
<c:choose>
    <c:when test="${listsubject!=null}">
        <section class="profile__featured">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="featured__controls">
                            <ul>

                                <li class="active" data-filter=".general">DANH SÁCH MÔN HOC PHỤ TRÁCH</li>


                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center profile__options__filter">
                    <div class="col-lg-12">

                        <div class="profile__featured__general  col-lg-12 mix general">
                            <form action="updateTextBook" method="post">
                                <table id="user_list" class="table table-striped">
                                    <thead>
                                    <tr class="table-primary">
                                        <th>Mã Môn học</th>
                                        <th>Tên Môn học</th>
                                        <th>Số tín chỉ</th>
                                        <th>TextBook</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listsubject}" var="subject">
                                        <tr>
                                            <td>
                                                <c:out value="${subject.getSubjectID()}"/>
                                            </td>
                                            <td>
                                                <c:out value="${subject.getSubjectName()}"/>
                                            </td>
                                            <td>
                                                <c:out value="${subject.getNoCreadits()}"/>
                                            </td>
                                            <td>
                                                <c:forEach items="${subject.getListTexbook()}" var="textbook">
                                                    <c:out value="${textbook.getTextBookName()}"/><p/>
                                                    <hr/>
                                                </c:forEach>
                                            </td>
                                            <td>
                                                <button type="submit" name="btn-form" class="site-btn"
                                                        value="update${" "}${subject.getSubjectID()}">
                                                    Cập Nhật
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
        </section>
    </c:when>
    <c:when test="${subjectlecturer!=null}">
        <section class="profile__featured">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="featured__controls">
                            <ul>

                                <li class="active" data-filter=".general">CẬP NHẬT TEXTBOOK</li>


                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center profile__options__filter">
                    <div class="col-lg-12">

                        <div class="profile__featured__general  col-lg-12 mix general">
                            <form action="updateTextBook" method="post">

                                <table id="user_list" class="table table-striped">
                                    <thead>
                                    <tr class="table-primary">

                                        <th>ISBM</th>
                                        <th>TextBook</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${subjectlecturer.getListTexbook().size()>0}">

                                            <c:forEach items="${subjectlecturer.getListTexbook()}" var="textbook">
                                                <tr>
                                                    <td>
                                                        <c:out value="${textbook.getISBN()}"/>
                                                    </td>
                                                    <td>
                                                        <c:out value="${textbook.getTextBookName()}"/>
                                                    </td>
                                                    <td>
                                                        <button type="submit" name="btn-form"
                                                                class="site-btn btn-danger"
                                                                value="remove${" "}${subjectlecturer.getSubjectID()}${" "}${textbook.getISBN()}">
                                                            Xóa
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                    </c:choose>
                                    </tbody>
                                </table>
                        </div>

                        </form>
                    </div>
                    <button type="button" name="btn-form" class="site-btn" data-toggle="modal"
                            data-target="#addTextbookModal">
                        Thêm TextBook
                    </button>
                </div>

            </div>

            </div>
        </section>
    </c:when>
</c:choose>
<div class="modal fade" id="addTextbookModal" tabindex="-1" role="dialog" aria-labelledby="checkoutModalTitle"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalTitle">Điền thông tin TextBook</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addtextbook" action="updateTextBook" method="post">
                    <input style="display:none" name="oldedit" id="oldedit" value="">
                    <div class="form-group">
                        <label for="addisbn" class="col-form-label">ISBN: </label>
                        <input class="form-control" type="text" id="addisbn" name="addisbn" minlength="7" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                <button form="addtextbook" type="submit" class="btn btn-primary" name="btn-form"
                        value="add${" "}${subjectlecturer.getSubjectID()}">
                    Submit
                </button>
            </div>
        </div>
    </div>
</div>

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
<script src="${pageContext.request.contextPath}/js/lecturer/main.js"></script>
</body>
</html>