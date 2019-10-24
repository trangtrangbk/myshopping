<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	<%@include file="/WEB-INF/templates/taglib.jsp" %>
	<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<h3 class="breadcrumb-header">Mua hàng</h3>
						<ul class="breadcrumb-tree">
							<li><a href="#">Giỏ hàng</a></li>
							<li class="active">Đặt hàng</li>
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

					<div class="col-md-7">
						<!-- Billing Details -->
						<div class="billing-details">
							<div class="section-title">
								<h3 class="title">Đơn hàng</h3>
							</div>
							<div class="form-group">
								<input class="input" type="text" name="last-name" placeholder="Họ và Tên">
							</div>
							<div class="form-group">
								<input class="input" type="email" name="email" placeholder="Email">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="address" placeholder="Địa chỉ">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="city" placeholder="Số điện thoại">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="zip-code" placeholder="Ghi chú">
							</div>
							<div class="form-group">
								<div class="input-checkbox">
									<input type="checkbox" id="create-account">
									<label for="create-account">
										<span></span>
										Tạo tài khoản?
									</label>
									<div class="caption">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.</p>
										<input class="input" type="password" name="password" placeholder="Enter Your Password">
									</div>
								</div>
							</div>
						</div>
						<!-- /Billing Details -->

						<!-- Shiping Details -->
						<div class="shiping-details">
							<div class="section-title">
								<h3 class="title">Địa chỉ giao hàng</h3>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="shiping-address">
								<label for="shiping-address">
									<span></span>
									Gửi đến một địa chỉ khác?
								</label>
								<div class="caption">
									<div class="form-group">
								<input class="input" type="text" name="last-name" placeholder="Họ và Tên">
							</div>
							<div class="form-group">
								<input class="input" type="email" name="email" placeholder="Email">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="address" placeholder="Địa chỉ">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="city" placeholder="Số điện thoại">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="zip-code" placeholder="Ghi chú">
							</div>
								</div>
							</div>
						</div>
						<!-- /Shiping Details -->

						<!-- Order notes -->
						<div class="order-notes">
							<textarea class="input" placeholder="Ghi chú đặt hàng"></textarea>
						</div>
						<!-- /Order notes -->
					</div>

					<!-- Order Details -->
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
								<div class="order-col">
									<div>1x DELL INSPIRON N3567U</div>
									<div>10 000 000</div>
								</div>
								<div class="order-col">
									<div>2x ASUS STRIX GEFORCE GTX</div>
									<div>14 000 0000</div>
								</div>
							</div>
							<div class="order-col">
								<div>Vận chuyển</div>
								<div><strong>Miễn phí</strong></div>
							</div>
							<div class="order-col">
								<div><strong>Tổng</strong></div>
								<div><strong class="order-total">38 000 000</strong></div>
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
							<div class="input-radio">
								<input type="radio" name="payment" id="payment-2">
								<label for="payment-2">
									<span></span>
									Thanh toán qua tài khoản ngân hàng
								</label>
								<div class="caption">
									<p>Thanh toán trưc tuyến (ATM, Internet banking)</p>
								</div>
							</div>
							<div class="input-radio">
								<input type="radio" name="payment" id="payment-3">
								<label for="payment-3">
									<span></span>
									Yêu cầu nhân viên hỗ trợ kỹ thuật đi giao hàng
								</label>
							</div> 
						</div>
						<div class="input-checkbox">
							<input type="checkbox" id="terms">
							<label for="terms">
								<span></span>
								Tôi đã đọc và chấp nhận các <a href="#">điều khoản và điều kiện</a>
							</label>
						</div>
						<a href="#" class="primary-btn order-submit">Đặt hàng</a>
					</div>
					<!-- /Order Details -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->