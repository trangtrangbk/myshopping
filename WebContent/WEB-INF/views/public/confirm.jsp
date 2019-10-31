<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	<%@include file="/WEB-INF/templates/taglib.jsp" %>
		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<form action="${pageContext.request.contextPath }/confirm" method="post">
				<div class="row">					
					<div class="col-md-5 order-details">
						<div class="section-title text-center">
							<h3 class="title">Đơn hàng của bạn</h3>
						</div>
						
						<div class="order-summary">
						<div class="order-col">
								<div><strong>Tên</strong></div>
								<div>${objOrder.name }</div>
							</div>
						<div class="order-col">
								<div><strong>Số điện thoại</strong></div>
								<div>${objOrder.phone }</div>
							</div>
						
							<div class="order-col">
								<div><strong>Địa chỉ</strong></div>
								<div>${objOrder.address }</div>
							</div>
							<div class="order-col">
								<div><strong>Sản phẩm</strong></div>
								<div><strong>Giá</strong></div>
							</div>
							<div class="order-products">
								<c:forEach items="${myCartItems }" var="cart">								
								<div class="order-col">
									<div>${cart.quatity} x ${cart.product.name }</div>
									<div>${en.format(cart.product.price *cart.quatity) }</div>
								</div>
								</c:forEach>
							</div>
								<div class="order-col">
								<div>Giảm giá</div>
								<div><strong>-${objOrder.giftcode }%</strong></div>
							</div>
							<div class="order-col">
								<div><strong>Tổng</strong></div>
								<div><strong class="order-total">${en.format(myCartTotal) } vnd</strong></div>
							</div>
						</div>
						<div class="payment-method">
							<div class="input-radio">
								<input type="radio" name="payment" id="payment-1" checked="checked">
								<label for="payment-1">
									<span></span>
									Thanh toán tiền mặt khi nhận hàng
								</label>
								<div class="caption">
									<p>Quý khách sẽ thanh toán bằng tiền mặt khi nhận hàng. Vui lòng bấm nút " Đặt hàng" để hoàn tất.</p>
								</div>
							</div>
						</div>
						<button class="primary-btn order-submit">Xác nhận</button>
					</div>
					<!-- /Order Details -->
				</div>
				</form>
				<!-- /row -->
			</div>
			
			<!-- /container -->
		</div>
		<!-- /SECTION -->