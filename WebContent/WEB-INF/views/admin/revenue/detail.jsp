<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	<%@include file="/WEB-INF/templates/taglib.jsp" %>	
<div class="col-md-12">
	<div class="card">
		<div class="card-header">
			<h3 class="card-title" style="font-weight: bold">Doanh thu tháng ${month } năm ${year }</h3>
			<h5><br>
			Tổng doanh thu: <span style="color:red">${en.format(billOfMonth) } VND </span>
			</h5>
		</div>
		<div class="card-body">
		
		
			<c:choose>
				<c:when test="${not empty list }">
				<div class="row">
				<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
						<thead>
							<tr>
								<th width = "10%">STT</th>
								<th width = "20%">Tên sản phẩm</th>
								<th width = "20%">Số lượng</th>
								
							</tr>
						</thead>
						<tbody>
						<c:set var="i" value="0"></c:set>
						<c:forEach items="${list }" var="rev">	
						<c:set var="i" value="${i+1 }"></c:set>				
							<tr class="odd gradeX">
								<td>${i}</td>
								<td>${rev.product_name }</td>
								<td>${rev.quatity }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>
				</c:when>
				<c:otherwise>
				<h4> Không có sản phẩm nào được bán ra</h4>
				</c:otherwise>
			</c:choose>
				
		</div>
	</div>
</div>

