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
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Humberger Begin -->
<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
    <div class="humberger__menu__logo">
        <a href="#"><img src="${pageContext.request.contextPath}/img/logo.png" alt=""></a>
    </div>
    <!--
    <div class="humberger__menu__cart">
        <ul>
            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
        </ul>
        <div class="header__cart__price">item: <span>$150.00</span></div>
    </div>
    -->
    <div class="humberger__menu__widget">
        <div class="header__top__right__auth">
            <a href="./logout"><i class="fa fa-user"></i> Đăng xuất</a>
        </div>
    </div>
    <nav class="humberger__menu__nav mobile-menu">
        <ul>
            <li class="active"><a href="">Trang chủ</a></li>
            <li><a href="${pageContext.request.contextPath}/fcmanager/manage_accounts" class="primary-btn">Quản lý tài
                khoản</a></li>
            <li><a href="${pageContext.request.contextPath}/changepassword" class="primary-btn">Đổi mật khẩu</a></li>
        </ul>
    </nav>
    <div id="mobile-menu-wrap"></div>
    <div class="header__top__right__social">
        <a href="#"><i class="fa fa-facebook"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-pinterest-p"></i></a>
    </div>
    <div class="humberger__menu__contact">
        <ul>
            <li><i class="fa fa-envelope"></i> support@sfcs.com</li>
        </ul>
    </div>
</div>
<!-- Humberger End -->

<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa fa-envelope"></i> support@sfcs.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                            <a href="#"><i class="fa fa-pinterest-p"></i></a>
                        </div>
                        <div class="header__top__right__auth">
                            <a href="${pageContext.request.contextPath}/Logout"><i class="fa fa-user"></i> Đăng xuất</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href=""><img src="${pageContext.request.contextPath}/img/logo.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-9">
                <nav class="header__menu">
                    <ul>
                        <li class="active"><a href="">Trang chủ</a></li>
                        <li><a href="${pageContext.request.contextPath}/fcmanager/manage_accounts">Quản lý tài khoản</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/changepassword">Đổi mật khẩu</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>
<!-- Header Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Trang chủ</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Profile Section Begin -->

<!-- Profile Section End -->

<!-- Profile Function Section Begin -->
<section class="profile">
    <div class="container">
        <div class="profile__title">
            <h4>Tài khoản</h4>
        </div>

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
<div class="row" id="notifice" >
    <div class="col-lg-6"></div>
    <div class="col-lg-6" >
        <c:choose>
            <c:when test="${status==null}">
            </c:when>
            <c:when test="${status.equals(\"Thêm Lớp học thành công!\")}">
                <h5 class="alert alert-info" role="alert">Đăng ký thành công</h5>
            </c:when>
            <c:otherwise>
                <h5  class="alert alert-warning" role="alert"> <c:out value="${status}"/></h5>
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
                    <p id="account_add_prompt" style="display:none">Create a new user</p>
                    <p id="account_edit_prompt" style="display:none">Edit this user</p>
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
                                            <input type="checkbox" name="userlist" value="${entry.getSemester()}${" "}${entry.getClassId()}${" "}${entry.getSubClassId()}">
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
                                            <input style="display:none" name="valuedetail" value="${entry.getYear()}${" "}${entry.getSemester()}${" "}${entry.getClassId()}${" "}${entry.getSubClassId()}">
                                            <button type="submit"  name="btn-form"
                                                    class="site-btn" value="detail">Detail
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

                                <td><input type="hidden" name="account_id_edit" id="account_id_edit"
                                           class="site-btn" ></input></td>
                            </tr>
                            <tr>
                                <td>Name:</td>
                                <td><input type="text" name="account_name_edit" style="color:black"></td>
                            </tr>
                            <tr>
                                <td>Username:</td>
                                <td><input type="text" name="account_username_edit" style="color:black"></td>
                            </tr>
                            <tr>
                                <td>Email:</td>
                                <td><input type="text" name="account_email_edit" style="color:black"></td>
                            </tr>
                            <tr>
                                <td>Password:</td>
                                <td><input type="password" name="account_password_edit" size="20" style="color:black">
                                </td>
                            </tr>
                            <tr>
                                <td>User type:</td>
                                <td><select name="account_type_edit" style="color:black">
                                    <option value="NO_CHANGE" style="color:black">No change</option>
                                    <option value="CUSTOMER" style="color:black">Customer</option>
                                    <option value="COOK" style="color:black">Cook</option>
                                    <option value="IT" style="color:black">IT</option>
                                    <option value="VD_OWNER" style="color:black">Vendor owner</option>
                                </select>
                                </td>
                            </tr>
                        </table>
                        <div id="account_main_buttons" class="account__management__btns">
                            <button type="button" id="account_btn_remove" onclick="accountConfirmationForm()"
                                    class="site-btn">Xóa
                            </button>
                            <button type="button" id="account_btn_new" onclick="newAccountForm()" class="site-btn">Tài
                                khoản mới
                            </button>
                        </div>
                        <table id="account_remove_buttons" style="display:none">
                            <tr>
                                <td>
                                    <button type="submit" name="btn" id="account_btn_yes" value="account_remove"
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
                        <table id="account_edit_buttons" style="display:none">
                            <tr>
                                <td>
                                    <button type="submit" name="btn" id="btn_apply" value="account_edit"
                                            style="color:black">Apply
                                    </button>
                                </td>
                                <td>
                                    <button type="button" name="btn_cancel" id="btn_canceledit" style="color:black"
                                            onclick="accountEditForm()">Cancel
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
<script src="${pageContext.request.contextPath}/js/foodcourtmanager/main.js"></script>
</body>
</html>
