<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="row">
				<form action="<%-- ${contextPath }/admin/cat/edit/${cid} --%>" method="POST">
	  				<div class="col-md-12 panel-info">
			  			<div class="content-box-header panel-heading">
		  					<div class="panel-title ">Sửa người dùng</div>
			  			</div>
			  			<form:errors path="objUser.*" class="myErrors"></form:errors>
			  			<div class="content-box-large box-with-header">
				  			<div>
								<div class="row mb-10"></div>
								
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="name">Tên đăng nhập</label>
											<input type="text" name="username" class="form-control" placeholder="${objUser.username }" value="${objUser.username }" >
										</div>
										<div class="form-group">
											<label for="name">Họ tên</label>
											<input type="text" name="fullname" class="form-control" placeholder="${objUser.fullname }" value="${objUser.fullname }" >
										</div>
										
											<div class="form-group">
											<label>Quyền</label>
											<select class="form-control" name="roleid">
											<c:choose>
												<c:when test="${objUser.roleid == 1 }">
													 <option ${select } value="${objUser.roleid }">ADMIN</option>
												</c:when>
												<c:otherwise>
												 <c:forEach items="${listRole }" var="objRole">
											   <c:choose>
											   
											   	<c:when test="${objRole.roleId == objUser.roleid }"><c:set var="select" value="selected ='selected'"/></c:when>
											   	<c:otherwise><c:set var="select" value=""/></c:otherwise>
											   
											   </c:choose>
											   
											   <option ${select } value="${objRole.roleId }">${objRole.name }</option>
											   </c:forEach>
												</c:otherwise>
											</c:choose>
											  
											</select>
										</div>
										
										<div class="form-group">
											<label for="name">Password</label>
											<input type="password" name="password" class="form-control" placeholder="nhập mật khẩu" value="" >
										</div>
									</div>

									<div class="col-sm-6"></div>

									
								</div>

								<hr>

								<div class="row">
									<div class="col-sm-12">
										<input type="submit" value="Sửa" class="btn btn-success" />
										<input type="reset" value="Nhập lại" class="btn btn-default" />
									</div>
								</div>

							</div>
						</div>
			  		</div>
			  		</form>
	  			</div>