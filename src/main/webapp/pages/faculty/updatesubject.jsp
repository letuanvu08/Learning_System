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
    <c:param name="user" value="faculty"/>
    <c:param name="title" value="CẬP NHÂT MÔN HỌC"/>
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
<c:import url="/pages/faculty/addsubject.jsp"/>
<script>
    setTimeout(() => {
        var elem = document.getElementById("notifice");
        elem.remove();
    }, 5000);
</script>


<div class="container-fluid ">
    <section class="section bg-light">
        <div class="row justify-content-center profile__options__filter">
            <div class="col-lg-10" style="padding: 30px">
                <form action="updateSubject" method="post">
                    <fieldset>
                        <legend class="text-success"><b>Danh sách các môn hoc đang mở:</b></legend>

                        <table id="user_list" class="table table-striped">

                            <thead>
                            <tr class="table-primary">
                                <th>Mã Môn học</th>
                                <th>Tên Môn học</th>
                                <th>Số tín chỉ</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listsubject}" var="subject">
                                <c:choose>
                                    <c:when test="${subject.getStatus()==0}">
                                        <tr>
                                            <td>
                                                <c:out value="${subject.getSubjectID()}"/>
                                            </td>
                                            <td>
                                                <c:out value="${subject.getSubjectName()}"/>
                                            </td>
                                            <td>
                                                <c:out value="${subject.getNocredit()}"/>
                                            </td>
                                            <td>
                                                <input style="display:none" name="valueopen"
                                                       value="">
                                                <button type="submit" name="btn-form" class="site-btn"
                                                        value="open ${subject.getSubjectID()}">
                                                    Mở
                                                </button>
                                            </td>
                                        </tr>
                                    </c:when>
                                </c:choose>

                            </c:forEach>

                            </tbody>
                        </table>
                    </fieldset>

                </form>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-10" style="padding: 30px">
                <form action="updateSubject" method="post">
                    <fieldset>
                        <legend class="text-success"><b>Danh sách các môn hoc đang đóng:</b></legend>

                        <table id="user_list" class="table table-striped">
                        <thead>
                        <tr class="table-primary">
                            <th>Mã Môn học</th>
                            <th>Tên Môn học</th>
                            <th>Số tín chỉ</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listsubject}" var="subject">
                            <c:choose>
                                <c:when test="${subject.getStatus()==1}">
                                    <tr>
                                        <td>
                                            <c:out value="${subject.getSubjectID()}"/>
                                        </td>
                                        <td>
                                            <c:out value="${subject.getSubjectName()}"/>
                                        </td>
                                        <td>
                                            <c:out value="${subject.getNocredit()}"/>
                                        </td>
                                        <td>
                                            <button type="submit" name="btn-form" class="site-btn btn-danger"
                                                    value="close ${subject.getSubjectID()}">
                                                Đóng
                                            </button>
                                        </td>
                                    </tr>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                        </tbody>
                    </table>
                    </fieldset>

                </form>
            </div>
        </div>
</div>
</section>


<%--<c:import url="/footer.jsp"/>--%>


<div class="modal fade" id="EditModal" tabindex="-1" role="dialog" aria-labelledby="checkoutModalTitle"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalTitle">Điền thông tin Môn học</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="account_edit_form" action="updateclassController" method="post">
                    <input style="display:none" name="oldedit" id="oldedit" value="">
                    <div class="form-group">
                        <label for="yearedit" class="col-form-label">Năm học: </label>
                        <input class="form-control" type="text" id="yearedit" name="yearedit" minlength="3" required>
                    </div>

                    <div class="form-group">
                        <label for="semesteredit" class="col-form-label">Học kỳ: </label>
                        <input class="form-control" type="text" id="semesteredit" name="semesteredit" minlength="3"
                               required>
                    </div>
                    <div class="form-group">
                        <label for="subjectedit" class="col-form-label">Mã môn học: </label>
                        <input class="form-control" type="text" id="subjectedit" name="subjectedit" minlength="3"
                               required>
                    </div>
                    <div class="form-group">
                        <label for="subclassidedit" class="col-form-label">Mã lớp học: </label>
                        <input class="form-control" type="text" id="subclassidedit" name="subclassidedit" minlength="3"
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
