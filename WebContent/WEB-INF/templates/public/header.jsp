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
                                    <input class="input" placeholder="Tìm kiếm">
                                    <button class="search-btn">Tìm kiếm</button>
                                </form>
                            </div>
                        </div>
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">


                                <div class="dropdown" id="cart">
                                    <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Giỏ hàng</span>
                                        <div class="qty">${count}</div>
                                    </a>
                                    <div class="cart-dropdown">
                                        <div class="cart-list">
                                            <c:forEach var="cart" items="${myCartItems}">
                                                <div class="product-widget">
                                                    <div class="product-img">
                                                        <c:set var="picture" value="${cart.getProduct().getPicture()[0] }"></c:set>
                                                        <img src="${pageContext.request.contextPath }/fileUpload/${picture}" alt="">
                                                    </div>
                                                    <div class="product-body">
                                                        <h3 class="product-name"><a href="#">${cart.product.name}</a></h3>
                                                        <h4 class="product-price"><span class="qty">${cart.quatity}</span>${en.format(cart.quatity * cart.product.price) }</h4>
                                                    </div>

                                                </div>
                                            </c:forEach>

                                            <div class="cart-summary">
                                                <h5>TỔNG: ${en.format(myCartTotal)} VND</h5>
                                            </div>
                                            <div class="cart-btns">
                                                <a href="${pageContext.request.contextPath }/checkout1"><i class="fa fa-arrow-circle-right">Xem giỏ hàng</i></a>
                                                <a href="javascript:void(0)" title="" onclick="checkcart(${count})">  <i class="fa fa-arrow-circle-right">Thanh toán</i></a> 

                                            </div>
                                        </div>
                                    </div>
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
        <script type="text/javascript">
            function checkcart(count) {
                if(count == 0){
                    alert("Quý khách chưa có sản phẩm nào trong giỏ hàng!");
                }else{
                    window.location.href = "${pageContext.request.contextPath }/checkout-step2";
                }
                
            }
        </script>