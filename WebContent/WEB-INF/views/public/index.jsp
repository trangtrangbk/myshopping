
<%@page import="Utils.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%@include file="/WEB-INF/templates/taglib.jsp"%>
<!-- /BREADCRUMB -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- ASIDE -->
            <div id="aside" class="col-md-3">
                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">DANH MỤC</h3>
                    <div style="margin-left: 10px">
                        <ul class="nav">
                            <c:forEach var="category" items="${listCategory}">
                                <li>
                                    <a
                                        href="${pageContext.request.contextPath }/cat/${category.cname}-${category.cid}">
                                        <b> ${category.cname}</b>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <!-- /aside Widget -->
                <c:if test="${listProPopular != null}">
                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">Sản phẩm bán chạy</h3>
                        <c:forEach items="${listProPopular}" var="objPro">
                            <div class="product-widget">
                                <div class="product-img">
                                    <c:set var="picture" value="${proDAO.getFistPicture(objPro) }"></c:set>
                                        <img
                                            src="${pageContext.request.contextPath }/fileUpload/${picture}"
                                        alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Laptop</p>
                                    <c:url var="urlDetail"
                                           value="/detail/${StringUtils.makeSlug(objPro.name)}-${objPro.id }"></c:url>
                                        <h3 class="product-name">
                                            <a href="${urlDetail}">${objPro.name}</a>
                                    </h3>
                                    <h4 class="product-price">${en.format(objPro.price)}đ</h4>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </c:if>
                <!-- /aside Widget -->
            </div>
            <!-- /ASIDE -->

            <!-- STORE -->
            <div id="store"class="col-md-9">
                <!-- store top filter -->
                <div class="row"  >     
                    <!-- /store top filter -->
                    <script language="javascript">
                        // Hàm xử lý khi thẻ select thay đổi giá trị được chọn
                        // obj là tham số truyền vào và cũng chính là thẻ select
                        function priceChanged(obj)
                        {
                            var value = obj.value;
                            var url = '<%=request.getContextPath()%>';
                            window.location.href = url + "/sort?status=" + value;

                        }

                    </script>
                    <!-- store products -->
                    <div class="col-md-12 col-xs-12">
                        <div class="home-wrap" >
                            <!-- home slick -->                           
                            <div class="slideshow-container">
                                <c:forEach var="objSlide" items="${listSlide }">
                                    <div class="mySlides fade1">
                                        <img src="${pageContext.request.contextPath }/fileUpload/${objSlide.picture}" width="100%" height="100px">
                                    </div>
                                </c:forEach>
                                <div style="text-align:center">
                                    <span class="dot" onclick="currentSlide(0)"></span> 
                                    <span class="dot" onclick="currentSlide(1)"></span> 
                                    <span class="dot" onclick="currentSlide(2)"></span>                          
                                </div> 
                            </div>
                            <!-- /home slick -->
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-xs-6">
                        <div class="store-filter clearfix">
                            <div class="store-sort">
                                <label> <b style="color:#007bff">Sắp xếp:</b> <select class="input-select" id="price"
                                                                                      onchange="priceChanged(this)">
                                        <option value="0">Mới nhất</option>
                                        <option value="1">Cũ nhất</option>
                                        <option value="2">Giá cao đến thấp</option>
                                        <option value="3">Giá thấp đến cao</option>
                                    </select>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- product -->
                    <c:forEach items="${listPro}" var="objPro">
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <c:url var="urlDetail"
                                       value="/detail/${StringUtils.makeSlug(objPro.name)}-${objPro.id }"></c:url>
                                    <div class="product-img">
                                    <c:set var="picture" value="${proDAO.getFistPicture(objPro) }"></c:set>
                                        <img style="display: block; height: 200px; max-width: 200px;"
                                             src="${pageContext.request.contextPath }/fileUpload/${picture}"
                                        alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Laptop</p>
                                    <h3 class="product-name">
                                        <a href="${urlDetail}"> 
                                            <c:choose>
                                                <c:when test="${objPro.name.length() > 25 }">
                                                    <c:set var="name" value="${objPro.name.substring(0,25)}"></c:set>
                                                    <p>${name }...</p>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:set var="name" value="${objPro.name }"></c:set>
                                                    <p>${name }</p>
                                                </c:otherwise>
                                            </c:choose>

                                        </a>
                                    </h3>
                                    <h4 class="product-price">${en.format(objPro.price)}đ</h4>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn" onclick="addcart(${objPro.id})">
                                        <i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng
                                    </button>
                                </div>
                            </div>

                        </div>
                    </c:forEach>
                    <!-- /product -->
                    <div class="clearfix visible-lg visible-md visible-sm visible-xs"></div>
                </div>
                <!-- /store products -->

                <!-- store bottom filter -->
                <div class="store-filter clearfix">
                    <ul class="store-pagination">
                        <c:if test="${page>1 }">
                            <li class=""><a
                                    href="${pageContext.request.contextPath }/${page-1}"
                                    aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                            </c:if>
                            <c:forEach begin="1" end="${sumPage}" var="i">
                                <c:set var="active" value="" />
                                <c:choose>
                                    <c:when test="${i == page}">
                                        <c:set var="active" value="active" />
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="active" value="" />
                                    </c:otherwise>
                                </c:choose>
                            <li class="${active }"><a
                                    href="${pageContext.request.contextPath }/${i}">${i} </a></li>
                            </c:forEach>
                            <c:if test="${page<sumPage }">
                            <li><a href="${pageContext.request.contextPath }/${page+1}"
                                   aria-label="Next"><span aria-hidden="true">»</span></a></li>
                            </c:if>
                    </ul>
                </div>
                <!-- /store bottom filter -->
            </div>
            <!-- /STORE -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->


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
<script type="text/javascript">
    //khai báo biến slideIndex đại diện cho slide hiện tại
    var slideIndex;
    // KHai bào hàm hiển thị slide
    function showSlides() {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }

        slides[slideIndex].style.display = "block";
        dots[slideIndex].className += " active";
        //chuyển đến slide tiếp theo
        slideIndex++;
        //nếu đang ở slide cuối cùng thì chuyển về slide đầu
        if (slideIndex > slides.length - 1) {
            slideIndex = 0
        }
        //tự động chuyển đổi slide sau 5s
        setTimeout(showSlides, 5000);
    }
    //mặc định hiển thị slide đầu tiên 
    showSlides(slideIndex = 0);


    function currentSlide(n) {
        showSlides(slideIndex = n);
    }
</script>