
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

                <!-- /aside Widget -->

                <!-- aside Widget -->
                <div class="aside">	
                    <h3 class="aside-title">Hãng Máy Tính </h3>
                    <div>
                        <c:forEach var="category" items="${listCategory}">
                            <div>
                                <a href="${pageContext.request.contextPath }/cat/${category.cname}-${category.cid}">
                                    <label for="brand-1">
                                        <span>
                                            ${category.cname}</span>
                                    </label>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- /aside Widget -->
                <c:if test="${listProPopular != null}">
                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">Sản phẩm bán chạy </h3>
                        <c:forEach items="${listProPopular}" var="objPro">
                            <div class="product-widget">
                                <div class="product-img">
                                    <c:set var="picture" value="${proDAO.getFistPicture(objPro) }"></c:set>
                                    <img src="${pageContext.request.contextPath }/fileUpload/${picture}" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Laptop</p>
                                    <c:url var="urlDetail" value="/detail/${StringUtils.makeSlug(objPro.name)}-${objPro.id }"></c:url>
                                    <h3 class="product-name"><a href="${urlDetail}">${objPro.name}</a></h3>
                                    <h4 class="product-price">${en.format(objPro.price)}đ </h4>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </c:if>
                <!-- /aside Widget -->
            </div>
            <!-- /ASIDE -->

            <!-- STORE -->
            <div id="store" class="col-md-9">
                <!-- store top filter -->
                <div class="store-filter clearfix">
                    <div class="store-sort">
                        <label>
                            Sắp xếp:
                        </label>
                        <select class="input-select" onchange="priceChanged(this)">
                            <option hidden>Chọn kiểu lọc</option>
                            <option value="0">Giá cao đến thấp</option>
                            <option value="1">Giá thấp đến cao</option>
                        </select>

                    </div>							
                </div>
                <!-- /store top filter -->
                
                <script language="javascript">
                    // Hàm xử lý khi thẻ select thay đổi giá trị được chọn
                    // obj là tham số truyền vào và cũng chính là thẻ select
                    function priceChanged(obj)
                    {
                        var value = obj.value;
                        alert("sap xep " + value);
                        var url = '<%=request.getContextPath()%>';
                        window.location.href = url+"/sort?status=" + value;

                    }

                </script>
                <!-- store products -->
                <div class="row">
                    <!-- product -->
                    <div class="form12234">
                        <c:forEach items="${listPro}" var="objPro">

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
                                        <button class="add-to-cart-btn" onclick="location.href = '<c:url value="/cart/add?id=${objPro.id}"/>'"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>

                            </div>
                        </c:forEach>
                        <!-- /product -->

                    </div>
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

<!-- NEWSLETTER -->
<div id="newsletter" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">

            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>