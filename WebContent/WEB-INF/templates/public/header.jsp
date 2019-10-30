<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<style>
.header{
	z-index: 100;
}
.sticky {
	position: fixed;
	top: 0;
	width: 100%
}

</style>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MegaT</title>
<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/public/css/bootstrap.min.css" />

<!-- Slick -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/public/css/slick.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/public/css/slick-theme.css" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/public/css/nouislider.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/public/css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/public/css/style.css" />
</head>
<%@include file = "/WEB-INF/templates/taglib.jsp" %>
<body>
	<!-- HEADER -->
	<!-- HEADER -->
	<header class="header" id="myHeader">
		<!-- TOP HEADER -->
		<div id="top-header">
			<div class="container">
				<ul class="header-links pull-left">
					<li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
					<li><a href="mailto:tranginspirit78@gmail.com"><i class="fa fa-envelope-o"></i>
							tranginspirit78@gmail.com</a></li>
					<li><a href="#"><i class="fa fa-map-marker"></i> 54 Tôn
							Đức Thắng, Liên Chiểu, Đà Nẵng</a></li>
				</ul>
				<ul class="header-links pull-right">
				<c:choose>
					<c:when test="${customer !=null }">
					
					<li><a href="${pageContext.request.contextPath }/customer/profile"><i class="fa fa-user-o"></i>${customer.name }</a></li>
					<li><a href="${pageContext.request.contextPath }/customer/logout"><i class="fa  fa-sign-out"></i>Đăng xuất</a></li>
					</c:when>
					<c:otherwise>
					<li><a href="${pageContext.request.contextPath }/customer/login"><i class="fa fa-user-o"></i>Đăng nhập</a></li>
					<li><a href="${pageContext.request.contextPath }/signup"><i class="fa fa-user-o"></i>Đăng kí</a></li>
					</c:otherwise>
				</c:choose>								
				</ul>
			</div>
		</div>
		<!-- /TOP HEADER -->

		<!-- MAIN HEADER -->
		<div id="header">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- LOGO -->
					<div class="col-md-3">
						<div class="header-logo">
							<a href="#" class="logo"> <img src="./img/logo.png" alt="">
							</a>
						</div>
					</div>
					<!-- /LOGO -->

					<!-- SEARCH BAR -->
					<div class="col-md-6">
						<div class="header-search">
							<form>
								<select class="input-select">
									<option value="0">Tất cả</option>
									<option value="1">DELL</option>
									<option value="1">ASUS</option>
									<option value="1">ACER</option>
								</select> <input class="input" placeholder="Tìm kiếm">
								<button class="search-btn">Tìm kiếm</button>
							</form>
						</div>
					</div>
					<!-- /SEARCH BAR -->

					<!-- ACCOUNT -->
					<div class="col-md-3 clearfix">
						<div class="header-ctn">

							<!-- Cart -->
							<div class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown"
									aria-expanded="true"> <i class="fa fa-shopping-cart"></i> <span>Giỏ
										hàng</span>
									<div class="qty">3</div>
								</a>
								<div class="cart-dropdown">
									<div class="cart-list">
										<div class="product-widget">
											<div class="product-img">
												<img src="./img/product01.png" alt="">
											</div>
											<div class="product-body">
												<h3 class="product-name">
													<a href="#">ASUS VivoBook S14</a>
												</h3>
												<h4 class="product-price">
													<span class="qty">1x</span>12.000.000
												</h4>
											</div>
											<button class="delete">
												<i class="fa fa-close"></i>
											</button>
										</div>

										<div class="product-widget">
											<div class="product-img">
												<img src="./img/product02.png" alt="">
											</div>
											<div class="product-body">
												<h3 class="product-name">
													<a href="#">ASUS VivoBook S14</a>
												</h3>
												<h4 class="product-price">
													<span class="qty">1x</span>12.000.000
												</h4>
											</div>
											<button class="delete">
												<i class="fa fa-close"></i>
											</button>
										</div>
									</div>
									<div class="cart-summary">
										<h5>TỔNG: 14.000.000 VND</h5>
									</div>
									<div class="cart-btns">
										<a href="#">Xem giỏ hàng</a> <a href="#">Thanh toán <i
											class="fa fa-arrow-circle-right"></i></a>
									</div>
								</div>
							</div>
							<!-- /Cart -->

							<!-- Menu Toogle -->
							<!-- <div class="menu-toggle">
									<a href="#">
										<i class="fa fa-bars"></i>
										<span>Menu</span>
									</a>
								</div> -->
							<!-- /Menu Toogle -->
						</div>
					</div>
					<!-- /ACCOUNT -->
				</div>
				<!-- row -->
			</div>
			<!-- container -->
		</div>
		<!-- /MAIN HEADER -->
	</header>
	<!-- /HEADER -->