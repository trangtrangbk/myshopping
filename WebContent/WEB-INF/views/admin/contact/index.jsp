 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<div class="content-box-large">
				<div>${msg }</div>
  				<div class="row">
	  				<div class="panel-heading">
	  					<div class="panel-title ">Danh sách liên hệ</div>
		  			</div>
				</div>
				<hr>	


				<div class="row">
  				<div class="panel-body">
  					<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
						<thead>
							<tr>
								<th width="5%">ID</th>
								<th width="20%">Tên người gửi</th>
								<th width="10%">SĐT</th>
								<th width="15%">Email</th>
								<th width="15%">Chủ đề</th>
								<th width="40%">Nội dung</th>
								<th width="15%">Chức năng</th>
							</tr>
						</thead>
						<tbody>
						<c:if test="${not empty listContact }">
						<c:forEach items="${listContact }" var="objContact">
							<c:set var="urlEdit" value="${contextPath }/admin/contact/edit/${objContact.id }"></c:set>
							<c:set var="urlDel" value="${contextPath }/admin/contact/del/${objContact.id }"></c:set>
							<tr class="odd gradeX">
								<td>${objContact.id }</td>
								<td>${objContact.name }</td>
								<td>${objContact.phone}</td>
								<td><a href="mailto:${objContact.email }">${objContact.email}</a></td>
								<td>${objContact.subject}</td>
								<td class="center">${objContact.message }</td>
								
								<td class="center text-center">
                                    <a href="${urlDel }" title="Xóa"  onclick="return confirm('Ban co muon xoa khong?')" class="btn btn-danger">
                                    <span class="glyphicon glyphicon-trash"></span> Xóa</a>
								</td>
							</tr>
							</c:forEach>
						</c:if>
						</tbody>
					</table>

					<!-- Pagination -->
					<nav class="text-center" aria-label="...">
					   <ul class="pagination">
					   <c:if test="${page>1 }">
					      <li class=""><a href="${pageContext.request.contextPath }/admin/contact/${page-1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li> 
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
					      	<li class="${active }"><a href="${pageContext.request.contextPath }/admin/contact/${i}">${i} </a></li>
					     </c:forEach>
					     <c:if test="${page<(sumPage-1) }">
					       <li><a href="${pageContext.request.contextPath }/admin/contact/${page +1}" aria-label="Next"><span aria-hidden="true">»</span></a></li> 
					   </c:if>
					   </ul>
					</nav>
					<!-- /.pagination -->
					
  				</div>
  				</div><!-- /.row -->
  			</div><!-- /.content-box-large --> 