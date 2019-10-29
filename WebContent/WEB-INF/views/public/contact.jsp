<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%@include file="/WEB-INF/templates/taglib.jsp"%>
<form action="#" method="post">

	<div class="section">

		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-7">
					<div class="billing-details">

						<h2>
							<span>Liên hệ</span>
						</h2>
						<p>Khi bạn có thắc mắc, vui lòng gửi liên hệ, chúng tôi sẽ
							phản hồi trong thời gian sớm nhất.</p>
						<div class="form-group">
							<label >Họ tên </label> </br> <input class="input"type="text"  
								name="name" placeholder="Họ Tên">
							<form:errors cssStyle="color:red" path="obj.name"></form:errors>
						</div>
						<div class="form-group">
							<label >Email</label></br> <input class="input" type="email"  
								name="email" placeholder="Email">
							<form:errors cssStyle="color:red" path="obj.email"></form:errors>
						</div>
						<div class="form-group">
							<label>Số điện thoại<h6>(xxx-xx-xxx)</h6></label></br> <input class="input"
								type="tel"  name="phone" pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}" placeholder="Số điện thoại">
							<form:errors cssStyle="color:red" path="obj.phone"></form:errors>
						</div>
						<div class="form-group">
							<label >Chủ đề </label></br> <input class="input" type="text"  
								name="subject" placeholder="Chủ đề">
							<form:errors cssStyle="color:red" path="obj.subject"></form:errors>
						</div>
						<div class="form-group">
							<label >Nội dung</label></br>
							<textarea class="input "name="message" placeholder="Nội dung" ></textarea>
							<form:errors cssStyle="color:red" path="obj.message"></form:errors>
							<br />
						</div>
						<input type="submit" value="Gửi"> <input type="reset"
							value="Reset">


					</div>
				</div>

				<h4 style="color: red">${msg }</h4>

			</div>




		</div>
	</div>
</form>