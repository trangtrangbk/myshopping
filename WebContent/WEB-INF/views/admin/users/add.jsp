<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/templates/taglib.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<div class="row">
	  				<div class="col-md-12 panel-info">
			  			<div class="content-box-header panel-heading">
		  					<div class="panel-title ">Thêm người dùng</div>
			  			</div>
			  			<div class="content-box-large box-with-header">
				  			<div>
								<div class="row mb-10"></div>
								<form action="" method="POST" >
								<div class="row">
								
									<div class="col-sm-6">
										<div class="form-group">
											<label for="name">Tên đăng nhập</label>
											<input type="text" name="username" class="form-control" placeholder="Nhập tên đăng nhập">
											<form:errors cssStyle="color:red" path="objUser.username"></form:errors>
										</div>
										<div class="form-group">
											<label for="name">Họ tên</label>
											<input type="text" name="fullname" class="form-control" placeholder="Nhập họ tên">
											<form:errors cssStyle="color:red" path="objUser.fullname"></form:errors>
										</div>
										
										<div class="form-group">
											<label>Quyền</label>
											<select class="form-control" name="roleid">											  
											   <c:forEach items="${listRole }" var="objRole">
											   <option value="${objRole.roleId }">${objRole.name }</option>
											   </c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label for="name">Password</label>
											<input type="text" name="password" class="form-control" placeholder="Nhập mật khẩu">
											<form:errors cssStyle="color:red" path="objUser.password"></form:errors>
										</div>
										
										
										
										
									</div>

									<div class="col-sm-6"></div>

									
								</div>
								
								<hr>

								<div class="row">
									<div class="col-sm-12">
										<input type="submit" value="Thêm" class="btn btn-success" />
										<input type="reset" value="Nhập lại" class="btn btn-default" />
									</div>
								</div>
								</form>	
							</div>
						</div>
			  		</div>
	  			</div><!-- /.row col-size -->