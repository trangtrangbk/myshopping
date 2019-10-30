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
							<li ><a href="${pageContext.request.contextPath }/customer/profile">Thông tin</a></li>
							<li class="active">Sửa thông tin</li>
							<li ><a href="${pageContext.request.contextPath }/customer/history">Xem lịch sử</a></li>
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
				<form action="" method="post">
				<div class="row">
					<div class="col-md-6">
						<div class="billing-details">
							<div class="form-group">
								<label>Họ tên</label>
								<input class="input" type="text" name="name" value="${customer.name }" >
							</div>
							<div class="form-group">
								<label>Email</label>
								<input class="input" type="email" name="email" value="${customer.email }">
							</div>
							<div class="form-group">
								<label>Địa chỉ</label>
								<input class="input" type="text" name="address" value="${customer.address }">
							</div>
							<div class="form-group">
								<label>Số điện thoại</label>
								<input class="input" type="tel" name="phone" value="${customer.phone }">
							</div>
						</div>
					</div>
					<div class="col-md-6">
					<div class="col-md-6">
					<div class="form-group">
								<label>Username</label>
								<input class="input" type="text" name="username" value="${customer.username }">
							</div>
							<div class="form-group">
								<label>Password</label>
								<input class="input" type="tel" name="password" placeholder="**********">
							</div>
							<button class="btn btn-success">LƯU</button>
					</div>
					</div>
				</div>
				</form>
			</div>	
		</div>
