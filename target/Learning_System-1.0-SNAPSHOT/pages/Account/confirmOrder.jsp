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
    	<c:param name="navbar_opt" value="3"/>
    </c:import>
	
     <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Thanh toán</h2>
                        <div class="breadcrumb__option">
                            <a href="${pageContext.request.contextPath}/customer/main">Trang chủ</a>
                            <span>Thanh toán</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>Phương thức thanh toán</h4>
                <form action="${pageContext.request.contextPath}/customer/purchaseController">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                               	<div class="checkout__method">
	                            	<div class="checkout__radio__btn">
	                            		<input type="radio" value="momo" id="momo" name="payment-method" required>
	                            	</div>
	                            	<div class="checkout__method__img">
	                            		<img src="${pageContext.request.contextPath}/img/payment/momo.png" >
	                            	</div>
	                            	<div class="checkout__method__content">
	                            		<span>Thanh toán bằng Ví MoMo</span>
	                            	</div>
                            	</div>
                            	<div class="checkout__method">
	                            	<div class="checkout__radio__btn">
	                            		<input type="radio" value="zalo-pay" id="zalo-pay" name="payment-method">
	                            	</div>
	                            	<div class="checkout__method__img">
	                            		<img src="${pageContext.request.contextPath}/img/payment/zalo-pay.png" >
	                            	</div>
	                            	<div class="checkout__method__content">
	                            		<span>Thanh toán bằng Ví ZaloPay</span>
	                            	</div>
                            	</div>
                            	<div class="checkout__method">
	                            	<div class="checkout__radio__btn">
	                            		<input type="radio" value="credit-card" id="credit-card" name="payment-method">
	                            	</div>
	                            	<div class="checkout__method__img">
	                            		<i class="fa fa-bank"></i>
	                            	</div>
	                            	<div class="checkout__method__content">
	                            		<span>Thanh toán bằng tài khoản SCFS</span>
	                            	</div>
                            	</div>
                            </div>
                            <div class="checkout__input">
                                <p>Ghi chú</p>
                                <input type="text"
                                    placeholder="Lưu ý về món ăn của bạn">
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Hóa đơn đặt món</h4>
                                <div class="checkout__order__products">Món ăn <span>Giá</span></div>
                                <ul>
                               		<c:forEach items = "${shoppingCart.orderEntries}" var="entry" varStatus="loop">
                                    <li> 
                                    	${entry.meal.name} (${entry.quantity} món)
                                    	<div class="checkout__order__price">
                                    		<span>${entry.quantity * entry.meal.price}</span><span>&#8363;</span>
                                    	</div>
                                    </li>
                                    </c:forEach>
                                </ul>
                                <ul>
                                	<li>
		                                <div class="checkout__order__total">
		                                	Tổng cộng:
		                                	<div class="checkout__order__price">
		                                		<span>${shoppingCart.price}</span><span>&#8363;</span>
		                                	</div>
		                                </div>
                                	</li>
                                </ul>
                               		<button type="button" class="site-btn checkout__btn">
                               			ĐẶT MÓN
                               		</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
    
    <c:import url="/footer.jsp" />
    
    <!-- Modals -->
    <div class="modal fade" id="checkoutModal" tabindex="-1" role="dialog" aria-labelledby="checkoutModalTitle" aria-hidden="true">
	  	<div class="modal-dialog" role="document">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="checkoutModalTitle">Điền thông tin thanh toán</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	        		</button>
	      		</div>
	      		<div class="modal-body">
	      			<p>Số dư tài khoản : ${user.balance} &#8363;</p>
					<p>Cần thanh toán : ${shoppingCart.price} &#8363;</p>
	      			<hr>
	        		<form id="bank-info-form" action="validify" method="post">
	          			<div class="form-group form-inline">
	            			<label for="bank-name" class="col-form-label">Loại tài khoản: </label>
	            			<select class="form-control" name="bankName" id="bank-name" required>
	            				<option value="" selected disabled>--Chọn loại tài khoản--</option>
							    <option value="SCFS">Người dùng Smart Food Court</option>  
							</select>
	          			</div>
	          			
	          			<div class="form-group">
							<label class="control-label" for="password">Mật khẩu tài khoản</label>
							<input class="form-control" type="password" id="password" name="password" minlength="1" required>
							<small id="passwordHelpInline" class="form-text text-muted">
								Chúng tôi sẽ không lưu thông tin cá nhân của bạn.
							</small>
					</div>
	        		</form>
	      		</div>
      			<div class="modal-footer">
	        		<button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy </button>
	        		<button form="bank-info-form" type="submit" class="btn btn-primary">Thanh toán </button>
	      		</div>
	    	</div>
	  	</div>
	</div>
	
	<div class="modal fade" id="errorMsgModal" tabindex="-1" role="dialog" aria-labelledby="errorMsgModalTitle" aria-hidden="true">
  		<div class="modal-dialog modal-dialog-centered" role="document">
	    	<div class="modal-content">
		      	<div class="modal-header">
	        		<h5 class="modal-title" id="errorMsgModalTitle">Thông báo</h5>
		        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          		<span aria-hidden="true">&times;</span>
		        	</button>
		      	</div>
		      	<div class="modal-body">
		      		<p>Chưa chọn phương thức thanh toán!</p>
	      		</div>

	    	</div>
	  	</div>
	</div>
	
	<c:choose>
		<c:when test="${paidStatus == true}">
			<div class="modal fade" id="paymentStatusModal" tabindex="-1" role="dialog" aria-labelledby="paymentStatusModalTitle">
		  		<div class="modal-dialog modal-dialog-centered" role="document">
			    	<div class="modal-content">
				      	<div class="modal-header">
			        		<h5 class="modal-title" id="paymentStatusModalTitle">Thông báo</h5>
				        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          		<span aria-hidden="true">&times;</span>
				        	</button>
				      	</div>
				      	<div class="modal-body">
				      		<p>Thanh toán thành công!</p>
			      		</div>
			    	</div>
			  	</div>
			</div>
		</c:when>
		<c:when test="${paidStatus == false}">
			<div class="modal fade" id="paymentStatusModal" tabindex="-1" role="dialog" aria-labelledby="paymentStatusModalTitle">
		  		<div class="modal-dialog modal-dialog-centered" role="document">
			    	<div class="modal-content">
				      	<div class="modal-header">
			        		<h5 class="modal-title" id="paymentStatusModalTitle">Thông báo</h5>
				        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          		<span aria-hidden="true">&times;</span>
				        	</button>
				      	</div>
				      	<div class="modal-body">
				      		<p>Thanh toán thất bại!</p>
			      		</div>
			    	</div>
			  	</div>
			</div>
		</c:when>
	</c:choose>
	
	

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