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
    <c:param name="title" value="CẬP NHÂT ĐĂNG KÝ MÔN HỌC"/>
</c:import>
<!-- Profile Section Begin -->

<!-- Profile Section End -->

<!-- Profile Function Section Begin -->
<section class="profile">
    <div class="container">


        <div class="row justify-content-center align-items-center">
            <div class="col-lg-9 profile__name">

                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="updateclassController" method="post">
                            <input type="text" placeholder="Semester" name="semesterfind">
                            <button type="submit" class="site-btn" name="btn-form" value="find">Choose</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>
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
                <div class="col-lg-12">
                    <p id="account_prompt" style="display:none">Remove these users?</p>
                    <p id="account_add_prompt" style="display:none">Tạo lớp học mới</p>
                    <p id="account_edit_prompt" style="display:none">Chỉnh sửa lớp học</p>
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
                                            <c:out value="${entry.getLecture()}"/>
                                        </td>
                                        <td>
                                            <input style="display:none" name="valuedetail"
                                                   value="${entry.getYear()}${" "}${entry.getSemester()}${" "}${entry.getClassId()}${" "}${entry.getSubClassId()}">
                                            <button type="submit" name="btn-form"
                                                    class="site-btn" value="detail">Detail
                                            </button>

                                            <button type="button" id="btn_edit" onclick="accountEditForm(this.value)"
                                                    class="site-btn"
                                                    value="${entry.getYear()}${" "}${entry.getSemester()}${" "}${entry.getClassId()}${" "}${entry.getSubClassId()}${" "}${entry.getLecturerId()}">
                                                Sửa
                                            </button>
                                        </td>

                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <table id="account_add_form" style="display:none">

                            <tr>
                                <td>Năm học:</td>
                                <td><input type="text" name="yearadd" style="color:black"></td>
                            </tr>
                            <tr>
                                <td>Học kỳ:</td>
                                <td><input type="text" name="semesteradd" style="color:black"></td>
                            </tr>
                            <tr>
                                <td>Mã môn học:</td>
                                <td><input type="text" name="subjectid" style="color:black"></td>
                            </tr>
                            <tr>
                                <td>Mã lớp học:</td>
                                <td><input type="text" name="subclassid" size="20" style="color:black">
                                </td>
                            </tr>
                            <tr>
                                <td>ID Giảng viên:</td>
                                <td><input type="text" name="lecturerid" size="20" style="color:black">
                                </td>
                            </tr>
                        </table>

                        <table id="account_edit_form" style="display:none">
                            <tr>
                                <td><input type="hidden" name="oldedit" id="oldedit"
                                           style="color:black"></input></td>
                            </tr>
                            <tr><td><input type="hidden" name="account_id_edit" id ="account_id_edit" style="color:black"></input></td></tr>
                            <tr>
                                <td>Năm học:</td>
                                <td><input type="text" id="yearedit" name="yearedit" style="color:black"></td>
                            </tr>
                            <tr>
                                <td>Học kỳ:</td>
                                <td><input type="text" id="semesteredit" name="semesteredit" style="color:black"></td>
                            </tr>
                            <tr>
                                <td>Mã môn học:</td>
                                <td><input type="text" id="subjectedit" name="subjectedit" style="color:black"></td>
                            </tr>
                            <tr>
                                <td>Mã lớp học:</td>
                                <td><input type="text" id="subclassidedit" name="subclassidedit" size="20"
                                           style="color:black">
                                </td>
                            </tr>
                            <tr>
                                <td>ID Giảng viên:</td>
                                <td><input type="text" id="lectureridedit" name="lectureridedit" size="20"
                                           style="color:black">
                                </td>
                            </tr>
                        </table>

                        <div id="account_main_buttons" class="account__management__btns">
                            <button type="button" id="account_btn_remove" onclick="accountConfirmationForm()"
                                    class="site-btn">Xóa
                            </button>
                            <button type="button" id="account_btn_new" onclick="newAccountForm()" class="site-btn">Tạo
                                thêm lớp mới
                            </button>
                        </div>
                        <table id="account_remove_buttons" style="display:none">
                            <tr>
                                <td>
                                    <button type="submit" name="btn-form" id="account_btn_yes" value="remove"
                                            style="color:black">Yes
                                    </button>
                                </td>
                                <td>
                                    <button type="button" name="btn" id="account_btn_no" style="color:black"
                                            onclick="accountConfirmationForm()">No
                                    </button>
                                </td>
                            </tr>
                        </table>
                        <table id="account_edit_buttons" style="display:none">
                            <tr>
                                <td>
                                    <button type="submit" name="btn-form" id="btn-form" value="edit"
                                            style="color:black">Apply
                                    </button>
                                </td>
                                <td>
                                    <button type="button" name="btn_cancel" id="btn_canceledit" style="color:black"
                                            onclick="accountEditForm(null)">Cancel
                                    </button>
                                </td>
                            </tr>
                        </table>
                        <table id="account_add_buttons" style="display:none">
                            <tr>
                                <td>
                                    <button type="submit" name="btn-form" id="btn_add" value="add"
                                            style="color:black">Add new
                                    </button>
                                </td>
                                <td>
                                    <button type="button" name="btn_cancel" id="btn_canceladd" style="color:black"
                                            onclick="newAccountForm()">Cancel
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
