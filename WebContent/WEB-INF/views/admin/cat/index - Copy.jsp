<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	<%@include file="/WEB-INF/templates/taglib.jsp" %>
	<c:set var="catDAO" value="${catDAO }" />		
<div class="col-md-12">
	<div class="card">
		<div class="card-header">
			<h4 class="card-title">Quản lí danh mục</h4>
		</div>
		<div class="card-body">
		<div class="row">
					<div class="col-md-8">
						<a href="${pageContext.request.contextPath}/admin/cat/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

					</div>
                	<div class="col-md-4">
              
                  	</div>
				</div>
				<div>
					<span style="color: red">${msg }</span>
				</div>
			<div class="">
				<table class="table">
					<thead class=" text-primary">
						<th width = "10%">ID</th>
						<th width = "40%">Tên danh mục</th>
						<th width = "20%" class="text-left">Chức năng</th>
					</thead>
					<tbody>	
					
					<%
						CategoryDAO catDAO = (CategoryDAO) request.getAttribute("catDAO");
						int offset = (int) request.getAttribute("offset");
						List<Category> listCatPan = catDAO.getParItems();
						if(listCatPan !=null){
							if(listCatPan.size() > 0){
								for(Category objCat:listCatPan){
									if(objCat.getParrent_id() == 0){
										%>								
						<tr>						
							<td><%=objCat.getCid() %></td>
							<td><%=objCat.getCname() %>										
							 <% catDAO.ShowCategory(listCatPan,objCat.getCid(),response,request,out); %>						
							</td>
							
							<td class="text-left">
									<a href="<%=request.getContextPath() %>/admin/cat/edit/<%=objCat.getCid() %>" title="Sửa" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
                                    <a href="<%=request.getContextPath() %>/admin/cat/del/<%=objCat.getCid() %>" title="Xóa" class="btn btn-danger" onclick="return confirm('Xác nhận xóa danh mục?')" ><span class="glyphicon glyphicon-trash" ></span> Xóa</a>
								</td>
						</tr>
						<%}}}} %>
					</tbody>										
				</table>
				<!-- Pagination -->
					<nav class="text-center" aria-label="...">
					   <ul class="pagination">
					   <c:if test="${page >1 }">
					      <li class=""><a href="${pageContext.request.contextPath }/admin/cat/${page-1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
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
					      	<li class="${active }"><a href="${pageContext.request.contextPath }/admin/cat/${i}">${i} </a></li>
					     </c:forEach>
					     <c:if test="${page<sumPage }">
					      <li><a href="${pageContext.request.contextPath }/admin/cat/${page+1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
					   </c:if>
					   </ul>
					</nav>
					<!-- /.pagination -->
			</div>
		</div>
	</div>
</div>

