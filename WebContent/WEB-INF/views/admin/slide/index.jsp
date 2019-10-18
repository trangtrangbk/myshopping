<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="content-box-large">
  				<div class="row">
	  				<div class="panel-heading">
	  					<div class="panel-title ">Quản lý Slide</div>
		  			</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-md-8">
						<a href="${pageContext.request.contextPath }/admin/slide/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

					</div>
                
				</div>

				<div class="row">
  				<div class="panel-body">
  				<h3 style="color: red">${msg }</h3>
  					<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
						<thead>
							<tr>
								<th width = "5%">ID</th>								
								<th width = "70%">Hình ảnh</th>
								<th width = "15%">Hiển thị</th>
								<th width = "15%">Chức năng</th>
								
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${listSlide }" var="objSlide">
							<c:set var="urlEdit" value="${pageContext.request.contextPath }/admin/slide/edit/${objSlide.id }"></c:set>
							<c:set var="urlDel" value="${pageContext.request.contextPath }/admin/slide/del/${objSlide.id }"></c:set>
							<tr class="odd gradeX">
								<td>${objSlide.id }</td>								
								<td class="center text-center">
								
									<img height = "300px" width = "700px"  src="${pageContext.request.contextPath }/fileUpload/${objSlide.picture}" />
								
								</td>
								
								 <td class="center text-center">
                                                
                                              <span id="active-${objSlide.id }">
                                              <a href="javascript:void(0)" onclick="active(${objSlide.id},${objSlide.status});">
                                     
                                             <c:choose>
                                             	<c:when test="${objSlide.status == 1 }">
                                             		<img height='50px' width = '50px' src="<%=request.getContextPath() %>/resources/admin/img/ac.png" alt="" />
                                             	</c:when>
                                             	<c:otherwise>
                                             		<img height='50px' width = '50px'  src="<%=request.getContextPath() %>/resources/admin/img/de.png" alt="" />
                                             	</c:otherwise>
                                             </c:choose>
                                             </a>
                                           </span> 
                                                                                    </td>
								
								<td class="center text-center">
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
					      <li class=""><a href="${pageContext.request.contextPath }/admin/slide/${page-1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li> 
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
					      	<li class="${active }"><a href="${pageContext.request.contextPath }/admin/slide/${i}">${i} </a></li>
					     </c:forEach>
					     <c:if test="${page<sumPage }">
					       <li><a href="${pageContext.request.contextPath }/admin/slide/${page+1}" aria-label="Next"><span aria-hidden="true">»</span></a></li> 
					  	</c:if>
					   </ul>
					</nav>
					<!-- /.pagination -->
					
  				</div>
  				</div><!-- /.row -->
  			</div><!-- /.content-box-large -->
  			 <script type="text/javascript">

                    function active(id,status)
                    {
                     var url ='<%=request.getContextPath()%>/admin/slide/active';                    
                     var tmp="#active-"+id;
        
                  $.ajax({
                    url:url,
                    type: 'POST',
             //       dataType: "html",
                    data: {
                          id : id    ,
                          status: status
                    },
                  success: function(data) {
                      tmp="#active-"+id;
                       $(tmp).html(data);

                    },
                    error: function (){
    					alert("Có lỗi xảy ra");
    					}
                  });
                 }
   </script>
  			