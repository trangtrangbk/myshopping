<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	<div class="w3l_banner_nav_right">
	<%@include file="/WEB-INF/templates/taglib.jsp" %>
<!-- mail -->
		<div class="mail">
			<h3>Mail Us</h3>
			
			<div class="agileinfo_mail_grids">
				<div class="col-md-4 agileinfo_mail_grid_left">
					<ul>
						<li><i class="fa fa-home" aria-hidden="true"></i></li>
						<li>Địa chỉ<span>868 1st Avenue NYC.</span></li>
					</ul>
					<ul>
						<li><i class="fa fa-envelope" aria-hidden="true"></i></li>
						<li>Email<span><a href="mailto:info@example.com">info@example.com</a></span></li>
					</ul>
					<ul>
						<li><i class="fa fa-phone" aria-hidden="true"></i></li>
						<li>Số điện thoại<span>(+123) 233 2362 826</span></li>
					</ul>
				</div>
				<div class="col-md-8 agileinfo_mail_grid_right">
				<h2 style = "color: red">${msg }</h2>
					<form action="#" method="post">
						<div class="col-md-6 wthree_contact_left_grid">
							<input type="text" name="name" placeholder="Họ tên" >
							<form:errors cssStyle="color:red" path="obj.name"></form:errors>
							<input type="email" name="email" placeholder="Email" >
							<form:errors cssStyle="color:red" path="obj.email"></form:errors>
						</div>
						<div class="col-md-6 wthree_contact_left_grid">
						<input type="date" name="usr_time">
							<input type="text" name="phone" placeholder="Số điện thoại" >
							<input type="tel" name="phone" pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}">
							<form:errors cssStyle="color:red" path="obj.phone"></form:errors>
							<input type="text" name="subject" placeholder="Chủ đề" >
							<form:errors cssStyle="color:red" path="obj.subject"></form:errors>
						</div>
						<div class="clearfix"> </div>
						<textarea  name="message"  placeholder="Message..."></textarea>
						<form:errors cssStyle="color:red" path="obj.message"></form:errors><br/>
						<input type="submit" value="Gửi">
						<input type="reset" value="Reset">
					</form>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
<!-- //mail -->
		</div>