
<%@page import="Utils.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/templates/taglib.jsp"%>
<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<h3 class="breadcrumb-header">Tài khoản</h3>
						<ul class="breadcrumb-tree">
							<li><a href="${pageContext.request.contextPath }/customer/profile">Thông tin</a></li>
							<li> <a href="${pageContext.request.contextPath }/customer/edit">Sửa thông tin</a></li>
							<li class="active">Xem lịch sử</li>
						</ul>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>

		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<c:set var="i" value="0"></c:set>
				<div class="col-md-12">
				<c:forEach items="${listOrderCustomer }" var="order">
				<c:set var="i" value="${i+1 }"></c:set>
				<c:set var="orderHistory" value = "${orderDAO.getItemById(order) }"></c:set>
				<c:set var = "cartHistory" value ="${cartOrderDAO.getItemsByOrderId(order) }" ></c:set>
						<div class="col-md-12 order-details">
						<div class="section-title text-center">
							<h3 class="title">ĐƠN HÀNG ${i}</h3>
						</div>
						<div class="order-summary">
							<div class="order-col">
								<div><strong>Thời gian</strong></div>
								<div>${orderHistory.date}</div>
							</div>
							<div class="order-col">
								<div><strong>Sản phẩm</strong></div>
								<div><strong>Giá</strong></div>
							</div>
							<div class="order-product">
								<c:forEach items = "${cartHistory }"  var = "cart">
								<c:set var = "product" value ="${proDAO.getItem(cart.pro_id) }" ></c:set>
								<div class="order-col">
									<div>${product.name } x ${cart.quatity }</div>
									<div>${en.format(product.price) } vnd x ${cart.quatity } = ${en.format(product.price*cart.quatity) } vnd</div>
								</div>
								</c:forEach>
							</div>
							</div>
							<div class="order-summary">
							<div class="order-col">
								<div><strong>Giảm giá</strong></div>
								<div>-${orderHistory.giftcode}%</div>
							</div>
							<div class="order-col">
								<div><strong>TỔNG</strong></div>
								<div><strong class="order-total">${en.format(orderHistory.bill)} vnd</strong></div>
							</div>
							</div>																	
					</div>
					</c:forEach>
					</div>
					</div>
			</div>	