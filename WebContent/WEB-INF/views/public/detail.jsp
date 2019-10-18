<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	<%@page import="Utils.StringUtils"%>
<%@include file="/WEB-INF/templates/taglib.jsp"%>
<div class="w3l_banner_nav_right">
	<div class="w3l_banner_nav_right_banner3">
		<h3>
			Best Deals For New Products<span class="blink_me"></span>
		</h3>
	</div>
	<div class="agileinfo_single">
		<h2 itemprop="alternateName">${objPro.name }</h2>
		<div id="product_section_1">
			<div class="collection-main collection-detail">
				<div class="collection-photo" id = "picture">
					<c:set var="picture" value="${listName[0] }"></c:set>
					<a id="zoom1" href="${pageContext.request.contextPath }/fileUpload/${picture}"
						class="cloud-zoom"
						rel="${pageContext.request.contextPath }/fileUpload/${picture}">
						<img
						src="${pageContext.request.contextPath }/fileUpload/${picture}" />
					</a>
				</div>
				<div class="collection-photoThumbs">
					<ul class='product_detail_thumb_list'>
						<c:forEach items="${listName }" var="name">
							<li><a href="javascript:void(0)" title="" onclick="picture('${name}')">
									<img
									src="${pageContext.request.contextPath }/fileUpload/${name}"
									width="80px" height="50px" />
							</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			
		</div>
		<div id="product_section_2">
			<div id="product_summary_text">
				<div id="id1" style="overflow-y: auto; height: 500px; width: 500px;">


					<span itemprop="offers" itemscope
						itemtype="http://schema.org/Offer"> <font
						style="color: #cf7600; font-size: inherit; font-weight: bold"
						itemprop="price"> ${en.format(objPro.price) } Đ </font><br />
					</span> <span itemprop="productID"> <b>Mã sản phẩm: </b>${objPro.id }<br />
					</span> <span itemprop="productID"> <b>Lượt xem: </b>${objPro.view }<br />
					</span> <span><b>Mô tả:</b> <br /> ${objPro.description }<br /></span>

					<c:choose>
						<c:when test="${objPro.status == 1 }">
							<span> <font style="color: #cf7600; font-size: inherit;">Còn
									hàng<br />
							</font></span>
						</c:when>
						<c:otherwise>
							<span> <font style="color: #cf7600; font-size: inherit;">Hết
									hàng<br />
							</font></span>
						</c:otherwise>
					</c:choose>




					</a> <br />
				
							<c:choose>
												<c:when test="${customer == null }">
												<a href="javascript:void(0)" title="" onclick="alert('Đăng nhập để mua hàng')">
												</c:when>
												<c:otherwise>
												<a href="javascript:void(0)" title="" onclick="addcart(${objPro.id})">
												</c:otherwise>
											</c:choose> THÊM VÀO GIỎ HÀNG </a>

					
				
				</div>

			</div>
		</div>
	</div><div class="clearfix"></div>
	<c:if test="${objPro.detail != ''}">
	<div>
	<span itemprop="offers" itemscope
						itemtype="http://schema.org/Offer"> <font
						style="color: #cf7600; font-size: inherit; font-weight: bold"
						itemprop="price"> CHI TIẾT </font><br />
					</span>
					<p>${objPro.detail}</p>
	</div>
	</c:if>
