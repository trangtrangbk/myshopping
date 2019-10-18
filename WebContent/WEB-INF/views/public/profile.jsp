<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	<%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="w3l_banner_nav_right">
	<div class="privacy about">
		
<h2>${customer.name }</h2>

<p style="color: red">${msg }</p>
 <div class="container-login100-form-btn">
						<a href = "${pageContext.request.contextPath }/customer/edit"><button class="login100-form-btn">
							Sửa thông tin tài khoản
						</button></a>
					</div>

		<div class="checkout-right">
		
			
			<table class="timetable_sub">
			<c:set var="i" value="${0 }"></c:set>
				<thead>
					<tr>
						<th width = "10%" >STT</th>
						<th width = "20%">Hình ảnh</th>
						<th width = "20%">Số lượng</th>
						<th width = "20%">Tên sản phẩm</th>
						<th width = "20%">Giá</th>
						
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${listCartCustomer }" var="objCart">
					<tr class="rem3">
					<c:set value="${i+1 }" var="i"></c:set>
						<td class="invert">${i }</td>
						
						<td class="invert-image">
						<c:set var="picture" value="${proDAO.getFistPicture(proDAO.getItem(objCart.pro_id)) }"></c:set>
						<img height="100px" width = "100px" src="${pageContext.request.contextPath }/fileUpload/${picture}" alt=" " class="img-responsive"></td>
						<td class="invert">
							<div class="quantity">
								<div class="quantity-select">
							
									<div class="entry value" >
										<span>${objCart.quatity }</span>
									</div>
							
								</div>
							</div>
						</td>
						<td class="invert">${proDAO.getItem(objCart.pro_id).name }</td>

						<td class="invert">${en.format(proDAO.getItem(objCart.pro_id).price) } Đ</td>
						
					</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>


	</div>
</div>
