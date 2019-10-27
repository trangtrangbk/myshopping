<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="row">
	  				<div class="col-md-12 panel-info">
			  			<div class="content-box-header panel-heading">
		  					<div class="panel-title ">Sửa sản phẩm</div>
			  			</div>
			  			<form:errors path="objPro.*"></form:errors>
			  			
			  			<div class="content-box-large box-with-header">
				  			<div>
								<div class="row mb-10"></div>
								<form action="" method="post"  enctype="multipart/form-data" >
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="name">Tên sản phẩm</label>
											<input type="text" name="name" class="form-control" value = "${objPro.name }" placeholder="Nhập tên sản phẩm">
											<form:errors cssStyle="color:red" path="objPro.name"></form:errors>
										</div>
										
										<div class="form-group">
											<label>Danh mục</label>
											<select class="form-control" name="cid">																					 
											   <c:forEach items="${listCat }" var="objCat">
											   <c:choose>
												<c:when test="${objCat.cid == objPro.cat.cid}">
													<c:set var="select" value="selected='selected'"></c:set>
												</c:when>
												<c:otherwise>
													<c:set var = "select" value = ""></c:set>
												</c:otherwise>
											</c:choose>	
											   <option ${select } value="${objCat.cid }">${objCat.cname }</option>
											   </c:forEach>
											</select>
										</div>
										
										<div class="form-group">
											<label>Trạng thái</label>
											<select class="form-control" name="status">									 
											  <option  value="1">Còn hàng</option>		
											  <option  value="0">Hết hàng</option>											 
											</select>
										</div>

										<div class="form-group">
											<label>Sửa hình ảnh</label>
											<input type="file" name="picturePre" class="btn btn-default" id="exampleInputFile1" multiple="multiple">
											<c:forEach var="pic" items="${listName }">
											<img class="picture_land" src="${pageContext.request.contextPath }/fileUpload/${pic }" />
											</c:forEach>
											<p class="help-block"><em>Ảnh dạng: jpg, png, jpeg,...</em></p>
										</div>
											<div class="form-group">
											<label for="name">Giá</label>
											<input type="number" name="price" value = "${objPro.price }" class="form-control" placeholder="Nhập giá sản phẩm">
										</div>									
										<div class="form-group">
										   <label>Mô tả</label>
										   <textarea class="form-control" rows="10" id = "mota"name="description">${objPro.description } </textarea>
										   	<form:errors cssStyle="color:red" path="objPro.description"></form:errors>
										</div>										
										<div class="form-group">
										   <label>Chi tiết</label>
										   <textarea class="form-control" rows="10" id = "chitiet" name="detail">${objPro.detail } </textarea>
										</div>																			
									</div>
									<div class="col-sm-6" style="border: 1px solid #dddddd; border-radius: 10px; padding: 10px; background-color:#F8F8F8">		
						<div class="col-sm-12">	<label >THÔNG SỐ KỸ THUẬT</label> 
						</div>										
								<div class="col-sm-6">
									<div class="form-group">
										<label for="ram">RAM</label> <input type="text" name="ram"
											class="form-control" value = "${objPro.ram }" placeholder="ram" value=>
										<form:errors cssStyle="color:red" path="objPro.ram"></form:errors>
									</div>
									<div class="form-group">
										<label for="hdd">HDD</label> <input type="text" name="hdd"
											class="form-control" value = "${objPro.hdd }" placeholder="hdd">
										<form:errors cssStyle="color:red" path="objPro.hdd"></form:errors>
									</div>
									<div class="form-group">
										<label for="ram">SSD</label> <input type="text" name="ssd"
											class="form-control" value = "${objPro.ssd }" placeholder="ssd">
										<form:errors cssStyle="color:red" path="objPro.ssd"></form:errors>
									</div>
									<div class="form-group">
										<label for="ram">LCD</label> <input type="text" name="lcd"
											class="form-control" value = "${objPro.lcd }" placeholder="màn hình">
										<form:errors cssStyle="color:red" path="objPro.lcd"></form:errors>
									</div>
									<div class="form-group">
										<label for="ram">CPU</label> <input type="text" name="cpu"
											class="form-control" value = "${objPro.cpu }" placeholder="cpu">
										<form:errors cssStyle="color:red" path="objPro.cpu"></form:errors>
									</div>
								</div>
								<div class="col-sm-6">
								<div class="form-group">
										<label for="ram">Pin</label> <input type="text" name="pin"
											class="form-control" value = "${objPro.pin }" placeholder="pin">
										<form:errors cssStyle="color:red" path="objPro.pin"></form:errors>
									</div>
									<div class="form-group">
										<label for="hdd">Hệ điều hành</label> <input type="text" name="os"
											class="form-control" value = "${objPro.os }" placeholder="hệ điều hành">
										<form:errors cssStyle="color:red" path="objPro.os"></form:errors>
									</div>
									<div class="form-group">
										<label for="ram">Trọng lượng (kg)</label> <input type="text" name="weight"
											class="form-control" value = "${objPro.weight }" placeholder="trọng lượng">
										<form:errors cssStyle="color:red" path="objPro.weight"></form:errors>
									</div>
									<div class="form-group">
										<label for="ram">VGA</label> <input type="text" name="vga"
											class="form-control" value = "${objPro.vga }" placeholder="vga">
										<form:errors cssStyle="color:red" path="objPro.vga"></form:errors>
									</div>
									<div class="form-group">
										<label for="ram">Màu sắc</label> <input type="text" name="color"
											class="form-control" value = "${objPro.color }" placeholder="color">
										<form:errors cssStyle="color:red" path="objPro.color"></form:errors>
									</div>
								</div>
								<div class="col-sm-12">	
								<div class="form-group">
										<label for="other">Thông số khác</label> </br>										 
											<textarea class="form-control"  name="other" rows="20" cols="75%">${objPro.other }</textarea>
										<form:errors cssStyle="color:red" path="objPro.color"></form:errors>
									</div>								
						</div>	
						</div>								
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
	  			</div><!-- /.row col-size -->
	  			<script>
			 var editor = CKEDITOR.replace( 'mota');
		</script>
	  			<script>
			 var editor = CKEDITOR.replace( 'chitiet');
			 CKFinder.setupCKEditor(editor,'${pageContext.request.contextPath}/resources/admin/ckfinder/');
		</script>