</div>
<div class="clearfix"></div>
<!-- //banner -->
<!-- brands -->
<div
	class="w3ls_w3l_banner_nav_right_grid w3ls_w3l_banner_nav_right_grid_popular">
	<div class="container">
		<h3>Sản phẩm liên quan</h3>
		<div class="w3ls_w3l_banner_nav_right_grid1">
			<c:forEach items="${listRelated }" var="objRel">
				<div class="col-md-3 w3ls_w3l_banner_left" style="padding-bottom: 30px">
					<div class="hover14 column">
						<div
							class="agile_top_brand_left_grid w3l_agile_top_brand_left_grid">
							<div class="agile_top_brand_left_grid_pos"></div>
							<div class="agile_top_brand_left_grid1">
								<figure>
									<div class="snipcart-item block">
										<div class="snipcart-thumb">
											<c:url var="urlDetail" value="/detail/${StringUtils.makeSlug(objRel.name)}-${objRel.id }"></c:url>
											<a
												href="${urlDetail}">
												<c:set var="picture"
													value="${proDAO.getFistPicture(objRel) }"></c:set> <img
												style="display: block; height: 200px; max-width: 200px;"
												src="${pageContext.request.contextPath }/fileUpload/${picture}" />
											</a>
											<c:choose>
										<c:when test="${objRel.name.length() <= 20 }">
											<a href="${urlDetail}"><p>${objRel.name }</p></a>
										</c:when>
										<c:otherwise>
											<a href="${urlDetail}"><p>${objRel.name.substring(0,20) }...</p></a>
										</c:otherwise>
									</c:choose>
											<h4>${en.format(objRel.price) }
												Đ <span>Lượt xem: ${objRel.view }</span>
											</h4>
										</div>
										<div class="snipcart-details">
											<div class="snipcart-details top_brand_home_details">

											<c:choose>
												<c:when test="${customer == null }">
												<a href="javascript:void(0)" title="" onclick="alert('Đăng nhập để mua hàng')">
												</c:when>
												<c:otherwise>
												<a href="javascript:void(0)" title="" onclick="addcart(${objRel.id})">
												</c:otherwise>
											</c:choose><img alt=""
													width="40px" height="40px"
													src="${pageContext.request.contextPath }/resources/public/images/addcart.jpg">
												</a>

											</div>
										</div>
									</div>
								</figure>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			<div class="clearfix"></div>
		</div>

		<h3>Danh mục khác</h3>
		<div class="w3ls_w3l_banner_nav_right_grid1">
			<c:forEach items="${listOther}" var="objOther">
				<div class="col-md-3 w3ls_w3l_banner_left" style="padding-bottom: 30px">
					<div class="hover14 column">
						<div
							class="agile_top_brand_left_grid w3l_agile_top_brand_left_grid">
							<div class="agile_top_brand_left_grid_pos"></div>
							<div class="agile_top_brand_left_grid1">
								<figure>
									<div class="snipcart-item block">
										<div class="snipcart-thumb">
											<c:url var="urlDetail" value="/detail/${StringUtils.makeSlug(objOther.name)}-${objOther.id }"></c:url>
											<a
												href="${urlDetail}"><c:set
													var="picture" value="${proDAO.getFistPicture(objOther) }"></c:set>
												<img style="display: block; height: 200px; max-width: 200px;"
												src="${pageContext.request.contextPath }/fileUpload/${picture}" /></a>
										<c:choose>
										<c:when test="${objOther.name.length() <= 20 }">
											<a href="${urlDetail}"><p>${objOther.name }</p></a>
										</c:when>
										<c:otherwise>
											<a href="${urlDetail}"><p>${objOther.name.substring(0,20) }...</p></a>
										</c:otherwise>
									</c:choose>
											<h4>${en.format(objOther.price) }
												Đ <span>Lượt xem: ${objOther.view }</span>
											</h4>
										</div>
										<div class="snipcart-details top_brand_home_details">

											
											<c:choose>
												<c:when test="${customer == null }">
												<a href="javascript:void(0)" title="" onclick="alert('Đăng nhập để mua hàng')">
												</c:when>
												<c:otherwise>
												<a href="javascript:void(0)" title="" onclick="addcart(${objOther.id})">
												</c:otherwise>
											</c:choose><img alt=""
												width="40px" height="40px"
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
	</div>
</div>
<!-- //brands -->
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
		
		function picture(name){
			$.ajax({
				url: '<%=request.getContextPath()%>/detail/active',
				type: 'POST',
				cache: false,
				data: {name: name},
				success: function(data){
					$('#picture').html(data);
				},
				error: function (){
					alert('Có lỗi xảy ra');
				}
			});
			return false;
		}
	</script>