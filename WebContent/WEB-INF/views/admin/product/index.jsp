<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="content-box-large">
  				<div class="row">
	  				<div class="panel-heading">
	  					<div class="panel-title ">Quản lý hàng hóa</div>
		  			</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-md-8">
						<a href="${pageContext.request.contextPath }/admin/product/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

					</div>
                	<div class="col-md-4">
                	<form action="${pageContext.request.contextPath }/admin/product/search" method="get">
                 	 <div class="input-group form">
                       <input type="text" class="form-control" name ="input-data" placeholder="Search...">
                       <span class="input-group-btn">
                         <input type="submit" class="btn btn-primary" value="Search">
                       </span>
                  	 </div>
                  	 </form>
                  	</div>
				</div>

				<div class="row">
  				<div class="panel-body">
  				<h3 style="color: red">${msg }</h3>
  					<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
						<thead>
							<tr>
								<th width = "5%">ID</th>
								<th width = "20%">Tên sản phẩm</th>
								<th width = "15%">Danh mục</th>
								<th width = "10%">Giá</th>
								<th width = "10%">Trạng thái</th>
								<th width = "20%">Hình ảnh</th>
								<th width = "20%">Chức năng</th>
								
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${listPro }" var="objPro">
							<c:set var="urlEdit" value="${pageContext.request.contextPath }/admin/product/edit/${objPro.id }"></c:set>
							<c:set var="urlDel" value="${pageContext.request.contextPath }/admin/product/del/${objPro.id }"></c:set>
							<tr class="odd gradeX">
								<td>${objPro.id }</td>
								<td>${objPro.name }</td>
								<td>${objPro.cat.cname }</td>
								<td>${objPro.price }</td>
								<c:choose>
									<c:when test="${objPro.status == 1 }">
										<td>Còn hàng</td>
									</c:when>
									<c:otherwise>
										<td>Hết hàng</td>
									</c:otherwise>
								</c:choose>
								<td class="center text-center">
								<c:choose>
								<c:when test="${not empty objPro.picture }">
								<c:set var="picture" value="${proDAO.getFistPicture(objPro) }"></c:set>
									<img class="picture_land" src="${pageContext.request.contextPath }/fileUpload/${picture}" />
								</c:when>
									<c:otherwise>
										<c:out value="Không có hình ảnh"></c:out>
									</c:otherwise>
									</c:choose>
								</td>
								<td class="center text-center">
									<a href="${urlEdit }" title="Sửa" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa </a>
                                    <a href="${urlDel }" title="Xóa" onclick="return confirm('Xác nhận xóa sản phẩm?')" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>

					<!-- Pagination -->
					<nav class="text-center" aria-label="...">
					   <ul class="pagination">
					   <c:if test="${page>1 }">
					      <li class=""><a href="${pageContext.request.contextPath }/admin/product/${page-1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li> 
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
					      	<li class="${active }"><a href="${pageContext.request.contextPath }/admin/product/${i}">${i} </a></li>
					     </c:forEach>
					     <c:if test="${page<sumPage }">
					       <li><a href="${pageContext.request.contextPath }/admin/product/${page+1}" aria-label="Next"><span aria-hidden="true">»</span></a></li> 
					  	</c:if>
					   </ul>
					</nav>
					<!-- /.pagination -->
					
  				</div>
  				</div><!-- /.row -->
  			</div><!-- /.content-box-large -->