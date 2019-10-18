<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	<%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="w3l_banner_nav_right">
	<div class="privacy about">
		<h3>
			GIỎ HÀNG
		</h3>
	<p style="color:red">${msg }</p>
		<div class="checkout-right">
		<c:choose>
			<c:when test="${sessionScope.myCartNum > 0 }">
			<h4>
				Giỏ hàng của bạn có: <span>${sessionScope.myCartNum} sản phẩm</span>
			</h4>
			</c:when>
			<c:otherwise>
			<h4>
				Giỏ hàng trống
			</h4>
			</c:otherwise>
		</c:choose>
			
			<table class="timetable_sub">
			<c:set var="i" value="${0 }"></c:set>
				<thead>
					<tr>
						<th width = "10%" >STT</th>
						<th width = "20%">Hình ảnh</th>
						<th width = "20%">Số lượng</th>
						<th width = "20%">Tên sản phẩm</th>
						<th width = "20%">Giá</th>
						<th width = "10%">Xóa</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${sessionScope.myCartItems }" var="objCart">
					<tr class="rem3">
					<c:set value="${i+1 }" var="i"></c:set>
						<td class="invert">${i }</td>
						
						<td class="invert-image">
						<c:set var="picture" value="${proDAO.getFistPicture(objCart.value.product) }"></c:set>
						<img height="100px" width = "100px" src="${pageContext.request.contextPath }/fileUpload/${picture}" alt=" " class="img-responsive"></td>
						<td class="invert">
							<div class="quantity">
								<div class="quantity-select">
								<a href="javascript:void(0)" title="" onclick="subquatity(${objCart.value.product.id})">
											<div class="entry value-minus">&nbsp;</div>
											</a>
									
									<div class="entry value" id = "quatity-${objCart.value.product.id}">
										<span>${objCart.value.quatity }</span>
									</div>
									
									<a href="javascript:void(0)" title="" onclick="addquatity(${objCart.value.product.id})">
											<div class="entry value-plus active">&nbsp;</div>
											</a>
									
									
									
									
								</div>
							</div>
						</td>
						<td class="invert">${objCart.value.product.name }</td>

						<td class="invert">${en.format(objCart.value.product.price) } Đ</td>
						<td class="invert">
							<div class="rem">
								<a href="${pageContext.request.contextPath }/cart/remove/${objCart.value.product.id}">
								<img width = "30px" height="30px" src="${pageContext.request.contextPath }/resources/public/images/remove.png">
								</a></div>
							</div>

						</td>
					</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
		<div class="checkout-left">
			<div class="col-md-4 checkout-left-basket">
				<a href="${pageContext.request.contextPath }"><h4>Tiếp tục mua sắm</h4></a>
				<ul>
					
					<li>Tổng : <i></i> <span>${en.format(sessionScope.myCartTotal) }Đ</span></li>
				</ul>
			</div>
			<div class="col-md-8 address_form_agile">
				<h4>Thông tin mua hàng</h4>
				<form action="${pageContext.request.contextPath }/checkout/deliver" method="post"
					class="creditly-card-form agileinfo_form">
					<section class="creditly-wrapper wthree, w3_agileits_wrapper">
						<div class="information-wrapper">
							<div class="first-row form-group">
								<div class="controls">
									<label class="control-label">Họ tên: </label>
									<br /><form:errors cssStyle="color:red" path="objOrder.name"></form:errors> <input
										class="billing-address-name form-control" type="text" value="${objOrder.name }"
										name="name" placeholder="nhập họ tên">
										
								</div>
								<div class="w3_agileits_card_number_grids">
									<div class="w3_agileits_card_number_grid_left">
										<div class="controls">
											<label class="control-label">Số điện thoại:</label>	<br /><form:errors cssStyle="color:red" path="objOrder.phone"></form:errors> <input
												class="form-control" type="text" placeholder="nhập số điện thoại" value = "${objOrder.phone }" name="phone">
										</div>
									</div>
									<div class="w3_agileits_card_number_grid_right">
										<div class="controls">
											<label class="control-label">Địa chỉ: </label> 	<br /><form:errors cssStyle="color:red" path="objOrder.address"></form:errors><input
											value = "${objOrder.address }"	class="form-control" type="text" placeholder="nhập địa chỉ" name= "address">
										</div>
							
									</div>
									<div class="w3_agileits_card_number_grid_left">
										<div class="controls">
											<label class="control-label">Mã giảm giá:</label>	<br />
											 <input class="form-control" type="text" placeholder="nhập giftcode" value = "${objOrder.giftcode }" name="giftcodes">
										</div>
									</div>
									<div class="clear"></div>
								</div> 
							
							</div>
						
						</div>
						<button  class="submit check_out">Next</button>
					</section>
				</form>
				<div class="checkout-right-basket">

    <!-- Include the PayPal JavaScript SDK -->

    
				</div>
			</div>

			<div class="clearfix"></div>

		</div>

	</div>
</div>
<script type="text/javascript">
		function subquatity(id){
			var tmp = "#quatity-"+id;
			$.ajax({
				url: '<%=request.getContextPath()%>/cart/sub',
				type: 'POST',
				cache: false,
				data: {id: id},
				success: function(data){
					$(tmp).html(data);
				},
				error: function (){
					alert('Có lỗi xảy ra');
				}
			});
			return false;
		}
</script>

<script type="text/javascript">
			$(document).ready(function(){
				$('#forwardStep').bind('click',function(){
				  var page = $(this).attr('rel');
				  	alert('Kích vào nút Paypal để tiến hành thanh toán');
				 });
			});
		</script>


<script type="text/javascript">
		function addquatity(id){
			var tmp = "#quatity-"+id;
			$.ajax({
				url: '<%=request.getContextPath()%>/cart/addquatity',
				type: 'POST',
				cache: false,
				data: {id: id},
				success: function(data){
					$(tmp).html(data);
				},
				error: function (){
					alert('Có lỗi xảy ra');
				}
			});
			return false;
		}
</script>