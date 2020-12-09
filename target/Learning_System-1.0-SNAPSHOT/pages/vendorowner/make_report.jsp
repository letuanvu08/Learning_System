<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__auth">
                <a href="./logout"><i class="fa fa-user"></i> Đăng xuất</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
				<li class="active"><a href="">Trang chủ</a></li>
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
                            <li><a href="${pageContext.request.contextPath}/vdowner/main">Trang chủ</a></li>
							<li class="active"><a href="">Tạo báo cáo</a></li>
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
                        <h2>Tạo báo cáo</h2>
                    </div>
                    <div class="breadcrumb__option">
	                    <a href="${pageContext.request.contextPath}/vdowner/main">Trang chủ</a>
	                    <span>Tạo báo cáo</span>
	                </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    <!-- Make Report Start -->
    <section class="report__compiler spad">
    	<div class="container">
    		<div class="row">
    			<div class="col-lg-6">
    				<div class="row">
    					<div class="col-lg-12 report__compiler__interval">
	    					<div class="report__compiler__interval__opt">
	                         	<div class="interval__radio__btn">
	                         		<input type="radio" value="momo" id="momo" name="payment-method" required>
	                         	</div>
	                         	<div class="report__compiler__content">
	                         		<span>Thanh toán bằng Ví MoMo</span>
	                         	</div>
	                        </div>
	                        <div class="report__compiler__interval__opt">
	                         	<div class="interval__radio__btn">
	                         		<input type="radio" value="momo" id="momo" name="payment-method" required>
	                         	</div>
	                         	<div class="report__compiler__content">
	                         		<span>Thanh toán bằng Ví MoMo</span>
	                         	</div>
	                        </div>
	                        <div class="report__compiler__interval__opt">
	                         	<div class="interval__radio__btn">
	                         		<input type="radio" value="momo" id="momo" name="payment-method" required>
	                         	</div>
	                         	<div class="report__compiler__content">
	                         		<span>Thanh toán bằng Ví MoMo</span>
	                         	</div>
	                        </div>
    					</div>
    				</div>
    			</div>
    		</div>
    		<div class="row">
	    		<div class="col-lg-12">
	    			<form action="MakeReportController" method="get" id="download_form" class="report__compiler__form">
	    				<div class="report__compiler__input form-row align-items-center">
	    					<div class="col-md-4">
	    						<div class="form-group row align-items-center">
	    							<div class="col-auto">
	    								<label class="control-label" for="start_date">Ngày bắt đầu:</label>
									</div>
									<div class="col-auto">
										<input class="form-control" type="date" id="start_date" name="input_start_date" required>
	    							</div>
	    						</div>
								
							</div>
							<div class="col-md-4">
								<div class="form-group row align-items-center">
									<div class="col-auto">
										<label class="control-label" for="end_date">Ngày kết thúc:</label>
									</div>
									<div class="col-auto">
										<input class="form-control" type="date" id="end_date" name="input_end_date" required>
									</div>
									
								</div>
							</div>
							<div class="report__compiler__btn text-center col-md-4">
								<button id="btn_compile" type="submit" class="site-btn">Tạo báo cáo</button>
							</div>
	    				</div>
					</form>
	    		</div>
	    	</div>
    	</div>
    	
    </section>
	<!-- Make Report End -->
	
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
    <script src="${pageContext.request.contextPath}/js/cook/main.js"></script>
</body>
</html>