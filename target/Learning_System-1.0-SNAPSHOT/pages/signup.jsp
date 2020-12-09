<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="description" content="Ogani Template">
	    <meta name="keywords" content="Ogani, unica, creative, html">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	    
	    <title>Tạo tài khoản SCFS</title>
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
    	<div id="preloder">
        	<div class="loader"></div>
    	</div>	
		
		<section class="form-window">
			<!-- form content -->
			<div class="form-content">
				<!-- form title -->
				<div class="form-title">
					<h2>Tạo tài khoản SFCS của bạn</h2>
				</div>
				<form action="Register" id="signup_form" method="post">
					<!-- form field-->
					<div class="form-group">
						<label class="control-label" for="name">Họ và tên</label>
						<input class="form-control" type="text" name="name" id="name" required>
					</div>
					<div class="form-group">
						<label class="control-label" for="email">Email</label>
						<input class="form-control" type="text" name="email" id="email" required>
					</div>
					<div class="form-group">
						<label class="control-label" for="username">Tên đăng nhập</label>
						<input class="form-control" type="text" name="username" id="username" required>
					</div>

					<div class="form-group">
						<label class="control-label" for="password">Mật khẩu</label>
						<input class="form-control" type="password" name="password" id="password" minlength="4" maxlength="20" required>
						<small id="passwordHelpInline" class="form-text text-muted">
						Mật khẩu của bạn phải dài từ 4-20 kí tự.
						</small>
					</div>
					<div class="form-group text-center">
						<button type="submit" class="site-btn">Tạo tài khoản</button>
					</div>
				</form>
				<div class="other-opts">
					<span>
						<a id="sign-up" href="./login">
							Đã có tài khoản? Đăng nhập
						</a>
					</span>
				</div>
			</div>
		</section>
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