<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	<%@include file="/WEB-INF/templates/taglib.jsp" %>	
<div class="col-md-12">
	<div class="card">
		<div class="card-header">
			<h3 class="card-title" style="font-weight: bold">Doanh thu năm ${year }</h3>
			<div class="input-group form" style="float: right">
				<form action="${pageContext.request.contextPath }/admin/revenue/year" method="post">
				<h5 >Xem doanh thu năm </h5>
					<select class="form-control" name= "currentYear">
					<c:forEach var="year" items="${listYear }">
						<option value="${year }">${year }</option>
					</c:forEach>	
					</select>
					<input class="btn btn-primary" type="submit" value="submit">
				</form>
			
			</div>
			<h5><br>
			Tổng doanh thu: <span style="color:red">${en.format(billOfYear) } VND </span>
			</h5>
		</div>
		<div class="card-body">
		<div class="row">
				</div>

			<div class="">
				<table class="table">
					<thead class=" text-primary">
						<th width = "10%" class= "text-center">Tháng</th>
						<th width = "40%" class= "text-center">Doanh thu (VND)</th>
						<th width = "20%" class="text-left">Chức năng</th>
					</thead>
					<tbody>	
					<c:set value="0" var="i"></c:set>		
					<c:forEach items="${listBillOfYear }" var = "bill"> 
							<c:set value="${i+1 }" var="i"></c:set>	
						<tr>						
							<td class= "text-center">Tháng ${i}</td>
							<td class= "text-center">${bill }</td>
							
							<td class="text-left">						
                                    <a href="<%=request.getContextPath() %>/admin/revenue/${year}/detail-${i}" title="detail" class="btn btn-danger">Chi tiết</a>
								</td>
						</tr>
					</c:forEach>				
					</tbody>										
				</table>
			</div>
		</div>
	</div>
</div>

