<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp"%>
<form action="${pageContext.request.contextPath }/admin/cat/add" method="post">
	<div class="col-md-12 panel-info">
		<div class="content-box-header panel-heading">
			<div class="panel-title ">Thêm danh mục</div>
		</div>
		<div class="content-box-large box-with-header">
			<div>
				<div class="row mb-10"></div>

				<div class="row">
					<div class="col-sm-16">
						<div class="form-group">
							<label for="name">Tên danh mục</label> 
							<input type="text"	name="cname" class="form-control" placeholder="Nhập danh mục">
							<form:errors  cssStyle="color:red" path="objCat.cname"></form:errors>
						</div>

						<div class="form-group">
							<label for="name">Danh mục cha</label> <select class="form-control"
								name="parrent_id">
								<option value="0">Không</option>
								<c:forEach items="${listCat }" var="objCat">
								<option value="${objCat.cid }">${objCat.cname }</option>
								</c:forEach>
							</select>
						</div>

					</div>
					<div class="col-sm-12"></div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-12">
						<input type="submit" value="Thêm" class="btn btn-success" /> <input
							type="reset" value="Nhập lại" class="btn btn-default" />
					</div>
				</div>

			</div>
		</div>
	</div>
</form>
