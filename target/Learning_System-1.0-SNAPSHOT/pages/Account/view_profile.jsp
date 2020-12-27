<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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

<c:import url="/template_header.jsp">
    <c:param name="navbar_opt" value="1"/>
    <c:param name="user" value="${user.getUserType().toString()}"/>
    <c:param name="title" value="TÀI KHOẢN"/>

</c:import>

<!-- Breadcrumb Section Begin -->
<!-- Breadcrumb Section End -->

<!-- Profile Section Begin -->
<section class="profile">
    <div class="container">
        <div class="profile__title">
            <h4>Tài khoản</h4>
        </div>

        <div class="row justify-content-center align-items-center">
            <div class="col-6 col-md-3 profile__name">
                <h2>${user.getUsername()}</h2>
                <p class="text-muted">@${user.getAccountName()}</p>
            </div>
            <div class="col-6 col-md-3 profile__img">
                <img src="${pageContext.request.contextPath}/img/user/1.jpg">
            </div>
        </div>
    </div>
</section>
<!-- Profile Section End -->

<!-- Profile Function Section Begin -->
<section class="profile__featured">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="featured__controls">
                    <ul>
                        <li class="active" data-filter=".general">Thông tin chung</li>
                      <%--     <li data-filter=".paid-orders">Thông tin Sinh Viên</li> --%>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row justify-content-center profile__options__filter">
            <!-- General info -->
            <div class="profile__featured__general col-lg-6 mix general">
                <ul class="list-unstyled">
                    <li>
                        <h4>Loại tài khoản</h4>
                        <span>${user.getUserType().toString()}</span>
                    </li>
                    <li>
                        <h4>Email</h4>
                        <span>
            					<c:choose>
                                    <c:when test="${empty user.getemail()}">
                                        Chưa có thông tin
                                    </c:when>
                                    <c:otherwise>
                                        ${user.getemail()}
                                    </c:otherwise>
                                </c:choose>
            				</span>
                    </li>


                    <li ><a href="changepassword" class = "site-btn">Đổi mật khẩu</a></li>
                </ul>
            </div>
           <%--    <div class="profile__featured__general col-lg-6 mix paid-orders">
                <ul class="list-unstyled">
                    <li>
                        <h4>Loại tài khoản</h4>
                        <span>${user.userType.toString()}</span>
                    </li>
                    <li>
                        <h4>Mã số Sinh Viên</h4>
                        <span>
            					<c:choose>
                                    <c:when test="${null == student}">
                                        Chưa có thông tin
                                    </c:when>
                                    <c:otherwise>
                                        ${student.getStudentID()}
                                    </c:otherwise>
                                </c:choose>
            				</span>
                    </li>
                    <li>
                        <h4>khóa</h4>
                        <span>
            					<c:choose>
                                    <c:when test="${null == student}">
                                        Chưa có thông tin
                                    </c:when>
                                    <c:otherwise>
                                        ${student.getYearofadmission()}
                                    </c:otherwise>
                                </c:choose>
            				</span>
                    </li>
                    <li>
                        <h4>Khoa</h4>
                        <span>
            					<c:choose>
                                    <c:when test="${null == student}">
                                        Chưa có thông tin
                                    </c:when>
                                    <c:otherwise>
                                        ${student.getFSName()}
                                    </c:otherwise>
                                </c:choose>
            				</span>
                    </li>
                    <li>
                        <h4>Tinh Trạng</h4>
                        <span>
            					<c:choose>
                                    <c:when test="${null == student}">
                                        Chưa có thông tin
                                    </c:when>
                                    <c:otherwise>
                                        ${student.getStatus()}
                                    </c:otherwise>
                                </c:choose>
            				</span>
                    </li>

                </ul>
            </div> --%>
            <!-- End General info -->
            <!-- View paid orders -->
