<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%@include file = "/WEB-INF/templates/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Sign Up</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/auth/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/auth/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/auth/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/auth/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/auth/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/auth/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/auth/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/auth/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/auth/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/auth/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/auth/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background: linear-gradient(to bottom, #ccccff 0%, #6666ff 100%);">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action = "${pageContext.request.contextPath }/customer/add"  method = "post">
					<span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"></i>
					</span>

					<span class="login100-form-title p-b-34 p-t-27">
						Đăng ký tài khoản
					</span>
					<p style="color:red">${msg }</p>
					<div class="wrap-input100 validate-input" data-validate = "Enter your fullname">
						<input class="input100" type="text" name="name" placeholder="Fullname">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
						<form:errors cssStyle="color:#b91919" path="objCus.name"></form:errors>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<input class="input100" type="text" name="username" placeholder="Username">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
						<form:errors cssStyle="color:#b91919" path="objCus.username"></form:errors>
					</div>					
					<div class="wrap-input100 validate-input" data-validate = "Enter your email">
						<input class="input100" type="text" name="email" placeholder="Email">						
						<span class="focus-input100" data-placeholder="&#xf1d8;"></span>
						<form:errors cssStyle="color:#b91919" path="objCus.email"></form:errors></br>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Enter your phone">
						<input class="input100" type="text" name="phone" placeholder="Phone">
						<span class="focus-input100" data-placeholder="&#xf2b9;"></span>
						<form:errors cssStyle="color:#b91919" path="objCus.phone"></form:errors></br>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Enter your address">
						<input class="input100" type="text" name="address" placeholder="address">						
						<span class="focus-input100" data-placeholder="&#xf109;"></span>
						<form:errors cssStyle="color:#b91919" path="objCus.phone"></form:errors></br>
					</div>
					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="password" placeholder="Password">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
						<form:errors cssStyle="color:#b91919" path="objCus.password"></form:errors>
					</div>
					
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Đăng ký
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	

</body>
</html>