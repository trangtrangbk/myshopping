<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="row">
	  				<div class="col-md-12 panel-info">
			  			<div class="content-box-header panel-heading">
		  					<div class="panel-title ">Thêm sản phẩm</div>
			  			</div>
			  			
			  			
			  			<div class="content-box-large box-with-header">
				  			<div>
								<div class="row mb-10"></div>
								<form action="" method="post"  enctype="multipart/form-data" >
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="name">Tên sản phẩm</label>
											<input type="text" name="name" class="form-control"  placeholder="Nhập tên sản phẩm">
											<form:errors cssStyle="color:red" path="objPro.name"></form:errors>
										</div>
										
										<div class="form-group">
											<label>Danh mục</label>
											<select class="form-control" name="cid">																					 
											   <c:forEach items="${listCat }" var="objCat">											
											   <option  value="${objCat.cid }">${objCat.cname }</option>
											   </c:forEach>
											</select>
										</div>
										
									
										<div class="form-group">
											<label>Thêm hình ảnh</label>
											<input type="file" name="picturePre" class="btn btn-default" id="exampleInputFile1" multiple="multiple">
											
											<p class="help-block"><em>Ảnh dạng: jpg, png, jpeg,...</em></p>
										</div>
										
										<div class="form-group">
										   <label>Mô tả</label>
										   <textarea class="form-control" rows="10"  id = "mota" name="description"></textarea>
										   	<form:errors cssStyle="color:red" path="objPro.description"></form:errors>
										</div>
										
										<div class="form-group">
										   <label>Chi tiết</label>
										   <textarea class="form-control" rows="10" id="chitiet" name="detail"></textarea>
										</div>
										
										<div class="form-group">
											<label for="name">Giá</label>
											<input type="" name="price"  class="form-control" placeholder="Nhập giá sản phẩm">
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

							</div>
						</div>
			  		</div>
			  		</form>
			  		
	  			</div>
	  			<script>
			 var editor = CKEDITOR.replace( 'mota');
		</script>
	  			<script>
			 var editor = CKEDITOR.replace( 'chitiet');
			 CKFinder.setupCKEditor(editor,'${pageContext.request.contextPath}/resources/admin/ckfinder/');
		</script>