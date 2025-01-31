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

<!-- Page Preloder -->

<!-- Breadcrumb Section End -->
<c:import url="/template_header.jsp">
    <c:param name="navbar_opt" value="1"/>
    <c:param name="user" value="aaoemployee"/>
    <c:param name="title" value="CẬP NHÂT ĐĂNG KÝ MÔN HỌC"/>
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
                            <li class="active" data-filter=".general">Quản lý lớp học</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center profile__options__filter">
                <!-- General info -->

                <!-- End General info -->

                <!-- View users -->
                <div class="profile__featured__general col-lg-12 mix general">
                    <div class="container" style="padding: 20px">
                        <div class="row justify-content-center align-items-center">
                            <form class="form-inline" action="updateclassController" method="post">
                                <div class="form-group mx-sm-3 mb-2">
                                    <label for="subjectid" class="sr-only">Mã môn học</label>
                                    <input type="text" class="form-control" id="semesterfind" name="semesterfind" placeholder="Semester">
                                </div>
                                <button type="submit" class="site-btn btn btn-success " name="btn-form" value="find">Choose</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <p id="account_prompt" style="display:none">Remove these users?</p>
                        <p id="account_add_prompt" style="display:none">Tạo lớp học mới</p>
                        <p id="account_edit_prompt" style="display:none">Chỉnh sửa lớp học</p>
                        <form action="updateclassController" method="post">

                            <table id="user_list" class="table table-striped">
                                <thead>
                                <tr class="table-primary">
                                    <th></th>
                                    <th>Năm học</th>
                                    <th>Học kỳ</th>
                                    <th>Mã môn học</th>
                                    <th>Mã lớp học</th>
                                    <th>Tên môn học</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listclass}" var="entry" varStatus="loop">
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
                                            <input style="display:none" name="valuedetail"
                                                   value="">
                                            <button type="submit" name="btn-form"
                                                    class="site-btn"
                                                    value="detail${" "}${entry.getYear()}${" "}${entry.getSemester()}${" "}${entry.getClassId()}${" "}${entry.getSubClassId()}">
                                                Detail
                                            </button>

                                            <button type="button" id="btn_edit" onclick="accountEditForm(this.value)"
                                                    class="site-btn btn-warning"
                                                    value="${entry.getYear()}${" "}${entry.getSemester()}${" "}${entry.getClassId()}${" "}${entry.getSubClassId()}${" "}${entry.getLecturerId()} "
                                                    data-toggle="modal" data-target="#EditModal">
                                                Sửa
                                            </button>
                                        </td>

                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <div id="account_main_buttons" class="account__management__btns">
                                <button type="button" id="account_btn_remove" onclick="accountConfirmationForm()"
                                        class="btn btn-danger">Xóa
                                </button>
                                <button type="button" id="account_btn_new" class="site-btn checkout__btn"
                                        data-toggle="modal" data-target="#AddModal">Tạo
                                    thêm lớp mới
                                </button>
                            </div>
                            <table id="account_remove_buttons" style="display:none">
                                <tr>
                                    <td>
                                        <button type="submit" class="site-btn" name="btn-form" id="vendor_btn_yes"
                                                value="remove" style="color:black">Yes
                                        </button>
                                    </td>
                                    <td>
                                        <button type="button" class="site-btn" name="btn" id="vendor_btn_no"
                                                style="color:black" onclick="accountConfirmationForm()">No
                                        </button>
                                    </td>
                                </tr>
                            </table>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End View users -->

    <!-- View vendors -->

    <!-- Profile Function Section End -->

    <%--<c:import url="/footer.jsp"/>--%>

    <div class="modal fade" id="AddModal" tabindex="-1" role="dialog" aria-labelledby="checkoutModalTitle"
         aria-hidden="true">oi
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="checkoutModalTitle">Điền thông tin Lớp học</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="add_form" action="updateclassController" method="post">
                        <div class="form-group">
                            <label for="yearadd" class="col-form-label">Năm học: </label>
                            <input class="form-control" type="text" id="yearadd" name="yearadd" minlength="3" required>
                        </div>

                        <div class="form-group">
                            <label for="yearadd" class="col-form-label">Học kỳ: </label>
                            <input class="form-control" type="text" id="semesteradd" name="semesteradd" minlength="3"
                                   required>
                        </div>
                        <div class="form-group">
                            <label for="yearadd" class="col-form-label">Mã môn học: </label>
                            <input class="form-control" type="text" id="subjectid" name="subjectid" minlength="3"
                                   required>
                        </div>
                        <div class="form-group">
                            <label for="yearadd" class="col-form-label">Mã lớp học: </label>
                            <input class="form-control" type="text" id="subclassid" name="subclassid" minlength="3"
                                   required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                    <button form="add_form" type="submit" class="btn btn-primary" name="btn-form" value="add">Thêm lớp
                        học
                    </button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="EditModal" tabindex="-1" role="dialog" aria-labelledby="checkoutModalTitle"
         aria-hidden="true">oi
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalTitle">Điền thông tin Lớp học</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="account_edit_form" action="updateclassController" method="post">
                        <input style="display:none" name="oldedit" id="oldedit" value="">
                        <div class="form-group">
                            <label for="yearadd" class="col-form-label">Năm học: </label>
                            <input class="form-control" type="text" id="yearedit" name="yearedit" minlength="3"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="yearadd" class="col-form-label">Học kỳ: </label>
                            <input class="form-control" type="text" id="semesteredit" name="semesteredit" minlength="3"
                                   required>
                        </div>
                        <div class="form-group">
                            <label for="yearadd" class="col-form-label">Mã môn học: </label>
                            <input class="form-control" type="text" id="subjectedit" name="subjectedit" minlength="3"
                                   required>
                        </div>
                        <div class="form-group">
                            <label for="yearadd" class="col-form-label">Mã lớp học: </label>
                            <input class="form-control" type="text" id="subclassidedit" name="subclassidedit"
                                   minlength="3"
                                   required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                    <button form="account_edit_form" type="submit" class="btn btn-primary" name="btn-form" value="edit">
                        Submit
                    </button>
                </div>
            </div>
        </div>
    </div>


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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/customer/main.js"></script>
</body>
</html>
