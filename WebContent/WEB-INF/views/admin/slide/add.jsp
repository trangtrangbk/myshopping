<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="row">
	  				<div class="col-md-12 panel-info">
			  			<div class="content-box-header panel-heading">
		  					<div class="panel-title ">Thêm slide</div>
			  			</div>
			  			
			  			
			  			<div class="content-box-large box-with-header">
				  			<div>
								<div class="row mb-10"></div>
								<form action="" method="post"  enctype="multipart/form-data" >
								<div class="row">
									<div class="col-sm-6">
										
										<div class="form-group">
											<label>Thêm hình ảnh</label>
											<input type="file" name="picture" class="btn btn-default" id="exampleInputFile1" >
											
											<p class="help-block"><em>Ảnh dạng: jpg, png, jpeg,...</em></p>
										</div>
										
										
																			
									</div>
									<div class="col-sm-6"></div>									
								</div>
								
								<hr>

								<div class="row">
									<div class="col-sm-12">
										<input type="submit" value="Thêm" class="btn btn-success" />
									</div>
								</div>

							</div>
						</div>
			  		</div>
			  		</form>
	  			</div><!-- /.row col-size -->