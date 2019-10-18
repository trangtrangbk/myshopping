<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp"%>
<form action="${pageContext.request.contextPath }/admin/giftcode/edit/${gif.gid}" method="post">
	<div class="col-md-12 panel-info">
		<div class="content-box-header panel-heading">
			<div class="panel-title ">Thêm giftcode</div>
		</div>
		<div class="content-box-large box-with-header">
			<div>
				<div class="row mb-10"></div>

				<div class="row">
					<div class="col-sm-16">
						<div class="form-group">
							<label for="name">Tên</label> 
							<input type="text"	name="gname" value = "${gif.gname }" class="form-control" placeholder="Nhập mã quà tặng">
						</div>	
						
						<div class="form-group">
							<label for="name">Số lượng</label> 
							<input type="text"	name="amount" value = "${gif.amount }" class="form-control" placeholder="Nhập số lượng">
						</div>	
						
						<div class="form-group">
							<label for="name">Giá trị</label> 
							<input type="text"	name="value" value = "${gif.value }"  class="form-control" placeholder="Nhập giá trị">
						</div>					

					</div>
					<div class="col-sm-12"></div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-12">
						<input type="submit" value="Sửa" class="btn btn-success" /> <input
							type="reset" value="Nhập lại" class="btn btn-default" />
					</div>
				</div>

			</div>
		</div>
	</div>
</form>
