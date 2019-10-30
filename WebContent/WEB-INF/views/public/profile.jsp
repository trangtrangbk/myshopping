<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	<%@include file="/WEB-INF/templates/taglib.jsp" %>
<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<h3 class="breadcrumb-header">Tài khoản</h3>
						<ul class="breadcrumb-tree">
							<li class="active">Thông tin</li>
							<li ><a href ="${pageContext.request.contextPath }/customer/edit">Sửa thông tin</a></li>
							<li ><a href="${pageContext.request.contextPath }/customer/history">Lịch sử đơn hàng</a></li>
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
				<div class="row">
				<p style="color:red">${msg }</p>
					<div class="col-md-7">
						<div class="billing-details">
							<div class="form-group">
								<label>Họ tên</label>
								<input class="input" type="text" name="first-name" value="${customer.name}" disabled="disabled">
							</div>
							<div class="form-group">
								<label>Email</label>
								<input class="input" type="email" name="email" value="${customer.email }" disabled="disabled">
							</div>
							<div class="form-group">
								<label>Địa chỉ</label>
								<input class="input" type="text" name="address" value="${customer.address }" disabled="disabled">
							</div>
							<div class="form-group">
								<label>Số điện thoại</label>
								<input class="input" type="tel" name="phone" value="${customer.phone }" disabled="disabled">
							</div>
						</div>
					</div>
				</div>
			</div>	
		</div>
		
