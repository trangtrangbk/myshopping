<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/templates/taglib.jsp"%>
<div class="w3l_banner_nav_right">
	<div class="privacy about">
		<!--===============================================================================================-->
		<link rel="icon" type="image/png"
			href="${pageContext.request.contextPath}/resources/auth/images/icons/favicon.ico" />
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/auth/vendor/bootstrap/css/bootstrap.min.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/auth/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/auth/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/auth/vendor/animate/animate.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/auth/vendor/css-hamburgers/hamburgers.min.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/auth/vendor/animsition/css/animsition.min.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/auth/vendor/select2/select2.min.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/auth/vendor/daterangepicker/daterangepicker.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/auth/css/util.css">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/auth/css/main.css">
		<!--===============================================================================================-->

		<div class="checkout-right">

			<form class="login100-form validate-form" action="" method="post">
				<span class="login100-form-title p-b-43"> Sửa thông tin </span>



				<p style="color: red">${msg }</p>
				<label>Họ tên</label>
				<div class="wrap-input100 validate-input">

					<input class="input100" type="text" name="name"
						value="${customer.name }" required="true"> <span
						class="focus-input100"></span>
				</div>

				<label>Tên đăng nhập</label>
				<div class="wrap-input100 validate-input">

					<input class="input100" type="text" name="username"
						value="${customer.username }" required="true"> <span
						class="focus-input100"></span>
				</div>
				<label>Email</label>
				<div class="wrap-input100 validate-input" >
						<input class="input100" type="text" name="email" value = "${customer.email }" required="true">
						<span class="focus-input100"></span>
					</div>
				<label>mật khẩu</label>
				<div class="wrap-input100 validate-input">

					<input class="input100" type="password" name="password"
						required="true"> <span class="focus-input100"></span>
				</div>

				<div class="container-login100-form-btn">
					<button class="login100-form-btn">Lưu</button>
				</div>
			</form>
		</div>


	</div>
</div>
