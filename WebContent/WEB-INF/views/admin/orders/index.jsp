<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	<%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="col-md-12">
	<div class="card">
		<div class="card-header">
			<h4 class="card-title">ĐƠN HÀNG</h4>
		</div>
		<div class="card-body">		
				<div>
					<span style="color: red">${msg }</span>
				</div>
			<div class="">
				<table class="table">
					<thead class=" text-primary">
						<th width = "5%">ID</th>
						<th width = "15%">Họ tên</th>
						<th width = "10%">Số điện thoại</th>
						<th width = "20%">Địa chỉ</th>
						<th width = "10%" class= "text-center">Tổng (VND)</th>
						<th width = "10%">Hình thức</th>
						<th width = "10%">TT thanh toán</th>
						<th width = "10%">TT giao hàng</th>
						<th width = "10%" class="text-left">Chức năng</th>
					</thead>
					<tbody>	
					<c:forEach  items="${listOrder }" var="objOrder">		
					<c:choose>
						<c:when test="${objOrder.checked == 0 }">
							<c:set var="color" value="#FFFFA6"></c:set>
						</c:when>
						<c:otherwise>
							<c:set var="color" value="white"></c:set>
						</c:otherwise>
					</c:choose>									
						<tr  style="background-color: ${color}">						
							<td>${objOrder.order_id }</td>
							<td>${objOrder.name }</td>									
							<td>${objOrder.phone }</td>
							<td>${objOrder.address } </td>
							<td class = "text-center">${en.format(objOrder.bill) } </td>
							<td>${objOrder.payments } </td>
							<td>${objOrder.paid } </td>
							<td>${objOrder.status } </td>
							<td class="text-left">
							<c:set var="urlView" value="${pageContext.request.contextPath }/admin/order/view/${objOrder.order_id }" />
							<c:set var="urlDel" value="${pageContext.request.contextPath }/admin/order/del/${objOrder.order_id }" />
									<a href="${urlView }" title="Xem" ><img  height ="20px" width="20px"  src="${pageContext.request.contextPath }/resources/admin/img/view.png"></a>
                                    <a href="${urlDel }" title="Xóa"  onclick="return confirm('Xác nhận xóa danh mục?')" ><img  height ="20px" width="20px"  src="${pageContext.request.contextPath }/resources/admin/img/bin.png"></a>
								</td>
						</tr>
						</c:forEach>
					</tbody>										
				</table>
				<!-- Pagination -->
					<nav class="text-center" aria-label="...">
					   <ul class="pagination">
					   <c:if test="${page >1 }">
					      <li class=""><a href="${pageContext.request.contextPath }/admin/order/${page-1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
					      </c:if>
					      <c:forEach begin="1" end="${sumPage }"  var="i">
					      	<c:set var="active" value="" />
					      	<c:choose>
					      		<c:when test="${i == page}">
					      			<c:set var="active" value="active" />
					      		</c:when>
					      		<c:otherwise>
					      			<c:set var="active" value="" />
					      		</c:otherwise>
					      	</c:choose>
					      	<li class="${active }"><a href="${pageContext.request.contextPath }/admin/order/${i}">${i} </a></li>
					     </c:forEach>
					     <c:if test="${page<sumPage }">
					      <li><a href="${pageContext.request.contextPath }/admin/order/${page+1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
					   </c:if>
					   </ul>
					</nav>
					<!-- /.pagination -->
			</div>
		</div>
	</div>
</div>

