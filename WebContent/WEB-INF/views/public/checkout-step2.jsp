<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	<%@include file="/WEB-INF/templates/taglib.jsp" %>
		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<form action="${pageContext.request.contextPath }/checkout-step2" method="post">
				<div class="row">
					<div class="col-md-7">
						<!-- Billing Details -->
						<div class="billing-details">
							<div class="section-title">
								<h3 class="title">Đơn hàng</h3>
							</div>
							<c:if test="${customer == null }">
							<div class="form-group">
									<a for="create-account" href="./customer/login">										
										Đăng nhập mua hàng
									</a>									
							</div>
							</c:if>	
							<div class="form-group">
							<label>Họ tên (*)</label>
								<input class="input" type="text" name="name" value="${customer.name }" placeholder="Họ và Tên (*)">
							</div>
							<div class="form-group">
							<label>Email (*)</label>
								<input class="input" type="email" name="email" value="${customer.email }" placeholder="Email (*)">
							</div>
							<div class="form-group">
							<label>Địa chỉ (*)</label>
								<input class="input" type="text" name="address" value="${customer.address }" placeholder="Địa chỉ (*)">
							</div>
							<div class="form-group">
							<label>Số điện thoại (*)</label>
								<input class="input" type="text" name="phone" value="${customer.phone }" placeholder="Số điện thoại (*)">
							</div>
							<div class="form-group">
							<label>Mã giảm giá (nếu có)</label>
								<input class="input" type="text" name="giftcodes" value="" placeholder="giftcode">
							</div>					
						</div>						
					</div>
					<div class="col-md-5 order-details">
						<div class="section-title text-center">
							<h3 class="title">Đơn hàng của bạn</h3>
						</div>
						<div class="order-summary">
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
								<div><strong>Tổng</strong></div>
								<div><strong class="order-total">${myCartTotal }</strong></div>
							</div>
						</div>
						<div class="payment-method">
							<div class="input-radio">
								<input type="radio" name="payment" id="payment-1">
								<label for="payment-1">
									<span></span>
									Thanh toán tiền mặt khi nhận hàng
									
								</label>
								<div class="caption">
									<p>Quý khách sẽ thanh toán bằng tiền mặt khi nhận hàng. Vui lòng bấm nút " Đặt hàng" để hoàn tất.</p>
								</div>
							</div>
						</div>
						<button class="primary-btn order-submit">Đặt hàng</button>
					</div>
					<!-- /Order Details -->
				</div>
				</form>
				<!-- /row -->
			</div>
			
			<!-- /container -->
		</div>
		<!-- /SECTION -->