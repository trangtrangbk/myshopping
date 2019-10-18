<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp"%>
<form action="${pageContext.request.contextPath }/admin/order/view/${order.order_id}" method="post">
	<div class="col-md-12 panel-info">
		<div class="content-box-header panel-heading">
			<div class="panel-title ">Chi tiết đơn hàng</div>
		</div>
		<div class="content-box-large box-with-header">
			<div>
				<div class="row mb-10"></div>

				<div class="row">
					<div class="col-sm-16">
						<div class="form-group">
							<label for="name">Họ tên: </label> 
							<input type="text"	disabled="disabled" name="name" value = "${order.name }" class="form-control" placeholder="Nhập mã quà tặng">
						</div>	
						
						<div class="form-group">
							<label for="name">Số điện thoại: </label> 
							<input type="text" disabled="disabled"	name="phone" value = "${order.phone }" class="form-control">
						</div>	
						
						<div class="form-group">
							<label for="name">Ngày order:</label> 
							<input type="text" disabled="disabled"	name="date" value = "${order.date }"  class="form-control" >
						</div>		
						
						<div class="form-group">
							<label for="name">Địa chỉ</label> 
							<input type="text" disabled="disabled"	name="address" value = "${order.address }"  class="form-control" >
						</div>			
						
						<div class="form-group">
							<label for="name">Hình thức thanh toán</label> 
							<input type="text" disabled="disabled"	name="payments" value = "${order.payments }"  class="form-control" >
						</div>			
						
						<div class="form-group">
							<label for="name">Trang thái</label> <select class="form-control"
								name="status">
								<c:choose>
									<c:when test="${order.status == 'Đang chờ' }">
									<option selected="selected" value = "Đang chờ">Đang chờ</option>
									</c:when>
									<c:otherwise>
									<option  value = "Đang chờ">Đang chờ</option>
									</c:otherwise>
								</c:choose>
								
								<c:choose>
									<c:when test="${order.status == 'Đã được gửi đi' }">
									<option selected="selected" value = "Đã được gửi đi">Đã được gửi đi</option>
									</c:when>
									<c:otherwise>
									<option  value = "Đã được gửi đi">Đã được gửi đi</option>
									</c:otherwise>
								</c:choose>
								
								<c:choose>
									<c:when test="${order.status == 'Hoàn tất' }">
									<option selected="selected" value = "Hoàn tất">Hoàn tất</option>
									</c:when>
									<c:otherwise>
									<option  value = "Hoàn tất">Hoàn tất</option>
									</c:otherwise>
								</c:choose>
								
								<c:choose>
									<c:when test="${order.status == 'Từ chối' }">
									<option selected="selected" value = "Từ chối">Từ chối</option>
									</c:when>
									<c:otherwise>
									<option  value = "Từ chối">Từ chối</option>
									</c:otherwise>
								</c:choose>			
															
							</select>
						</div>

						<div class="form-group">
							<label for="name">Trạng thái thanh toán</label> 
							
									
										<select class="form-control"
								name="paid">
								
									<c:choose>
									<c:when test="${order.paid == 'Chưa thanh toán' }">
									<option selected="selected" value = "Chưa thanh toán">Chưa thanh toán</option>
									</c:when>
									<c:otherwise>
									<option  value = "Chưa thanh toán">Chưa thanh toán</option>
									</c:otherwise>
								</c:choose>	
								
									<c:choose>
									<c:when test="${order.paid == 'Đã thanh toán' }">
									<option selected="selected" value = "Đã thanh toán">Đã thanh toán</option>
									</c:when>
									<c:otherwise>
									<option  value = "Đã thanh toán">Đã thanh toán</option>
									</c:otherwise>
								</c:choose>								
													
							</select>
								
							
						</div>
						
						<table class="table">
					<thead class=" text-primary">
						<th width = "15%">Tên sản phẩm</th>						
						<th width = "10%">Hình ảnh</th>
						<th width = "10%">Đơn giá</th>	
						<th width = "10%">Số lượng</th>	
						<th width = "10%">Thành tiền</th>						
					</thead>
					<tbody>	
					<c:forEach  items="${listCartOrder }" var="objOrder">	
					<c:set value="${proDAO.getItem(objOrder.pro_id) }" var="item"></c:set>										
						<tr>						
							<td>${item.name } </td>
								<c:set var="picture" value="${proDAO.getFistPicture(item) }"></c:set>
							<td><img class="picture_land" src="${pageContext.request.contextPath }/fileUpload/${picture}" /></td>
							<td>${en.format(item.price) } Đ </td>	
							<td>${objOrder.quatity } </td>
							<td>${en.format(item.price*objOrder.quatity) } Đ </td>														
						</tr>
						</c:forEach>
					</tbody>	
														
				</table>					
					<p style="color: red;font-weight: bold">Tổng: ${en.format(total) } Đ</p>
					<p >Được giảm: ${order.giftcode}%</p>
					<p style="color: red;font-weight: bold">Tổng sau khi giảm: ${en.format(total2)} Đ</p>
					</div>
					<div class="col-sm-12"></div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-12">
						<input type="submit" value="Lưu" class="btn btn-success" /> 
					</div>
				</div>

			</div>
		</div>
	</div>
</form>
