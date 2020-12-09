<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="description" content="Ogani Template">
	    <meta name="keywords" content="Ogani, unica, creative, html">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	    
	    <title>Đổi mật khẩu</title>
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
		<!-- 
		<div class="form-window">
			
			<div class="form-content animated fadeInUp">
				
				<div class="form-title">
					<h1>Đổi Mật Khẩu</h1>
				</div>
				<form action="changepassword" id="login_form" method="post">
					
					<div class="form-group">
						<label class="control-label" for="oldpassword">Mật khẩu cũ</label>
						<input class="form-control" type="password" id="oldpassword" name="oldpassword" minlength="4" maxlength="20" required>
						<small id="passwordHelpInline" class="form-text text-muted">
							Mật khẩu của bạn phải dài từ 4-20 kí tự.
						</small>
					</div>
					<div class="form-group">
						<label class="control-label" for="newpassword">Mật khẩu mới</label>
						<input class="form-control" type="password" id="newpassword" name="newpassword" minlength="4" maxlength="20" required>
						<small id="passwordHelpInline" class="form-text text-muted">
							Mật khẩu của bạn phải dài từ 4-20 kí tự.
						</small>
					</div>
					<div class="form-group text-center">
						<button type="submit" class="btn btn-theme btn-lg">Xác nhận</button>
					</div>
					
				</form>
				<div class="other-opts">
					<a id="cancel" href="./view_profileJSP">
						<span>Hủy bỏ</span>
					</a>
					
				</div>

			</div>
			
		</div>
		-->
		<!-- Page Preloder -->
    	<div id="preloder">
        	<div class="loader"></div>
    	</div>	
    	<!-- Login form -->
		<section class="form-window">
			<div class="form-content">
				<div class="form-title">
					<h2>Đổi mật khẩu</h2>
				</div>
				<form action="changepassword" id="change_password_form" method="post">
					<!-- form field-->
				
					<div class="form-group">
						<label class="control-label" for="oldpassword">Mật khẩu cũ</label>
						<input class="form-control" type="password" id="oldpassword" name="oldpassword" minlength="4" maxlength="20" required>
						<small id="passwordHelpInline" class="form-text text-muted">
							Mật khẩu của bạn phải dài từ 4-20 kí tự.
						</small>
					</div>
					
					<div class="form-group">
						<label class="control-label" for="newpassword">Mật khẩu mới</label>
						<input class="form-control" type="password" id="newpassword" name="newpassword" minlength="4" maxlength="20" required>
						<small id="passwordHelpInline" class="form-text text-muted">
							Mật khẩu của bạn phải dài từ 4-20 kí tự.
						</small>
					</div>
					
                  	<c:choose>
                  		<c:when test="${error == 1}">
                  			<h5 class="form-error">Mật khẩu cũ không chính xác</h5>
                  		</c:when>
                  		
                  		<c:when test="${error == 2}">
                  			<h5 class="form-error">Mật khẩu cũ và mật khẩu mới trùng nhau</h5>
                  		</c:when>
                  	</c:choose>
                  	
					<div class="form-group text-center">
						<button type="submit" name="btn" value="xacnhan" class="site-btn">Xác nhận</button>
					</div>
					
				</form>
				<form action="changepassword" id="change_password_form" method="post">
				<div class="form-group text-center">
				<button type="submit" name="btn" value="huybo" class="site-btn">Hủy bỏ</button>
				</div>
				</form>
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