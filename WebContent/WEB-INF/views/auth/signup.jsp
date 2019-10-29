<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%@include file = "/WEB-INF/templates/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V18</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/auth/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/auth/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/auth/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/auth/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
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
<body style="background-color: #666666;">
	
	<div class="limiter">
		<div class="container-login100">
		
			<div class="wrap-login100">
			
				<form class="login100-form validate-form" action = "${pageContext.request.contextPath }/customer/add" method = "post">
				
					<span class="login100-form-title p-b-43">
						Đăng kí tài khoản
					</span>
					
					<p style="color:red">${msg }</p>
					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" name="name" >
						<span class="focus-input100"></span>
						<span class="label-input100">họ tên</span>
						<form:errors cssStyle="color:red" path="objCus.name"></form:errors>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="username">
						<span class="focus-input100"></span>
						<span class="label-input100">tên đăng nhập</span>
						<form:errors cssStyle="color:red" path="objCus.username"></form:errors>
					</div>
					
					
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="password" name="password" >
						<span class="focus-input100"></span>
						<span class="label-input100">mật khẩu</span>
						<form:errors cssStyle="color:red" path="objCus.password"></form:errors>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="text" name="email">
						<span class="focus-input100"></span>
						<span class="label-input100">email</span>
						<form:errors cssStyle="color:red" path="objCus.email"></form:errors></br>
					</div>
					<div class="wrap-input100 validate-input" data-validate="Phone is required">
						<input class="input100" type="text" name="phone">
						<span class="focus-input100"></span>
						<span class="label-input100">phone</span>
						<form:errors cssStyle="color:red" path="objCus.phone"></form:errors></br>
					</div>
					<div class="wrap-input100 validate-input" data-validate="Address is required">
						<input class="input100" type="text" name="address">
						<span class="focus-input100"></span>
						<span class="label-input100">address</span>
						<form:errors cssStyle="color:red" path="objCus.address"></form:errors></br>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Signup
						</button>
						
					</div>
				</form>

				<div class="login100-more"  style="background-image: url('${pageContext.request.contextPath}/resources/auth/images/bg2.jpg');">
				</div>
				
			</div>
		</div>
	</div>
	
	

	
	
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/auth/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/auth/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/auth/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/resources/auth/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/auth/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/auth/vendor/daterangepicker/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/auth/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/auth/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/auth/ js/main.js"></script>

</body>
</html>