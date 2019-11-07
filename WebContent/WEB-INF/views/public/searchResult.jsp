<%@page import="Utils.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="w3l_banner_nav_right">
			<div class="w3ls_w3l_banner_nav_right_grid w3ls_w3l_banner_nav_right_grid_sub">
				<h3 class="w3l_fruit">Search</h3>

				<div class="w3ls_w3l_banner_nav_right_grid1 w3ls_w3l_banner_nav_right_grid1_veg">
				<c:forEach items="${listPro }" var="objPro">
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
						<div class="clearfix"> </div>
				<nav class="text-center" aria-label="...">
					   <ul class="pagination">
					   <c:if test="${page>1 }">
					      <li class=""><a href="${pageContext.request.contextPath }/search/${date}/${page-1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li> 
					      </c:if>
					      <c:forEach begin="1" end="${sumPage }"  var="i">
					      	<c:set var="active" value="" />
					      	<c:choose>
					      		<c:when test="${i == page}">
					      			<c:set var="active" value="active" />
					      		</c:when>
					      		<c:otherwise>
					      			<c:set var="active" value="" />
					      		</c:otherwise>
					      	</c:choose>
					      	<li class="${active }"><a href="${pageContext.request.contextPath }/search/${data}/${i}">${i} </a></li>
					     </c:forEach>
					     <c:if test="${page<sumPage }">
					       <li><a href="${pageContext.request.contextPath }/search/${data}/${page+1}" aria-label="Next"><span aria-hidden="true">»</span></a></li> 
					  	</c:if>
					   </ul>
					</nav>
				</div>
			</div>
		</div>
		<script type="text/javascript">
		function addcart(id){
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