<%--            <div class="profile__featured__general col-lg-6 mix paid-orders">--%>
<%--                <c:forEach items = "${PaidOrders}" var="order">--%>
<%--                    <div class="col-lg-12">--%>
<%--                        <div class="order__table">--%>
<%--                            <table>--%>
<%--                                <tr>--%>
<%--                                    <td colspan=4>--%>
<%--                                        <div class="shoping__cart__table">--%>
<%--                                            <table>--%>
<%--                                                <thead>--%>
<%--                                                <tr>--%>
<%--                                                    <th class="shoping__product">Tên món ăn</th>--%>
<%--                                                    <th>Đơn giá</th>--%>
<%--                                                    <th>Số lượng</th>--%>
<%--                                                    <th>Tổng cộng</th>--%>
<%--                                                    <th></th>--%>
<%--                                                </tr>--%>
<%--                                                </thead>--%>
<%--                                                <tbody>--%>
<%--                                                <c:forEach items = "${order.orderEntries}" var="entry" varStatus="loop">--%>
<%--                                                    <tr class="shoping__cart__list">--%>
<%--                                                        <td class="shoping__cart__item">--%>
<%--                                                            <h5 class="item-title">${entry.meal.name}</h5>--%>
<%--                                                        </td>--%>
<%--                                                        <td class="shoping__cart__price">--%>
<%--                                                            <span id="item-price">${entry.meal.price}</span>--%>
<%--                                                        </td>--%>
<%--                                                        <td class="shoping__cart__quantity">--%>
<%--                                                            <div class="quantity">--%>
<%--                                                                <span id="item-quantity-rm">${entry.quantity}</span>--%>
<%--                                                            </div>--%>
<%--                                                        </td>--%>
<%--                                                        <td class="shoping__cart__total">--%>
<%--                                                            <span id="item-total-price-rm">${entry.meal.price*entry.quantity }</span>&#8363;--%>
<%--                                                        </td>--%>
<%--                                                    </tr>--%>
<%--                                                </c:forEach>--%>
<%--                                                </tbody>--%>
<%--                                            </table>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td>--%>
<%--											<span id="purchase__timestamp">--%>
<%--												<c:out value="Thời gian chờ đợi : ${order.eta} (phút)" />--%>
<%--											</span>--%>
<%--                                    </td>--%>
<%--                                    <td>--%>
<%--											<span id="total__order__price">--%>
<%--												<c:out value="Tổng đơn hàng : ${order.price}" />&#8363;--%>
<%--											</span>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td>--%>
<%--											<span id="order__status">--%>
<%--												<c:choose>--%>
<%--                                                    <c:when test="${order.isDone == 0}">--%>
<%--                                                        <c:out value="Tình trạng hoàn thành : đã hoàn thành" />--%>
<%--                                                    </c:when>--%>
<%--                                                    <c:when test="${order.isDone == 1}">--%>
<%--                                                        <c:out value="Tình trạng hoàn thành : chưa hoàn thành" />--%>
<%--                                                    </c:when>--%>
<%--                                                    <c:otherwise>--%>
<%--                                                        <c:out value="Tình trạng hoàn thành : đã xảy ra lỗi" />--%>
<%--                                                    </c:otherwise>--%>
<%--                                                </c:choose>--%>

<%--											</span>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                            </table>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </c:forEach>--%>
<%--            </div>--%>
            <!-- End View paid orders -->
            <!-- Recharge -->
<%--            <div class="profile__featured__general col-lg-6 mix recharge">--%>
<%--                <div class="checkout__form">--%>
<%--                    <h4>Nhập thông tin thẻ nạp</h4>--%>
<%--                    <form action="${pageContext.request.contextPath }/customer/rechargeController">--%>
<%--                        <div class="row">--%>
<%--                            <div class="col-lg-12">--%>
<%--                                <div class="checkout__input">--%>

<%--                                    <select class="form-control" name="cardType" id="cardType" required>--%>
<%--                                        <option value="" selected disabled>--Chọn loại thẻ--</option>--%>
<%--                                        <option value="SCFS">Thẻ nạp Smart Food Court</option>--%>
<%--                                    </select>--%>

<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="row">--%>
<%--                            <div class="col-lg-12">--%>
<%--                                <div class="checkout__input">--%>
<%--                                    <p>Số seri<span>*</span></p>--%>
<%--                                    <input type="text" required name="serialNumber" id="serialNumber">--%>
<%--                                    <small id="serialHelpInline1" class="form-text text-muted">--%>
<%--                                        Cào nhẹ phần tráng bạc để biết mã số seri. Số seri gồm 20 ký tự gồm số và chữ viết hoa.--%>
<%--                                    </small>--%>
<%--                                    <small id="serialHelpInline2" class="form-text text-muted">--%>
<%--                                        Mua thẻ nạp Smart Food Court tại các điểm giao dịch và căn tin của trường.--%>
<%--                                    </small>--%>
<%--                                    <small id="serialHelpInline3" class="form-text text-muted">--%>
<%--                                        Không mua thẻ có dấu hiệu bị cào xướt hay rách nát.--%>
<%--                                    </small>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="row">--%>
<%--                            <div class="col-lg-12">--%>
<%--                                <div class="rechare__submit">--%>
<%--                                    <button type="submit" class="site-btn">Nạp tiền</button>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
            <!-- End Recharge -->
        </div>
    </div>
</section>



<!-- Profile Function Section End -->

<c:import url="/footer.jsp" />

<!-- Js Plugins -->
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
<script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>
