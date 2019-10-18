<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <div><p style="color: red">${msg }</p></div>
<div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
              <div class="card-body ">
                <div class="row">
                  <div class="col-5 col-md-4">
                  <a
				href="${pageContext.request.contextPath }/admin/cat">
                    <div class="icon-big text-center icon-warning">
                      <i class="nc-icon nc-map-big text-danger"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
                    <div class="numbers">
                      <p class="card-category">Danh mục</p>
                      <p class="card-title">${numberOfCat }
                      
                        <p>
                    </div></a>
                  </div>
                </div>
              </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">${numberOfCat } danh mục
                </div>
              </div>
            </div>
             </div> 
           
            
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats">
              <div class="card-body ">
                <div class="row">
                  <div class="col-5 col-md-4">
                  <a
				href="${pageContext.request.contextPath }/admin/product">
                    <div class="icon-big text-center icon-warning">
                      <i class="nc-icon nc-bullet-list-67 text-danger"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
                    <div class="numbers">
                      <p class="card-category">Sản phẩm</p>
                      <p class="card-title">${numberOfPro }
                        <p>
                    </div></a>
                  </div>
                </div>
              </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">${numberOfPro } sản phẩm
                </div>
              </div>
            </div>
              </div>
            
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats">
              <div class="card-body ">
                <div class="row">
                  <div class="col-5 col-md-4">
                  <a
				href="${pageContext.request.contextPath }/admin/user">
                    <div class="icon-big text-center icon-warning">
                      <i class="nc-icon nc-circle-10 text-danger"></i>
                    </div>
                  </div>
                  <div class="col-7 col-md-8">
                    <div class="numbers">
                      <p class="card-category">User</p>
                      <p class="card-title">${numberOfUser }
                        <p>
                    </div></a>
                  </div>
                </div>
              </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">${numberOfUser } user
                </div>
              </div>
            </div>
              </div>
            
          </div>