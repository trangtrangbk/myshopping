
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
				<c:forEach items="${listOrderCustomer }" var="order">
				<c:set var="i" value="${i+1 }"></c:set>
				<c:set var="orderHistory" value = "${orderDAO.getItemById(order) }"></c:set>
				<c:set var = "cartHistory" value ="${cartOrderDAO.getItemsByOrderId(order) }" ></c:set>
					<div class="col-md-12">
						<div class="col-md-12 order-details">
						<div class="section-title text-center">
							<h3 class="title">Order ${i}</h3>
						</div>
						<div class="order-summary">
							<div class="order-col">
								<div><strong>TIME</strong></div>
								<div>${orderHistory.date}</div>
							</div>
							<div class="order-col">
								<div><strong>PRODUCT</strong></div>
								<div><strong>TOTAL</strong></div>
							</div>
							<div class="order-products">
								<c:forEach items = "${cartHistory }"  var = "cart">
								<c:set var = "product" value ="${proDAO.getItem(cart.pro_id) }" ></c:set>
								<div class="order-col">
									<div>${product.name } x ${cart.quatity }</div>
									<div>${product.price } x ${cart.quatity } = ${product.price*cart.quatity }</div>
									</c:forEach>
								</div>
							</div>
							<div class="order-col">
								<div>Giftcode</div>
								<div><strong>-${orderHistory.giftcode}%</strong></div>
							</div>
							<div class="order-col">
								<div><strong>TOTAL</strong></div>
								<div><strong class="order-total">${orderHistory.bill}</strong></div>
							</div>
						</div>												
					</div>
					</div>
					</c:forEach>
			</div>	
		</div>