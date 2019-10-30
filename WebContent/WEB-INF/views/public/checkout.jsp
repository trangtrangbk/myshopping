<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>

<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <h3 class="breadcrumb-header">Giỏ Hàng</h3>
                <ul class="breadcrumb-tree">
                    <li><a href="#">Trang Chủ</a></li>
                    <li class="active">Giỏ Hàng</li>
                </ul>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="cart-title mt-50" style="margin-top: 5px !important;">
                <h1>Giỏ Hàng</h1>
            </div>
        </div>
        <div class="row">
            <div class="cart-table-area section-padding-100" style="-webkit-box-flex: 0;
                 -ms-flex: 0 0 100%;
                 flex: 0 0 100%;
                 width: 100%;
                 max-width: 100%;
                 padding-top: 0;
                 position: relative;
                 z-index: 1;">
                <div class="container-fluid" style="width: 100%;
                     padding-right: 15px;
                     padding-left: 15px;
                     margin-right: auto;
                     margin-left: auto;
                     font-family: 'helveticaneuemedium';
                     font-size: 16px;">
                    <div class="row">
                        <div class="col-12 col-lg-8">
                            <div class="cart-table clearfix">
                                <table class="table table-responsive">
                                    <thead>
                                        <tr style="vertical-align: inherit;
                                            border-color: inherit; background-color: #E8F1F2;">
                                            <th></th>
                                            <th>Name</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Total</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <c:forEach var="cart" items="${myCartItems}">
                                            <tr class="cart_item">
                                                <td class="cart_product_img">
                                                    <c:set var="picture" value="${cart.getProduct().getPicture()[0] }"></c:set>
                                                    <a href="#"><img src="${pageContext.request.contextPath }/resources/public/img/${picture}"  style="width:100px;height:100px" alt="Product"></a>
                                                </td>
                                                <td class="cart_product_desc">
                                                    <h5>${cart.product.name}</h5>
                                                </td>
                                                <td class="price">
                                                    <span>${en.format(cart.product.price) }<sup>đ</sup></span>
                                                </td>
                                                <td class="qty" >
                                                    <div class="qty-btn d-flex" style="display: flex!important;background-color: #E8F1F2; width: 120px;height: 30px;text-content: center">

                                                        <div class="product_quantity">
                                                            <div class="input-number" >
                                                                <input type="number" id = "quatity-${cart.product.id}" value="${cart.quatity}">
                                                                <span class="qty-up">+</span>
                                                                <span class="qty-down">-</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="price">
                                                    <span>${en.format(cart.quatity * cart.product.price) }<sup>đ</sup></span>
                                                </td>
                                                <td class="cart_product_img">
                                                    
                                                    <a href="javascript:void(0)" title="" onclick="updatequatity(${cart.product.id})">
                                                    <button class="btn btn-warning"
                                                            id="btupdate"
                                                            ><i class="fa fa-refresh"></i></button></a>
                                                    <a href="${pageContext.request.contextPath }/cart/remove/${cart.product.id}">
                                                    <button class="btn btn-danger"
                                                            ><i class="fa fa-trash"></i></button></a>
                                                </td>

                                            </tr>
                                        </c:forEach>
                                    </tbody>

                                </table>
                            </div>
                        </div>
                        <div class="col-12 col-lg-4">
                            <div class="cart-summary" style="background-color: #f5f7fa;
                                 margin-top: 0px;
                                 position: relative;
                                 z-index: 1;
                                 padding: 30px 20px;
                                 font-family:'helveticaneuemedium';
                                 font-size: 16px;">
                                <h2>Tổng Giá Giỏ Hàng</h2>
                                <ul class="summary-table" style="    display: block;
                                    list-style-type: disc;
                                    margin-block-start: 1em;
                                    margin-block-end: 1em;
                                    margin-inline-start: 0px;
                                    margin-inline-end: 0px;
                                    padding-inline-start: 40px;">
                                    <li><span><strong>Giá Ban Đầu:</strong></span> <span> ${en.format(myCartTotal)}<sup>đ</sup></span></li>
                                    <li><span><strong>Phí Vận Chuyển:</strong></span> <span>Free</span></li>
                                    <li><span><strong>Tổng Giá:</strong></span> <span> ${en.format(myCartTotal)}<sup>đ</sup></span></li>
                                </ul>

                                <div class="cart-btn mt-100">
                                    <a href="./thanhtoan" class="btn amado-btn w-100" style="    display: inline-block;
                                       min-width: 160px;
                                       height: 55px;
                                       color: #ffffff;
                                       border: none;
                                       border-radius: 0;
                                       padding: 0 7px;
                                       font-size: 18px;
                                       line-height: 56px;
                                       background-color: #fbb710;
                                       font-weight: 400;
                                       width: 100%!important;
                                       text-align: center;
                                       white-space: nowrap;
                                       vertical-align: middle;">Checkout</a>
                                </div>

                                <div class="cart-btn mt-100">
                                    <a href="./" class="btn amado-btn w-100" style="    display: inline-block;
                                       min-width: 160px;
                                       height: 55px;
                                       color: #ffffff;
                                       border: none;
                                       border-radius: 0;
                                       padding: 0 7px;
                                       font-size: 18px;
                                       line-height: 56px;
                                       background-color: #761c19;
                                       font-weight: 400;
                                       width: 100%!important;
                                       text-align: center;
                                       white-space: nowrap;
                                       vertical-align: middle;">Continue Shopping</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->
<script type="text/javascript">
    function updatequatity(id){
        var tmp = "#quatity-"+id;
        var qty = $(tmp).val();
        window.location.href = "./cart/sub?id=" + id + "&qty=" + qty;
    }
</script>

<script type="text/javascript">
    function deleteproduct(id) {
        var tmp = "#quatity-" + id;
        $.ajax({
            url: '<%=request.getContextPath()%>/cart/addquatity',
            type: 'POST',
            cache: false,
            data: {id: id},
            success: function (data) {
                $(tmp).html(data);
            },
            error: function () {
                alert('Có lỗi xảy ra');
            }
        });
        return false;
    }
</script>