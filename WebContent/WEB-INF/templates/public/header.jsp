<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<title>Household Store </title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Grocery Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="${pageContext.request.contextPath }/resources/public/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath }/resources/public/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- font-awesome icons -->
<link href="${pageContext.request.contextPath }/resources/public/css/font-awesome.css" rel="stylesheet" type="text/css" media="all" /> 
<!-- //font-awesome icons -->
<!-- js -->
<link href="${pageContext.request.contextPath }/resources/public/css/pgwslider.css" rel="stylesheet" type="text/css" media="all" /> 
<script src="${pageContext.request.contextPath }/resources/public/js/jquery-1.11.1.min.js"></script>
<!-- //js -->
<link href='//fonts.googleapis.com/css?family=Ubuntu:400,300,300italic,400italic,500,500italic,700,700italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/public/js/move-top.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/public/js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
</head>
	<%@include file = "/WEB-INF/templates/taglib.jsp" %>
<body>
<!-- header -->
	<div class="agileits_header">
		<div class="w3l_offers">
			<a href="${pageContext.request.contextPath }/admin">LOG IN TO ADMIN PAGE</a>
		</div>
		<div class="w3l_search">
			<form action="${pageContext.request.contextPath }/search" method="get">
				<input type="text" name="input-data" placeholder="Nhập tên sản phẩm..."  required="true">
				<input type="submit" value=" ">
			</form>
		</div>
		<div class="product_list_header" id = "cart">                
                  
                    <a href="${pageContext.request.contextPath }/checkout"><input type="button" style="color: red;font-weight: bold" value="    ${sessionScope.count }" class="button" /></a>
        
		</div>
		<div class="w3l_header_right">
			<ul>
				<li class="dropdown profile_details_drop">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user" aria-hidden="true"></i><span class="caret"></span></a>
					<div class="mega-dropdown-menu">
						<div class="w3ls_vegetables">
						<c:choose>
							<c:when test="${customer != null }">
								<ul class="dropdown-menu drp-mnu">
								<li><a href="${pageContext.request.contextPath }/customer/profile">${customer.name }</a></li> 
								<li><a href="${pageContext.request.contextPath }/customer/logout">Logout</a></li> 								
							</ul>
							</c:when>
							
							<c:otherwise>
								<ul class="dropdown-menu drp-mnu">
								<li><a href="${pageContext.request.contextPath }/customer/login">Đăng nhập</a></li> 
								<li><a href="${pageContext.request.contextPath }/signup">Đăng kí</a></li>
							</ul>
							</c:otherwise>
						</c:choose>
							
						</div>                  
					</div>	
				</li>
			</ul>
		</div>
		<div class="w3l_header_right1">
			<h2><a href="${pageContext.request.contextPath }/contact">Liên hệ</a></h2>
		</div>
		<div class="clearfix"> </div>
	</div>
<!-- script-for sticky-nav -->
	<script>
	$(document).ready(function() {
		 var navoffeset=$(".agileits_header").offset().top;
		 $(window).scroll(function(){
			var scrollpos=$(window).scrollTop(); 
			if(scrollpos >=navoffeset){
				$(".agileits_header").addClass("fixed");
			}else{
				$(".agileits_header").removeClass("fixed");
			}
		 });
		 
	});
	</script>
<!-- //script-for sticky-nav -->
	<div class="logo_products">
		<div class="container">
			<div class="w3ls_logo_products_left">
				<h1><a href="${pageContext.request.contextPath }"><span>Household</span> Store</a></h1>
			</div>
			

			<div class="w3ls_logo_products_left1">
				<ul class="phone_email">
					<li><i class="fa fa-phone" aria-hidden="true"></i>(+0123) 234 567</li>
					<li><i class="fa fa-envelope-o" aria-hidden="true"></i><a href="mailto:store@grocery.com">store@household.com</a></li>
				</ul>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //header -->