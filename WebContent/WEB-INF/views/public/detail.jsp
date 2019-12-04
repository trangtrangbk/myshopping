<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="Utils.StringUtils"%>
<%@include file="/WEB-INF/templates/taglib.jsp"%>
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- Product main img -->
            <div class="col-md-5 col-md-push-2">
                <div id="product-main-img">
                    <c:forEach var="picture" items="${objPro.getPicture()}">
                        <div class="product-preview" style="height:auto">
                            <img src="${pageContext.request.contextPath }/fileUpload/${picture}" alt="">
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- /Product main img -->

            <!-- Product thumb imgs -->
            <div class="col-md-2  col-md-pull-5">
                <div id="product-imgs">
                    <c:forEach var="picture" items="${objPro.getPicture()}">
                        <div class="product-preview">
                            <img src="${pageContext.request.contextPath }/fileUpload/${picture}" alt="">
                        </div>
                    </c:forEach>                  
                </div>
            </div>
            <!-- /Product thumb imgs -->

            <!-- Product details -->
            <div class="col-md-5">
                <div class="product-details">
                    <h2 class="product-name">${objPro.name}</h2>                    
                    <div>
                        <h3 class="product-price">${en.format(objPro.price)}đ</h3>
                        <span class="product-available">CÒN HÀNG</span>
                    </div>
                    <h4 class="footer-title">THÔNG SỐ</h4>
                    <p>${objPro.name}</p>
                    <P>CPU: ${objPro.cpu}</P>
                    <P>RAM: ${objPro.ram}</P>
                    <P>HDD: ${objPro.hdd}</P>
                    <P>VGA: ${objPro.vga}</P>
                    <P>LCD: ${objPro.lcd}</P>
                    <P>PIN: ${objPro.pin}</P>
                    <P>OS: ${objPro.os}</P>
                    <P>MÀU: ${objPro.color}</P>
                    <div class="add-to-cart"> 
                        <button class="add-to-cart-btn" >
                        <a href="javascript:void(0)" title="" onclick="addcart(${objPro.id})">
                        <i class="fa fa-shopping-cart"></i> THÊM VÀO GIỎ HÀNG
                        </a>
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div id="product-tab">
                    <!-- product tab nav -->
                    <ul class="tab-nav">
                        <li class="active"><a data-toggle="tab" href="#tab1">MÔ TẢ</a></li>
                        <li><a data-toggle="tab" href="#tab2">CHI TIẾT</a></li>
                    </ul>
                    <div class="tab-content">
                        <!-- tab1  -->
                        <div id="tab1" class="tab-pane fade in active">
                            <div class="row">
                                <div class="col-md-12">
                                <p>${objPro.description }</p>
                                </div>
                            </div>
                        </div>
                        <!-- /tab1  -->

                        <!-- tab2  -->
                        <div id="tab2" class="tab-pane fade in">
                            <div class="row">
                                <div class="col-md-12">
                                ${objPro.detail }
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- Section -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <div class="col-md-12">
                <div class="section-title text-center">
                    <h3 class="title">Sản phẩm liên quan</h3>
                </div>
            </div>

         
            <!-- product -->
                    <c:forEach items="${listRelated}" var="objPro">
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <c:url var="urlDetail" value="/detail/${StringUtils.makeSlug(objPro.name)}-${objPro.id }"></c:url>
                                    <div class="product-img">
                                    <c:set var="picture" value="${proDAO.getFistPicture(objPro) }"></c:set>
                                    <img style="display: block; height: 200px; max-width: 200px;" src="${pageContext.request.contextPath }/fileUpload/${picture}" alt="">
                                    <div class="product-label">
                                        <span class="sale">-30%</span>
                                        <span class="new">NEW</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Laptop</p>
                                    <h3 class="product-name"><a href="${urlDetail}"><p>${objPro.name }</p></a></h3>
                                    <h4 class="product-price">${en.format(objPro.price)}đ </h4>                      
                                </div>
                                <div class="add-to-cart">
                                   <button class="add-to-cart-btn"										>
										<a href="javascript:void(0)" title=""
														onclick="addcart(${objPro.id})">
										<i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng
										</a>
									</button>
                                </div>
                            </div>
                            <script type="text/javascript">
                                function addcart(id) {                                   
                                    $.ajax({
                                        url: '<%=request.getContextPath()%>/cart/add',
                                        type: 'POST',
                                        cache: false,
                                        data: {id: id},
                                        success: function (data) {
                                            $('#cart').html(data);
                                        },
                                        error: function () {
                                            alert('Có lỗi xảy ra');
                                        }
                                    });
                                    return false;
                                }
                            </script>
                        </div>
                    </c:forEach>
            <div class="clearfix visible-sm visible-xs"></div>
        </div>
    </div>
</div>