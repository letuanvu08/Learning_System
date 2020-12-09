<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.foodcourt.common.UserType" %>
<%@ page import="com.foodcourt.common.model.Meal" %>

<%@page import="java.util.List"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="VendorDao" prefix="vd" %>
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

	<c:import url="/header_customer.jsp">
    	<c:param name="navbar_opt" value="2"/>
    </c:import>
    
     <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Giỏ hàng</h2>
                        <div class="breadcrumb__option">
                            <a href="${pageContext.request.contextPath}/customer/main">Trang chủ</a>
                            <span>Giỏ hàng</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                	<form action="Register" id="shopping_cart" method="post"></form>
                    <div class="shoping__cart__table">
                        <table id="shopping__cart__table">
                            <thead>
                                <tr>
                                    <th class="shoping__product">Món ăn</th>
                                    <th>Đơn giá</th>
                                    <th>Số lượng</th>
                                    <th>Tổng cộng</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="shopping__cart__list">
                            	<c:forEach items = "${shoppingCart.orderEntries}" var="entry" varStatus="loop">
                            		<tr class="shoping__cart__list">
	                                    <td class="shoping__cart__item">
	                                        <img src="${pageContext.request.contextPath}${entry.meal.imgSrc}" alt="">
	                                        <h5 class="item-title">${entry.meal.name}</h5>
	                                        <input id="item-id" type="hidden" value="${entry.meal.id }"/> 
	                                    </td>
	                                    <td class="shoping__cart__price">
	                                        <span id="item-price">${entry.meal.price}</span>&#8363;
	                                    </td>
	                                    <td class="shoping__cart__quantity">
	                                        <div class="quantity">
	                                            <div class="pro-qty">
	                                                <input id="item-quantity" type="text" value="${entry.quantity}"/>
	                                            </div>
	                                        </div>
	                                    </td>
	                                    <td class="shoping__cart__total">
	                                    	<span id="item-total-price"></span>&#8363;
	                                    </td>
	                                    <td class="shoping__cart__item__close">
	                                        <span class="icon_close"></span>
	                                    </td>
	                                </tr>
                            	</c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="${pageContext.request.contextPath}/customer/main" class="primary-btn cart-btn">TIẾP TỤC MUA HÀNG</a>
                        <a onclick="updateShoppingCart('${pageContext.request.contextPath}/customer/cart')" class="primary-btn cart-btn cart-btn-right">
                            Cập nhật giỏ hàng</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                         <!--     <h5>Mã giảm giá</h5>
                            <form action="#">
                                <input type="text" placeholder="Enter your coupon code">
                                <button type="submit" class="site-btn">ÁP DỤNG</button>
                            </form>-->
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Giá trị giỏ hàng</h5>
                        <ul>
                            <li>
                            	Tổng cộng
                            	<div class="shoping__checkout__total">   	
		                           	<span id="cart-total-price"></span><span>&#8363;</span>	
                            	</div>
                            </li>
                        </ul>
                        <a href="${pageContext.request.contextPath}/customer/confirmOrderController" class="primary-btn">THANH TOÁN</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
	
    <c:import url="/footer.jsp" />
    
    <!-- Modals -->
	<div class="modal fade" id="cartUpdateModal" tabindex="-1" role="dialog" aria-labelledby="cartUpdateModalTitle" aria-hidden="true">
  		<div class="modal-dialog modal-dialog-centered" role="document">
	    	<div class="modal-content">
		      	<div class="modal-header">
	        		<h5 class="modal-title" id="cartUpdateModalTitle">Thông báo</h5>
		        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          		<span aria-hidden="true">&times;</span>
		        	</button>
		      	</div>
		      	<div class="modal-body">
		      		<p>Giỏ hàng được cập nhật!</p>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/customer/view_cart.js"></script>
</body>

</html>