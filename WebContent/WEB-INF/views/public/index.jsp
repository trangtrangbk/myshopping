
<%@page import="Utils.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/templates/taglib.jsp"%>
<div class="w3l_banner_nav_right">
	<section class="slider">
		<div class="flexslider">
			<ul class="slides">
				<c:forEach var="objSlide" items="${listSlide }">
					<li><c:if test="${objSlide.status == 1 }">
							<img height="500px" width="700px"
								src="${pageContext.request.contextPath }/fileUpload/${objSlide.picture}" />
						</c:if></li>
				</c:forEach>
			</ul>
		</div>
	</section>

	<!-- flexSlider -->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath }/resources/public/css/flexslider.css"
		type="text/css" media="screen" property="" />
	<script defer
		src="${pageContext.request.contextPath }/resources/public/js/jquery.flexslider.js"></script>
	<script type="text/javascript">
		$(window).load(function() {
			$('.flexslider').flexslider({
				animation : "slide",
				start : function(slider) {
					$('body').removeClass('loading');
				}
			});
		});
	</script>
	<!-- //flexSlider -->
</div>
<div class="clearfix"></div>
</div>
<!-- banner -->

<!-- top-brands -->
<div class="top-brands">
	<div class="container">
		<h3>Sản phẩm mới</h3>
		<div class="agile_top_brands_grids">
			<c:forEach items="${listPro }" var="objPro">
				<div class="col-md-3 top_brand_left" style="padding-bottom: 30px">
					<div class="hover14 column">
						<div class="agile_top_brand_left_grid">
							<div class="agile_top_brand_left_grid_pos">
								<img
									src="${pageContext.request.contextPath }/resources/public/images/offer.png"
									alt=" " class="img-responsive" />
							</div>
							<div class="agile_top_brand_left_grid1">
								<figure>
									<div class="snipcart-item block">
										<div class="snipcart-thumb">
										<c:url var="urlDetail" value="/detail/${StringUtils.makeSlug(objPro.name)}-${objPro.id }"></c:url>
											<a
												href="${urlDetail }">
												<c:set var="picture"
													value="${proDAO.getFistPicture(objPro) }"></c:set> <img
												style="display: block; height: 200px; max-width: 200px;"
												src="${pageContext.request.contextPath }/fileUpload/${picture}" />
											</a>
											<c:choose>
												<c:when test="${objPro.name.length() <= 20 }">
													<a
														href="${urlDetail}"><p>${objPro.name }</p></a>
												</c:when>
												<c:otherwise>
													<a
														href="${urlDetail}"><p>${objPro.name.substring(0,20) }...</p></a>
												</c:otherwise>
											</c:choose>

											<h4>${en.format(objPro.price) }
												Đ <span>Lượt xem : ${objPro.view }</span>
											</h4>
										</div>
										<div class="snipcart-details top_brand_home_details">
											<c:choose>
												<c:when test="${customer == null }">
													<a href="javascript:void(0)" title=""
														onclick="alert('Đăng nhập để mua hàng')">
												</c:when>
												<c:otherwise>
													<a href="javascript:void(0)" title=""
														onclick="addcart(${objPro.id})">
												</c:otherwise>
											</c:choose>

											<img alt="" width="40px" height="40px"
												src="${pageContext.request.contextPath }/resources/public/images/addcart.jpg">
											</a>

										</div>
									</div>
								</figure>
							</div>
						</div>

						<script type="text/javascript">
		function addcart(id){
			alert("Đã thêm vào giỏ hàng");
			$.ajax({
				url: '<%=request.getContextPath()%>/cart/add',
				type: 'POST',
				cache: false,
				data: {id: id},
				success: function(data){
					$('#cart').html(data);
				},
				error: function (){
					alert('Có lỗi xảy ra');
				}
			});
			return false;
		}
	</script>
					</div>
				</div>
			</c:forEach>

			<div class="clearfix"></div>
			<nav class="text-center" aria-label="...">
				<ul class="pagination">
					<c:if test="${page>1 }">
						<li class=""><a
							href="${pageContext.request.contextPath }/${page-1}"
							aria-label="Previous"><span aria-hidden="true">«</span></a></li>
					</c:if>
					<c:forEach begin="1" end="${sumPage }" var="i">
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
			</nav>
		</div>
	</div>
</div>
<!-- //top-brands -->
<!-- fresh-vegetables -->
<div class="fresh-vegetables">
	<div class="container">
		<h3>Phổ biến</h3>
		<div class="agile_top_brands_grids">
			<c:forEach items="${listProPopular }" var="objPro">
				<div class="col-md-3 top_brand_left" style="padding-bottom: 30px">
					<div class="hover14 column">
						<div class="agile_top_brand_left_grid">
							<div class="agile_top_brand_left_grid_pos">
								<img
									src="${pageContext.request.contextPath }/resources/public/images/offer.png"
									alt=" " class="img-responsive" />
							</div>
							<div class="agile_top_brand_left_grid1">
								<figure>
									<div class="snipcart-item block">
										<div class="snipcart-thumb">
											<c:url var="urlDetail" value="/detail/${StringUtils.makeSlug(objPro.name)}-${objPro.id }"></c:url>
											<a
												href="${urlDetail }"><c:set
													var="picture" value="${proDAO.getFistPicture(objPro) }"></c:set>
												<img
												style="display: block; height: 200px; max-width: 200px;"
												src="${pageContext.request.contextPath }/fileUpload/${picture}" /></a>
											<c:choose>
												<c:when test="${objPro.name.length() <= 20 }">
													<a
														href="${urlDetail}"><p>${objPro.name }</p></a>
												</c:when>
												<c:otherwise>
													<a
														href="${urlDetail}"><p>${objPro.name.substring(0,20) }...</p></a>
												</c:otherwise>
											</c:choose>
											<h4>${en.format(objPro.price) }
												Đ <span>Lượt xem : ${objPro.view }</span>
											</h4>
										</div>
										<div class="snipcart-details top_brand_home_details">

											<c:choose>
												<c:when test="${customer == null }">
													<a href="javascript:void(0)" title=""
														onclick="alert('Đăng nhập để mua hàng')">
												</c:when>
												<c:otherwise>
													<a href="javascript:void(0)" title=""
														onclick="addcart(${objPro.id})">
												</c:otherwise>
											</c:choose>
											<img alt="" width="40px" height="40px"
												src="${pageContext.request.contextPath }/resources/public/images/addcart.jpg">
											</a>

										</div>
									</div>
								</figure>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<!-- //fresh-vegetables -->