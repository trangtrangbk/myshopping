<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="Utils.StringUtils"%>
<%@include file="/WEB-INF/templates/taglib.jsp"%>
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- Product main img -->
            <div class="col-md-5 col-md-push-2">
                <div id="product-main-img">
                    <c:forEach var="picture" items="${objPro.getPicture()}">
                        <div class="product-preview">
                            <img src="${pageContext.request.contextPath }/resources/public/img/${picture}" alt="">
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- /Product main img -->

            <!-- Product thumb imgs -->
            <div class="col-md-2  col-md-pull-5">
                <div id="product-imgs">
                    <c:forEach var="picture" items="${objPro.getPicture()}">
                        <div class="product-preview">
                            <img src="${pageContext.request.contextPath }/resources/public/img/${picture}" alt="">
                        </div>
                    </c:forEach>                  
                </div>
            </div>
            <!-- /Product thumb imgs -->

            <!-- Product details -->
            <div class="col-md-5">
                <div class="product-details">
                    <h2 class="product-name">${objPro.name}</h2>
                    <div>
                        <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <a class="review-link" href="#">10 Nhận xét | Thêm nhận xét của bạn</a>
                    </div>
                    <div>
                        <h3 class="product-price">${en.format(objPro.price)}đ</h3>
                        <span class="product-available">CÒN HÀNG</span>
                    </div>
                    <h4 class="footer-title">THÔNG SỐ</h4>
                    <p>${objPro.name}</p>
                    <P>CPU: ${objPro.cpu}</P>
                    <P>RAM: ${objPro.ram}</P>
                    <P>HDD: ${objPro.hdd}</P>
                    <P>VGA: ${objPro.vga}</P>
                    <P>LCD: ${objPro.lcd}</P>
                    <P>PIN: ${objPro.pin}</P>
                    <P>OS: ${objPro.os}</P>

                    <div class="product-options">

                        <label>
                            MÀU
                            <select class="input-select">
                                <option value="0">BẠC</option>
                            </select>
                        </label>
                    </div>

                    <div class="add-to-cart">
                        <div class="qty-label">
                            SỐ LƯỢNG
                            <div class="input-number">
                                <input type="number" value="1" var="qty">
                                <span class="qty-up">+</span>
                                <span class="qty-down">-</span>
                            </div>
                        </div>
                        <c:url var="urlCart" value="/checkout"></c:url>
                        <button class="add-to-cart-btn"><a   href="${urlCart}" title=""><i class="fa fa-shopping-cart"></i> THÊM VÀO GIỎ HÀNG</a></button>
                    </div>


                </div>
            </div>
            <!-- /Product details -->

            <!-- Product tab -->
            <div class="col-md-12">
                <div id="product-tab">
                    <!-- product tab nav -->
                    <ul class="tab-nav">
                        <li class="active"><a data-toggle="tab" href="#tab1">MÔ TẢ</a></li>
                        <li><a data-toggle="tab" href="#tab2">CHI TIẾT</a></li>
                        <li><a data-toggle="tab" href="#tab3">NHẬN XÉT</a></li>
                    </ul>
                    <!-- /product tab nav -->

                    <!-- product tab content -->
                    <div class="tab-content">
                        <!-- tab1  -->
                        <div id="tab1" class="tab-pane fade in active">
                            <div class="row">
                                <div class="col-md-12">
                                    <p>Laptop HP 348 G5 7CS02PA cũng sở hữu thiết kế khá đặc trưng của những sản phẩm HP với những đường nét cứng cáp, bo tròn góc rất thẩm mỹ. Các chi tiết trên thân máy đều được chăm chút tỉ mỉ, kết hợp với phần khung chắc chắn cho máy khả năng chống chịu va đập tốt và bền bỉ trong quá trình sử dụng. Màn hình 14" diagonal HD anti-glare slim LED-backlit (1366 x 768) cho hình ảnh rõ ràng, sắc nét.</p>
                                </div>
                            </div>
                        </div>
                        <!-- /tab1  -->

                        <!-- tab2  -->
                        <div id="tab2" class="tab-pane fade in">
                            <div class="row">
                                <div class="col-md-12">
                                    <h5 class="footer-title">Xử lý đa nhiệm mượt mà</h5>
                                    <p>Laptop HP 348 G5 7CS02PA được trang bị bộ vi xử lý Intel Core i7 7020U 2.30 GHz up to 3.50 GHz, 4MB dung lượng RAM 4GB, giúp hoạt động mượt mà, xử lý đa nhiệm tốt. ổ đĩa cứng 500GB giúp bạn lưu trữ được các dữ liệu và cài đặt phần mềm cần thiết. Máy được trang bị đầu đủ các kết nối cần thiết như USB 2.0, USB 3.0, cổng mạng LAN, HDMI, đầu đọc thẻ SD. Đặc biệt máy còn có cả ổ đĩa quang, nếu không dùng tới ổ này thì người dùng cũng có thể dễ dàng tận dụng để nâng cấp ổ cứng cho máy.</p>
                                    <h5 class="footer-title">Phím bấm thoải mái</h5>
                                    <p>Cũng như các sản phẩm cùng dòng thì Laptop HP 348 G5 7CS02PA cũng đc trang bị bàn phím Chiclet hiện đại với khoảng cách phím hợp lý đem lại cảm giác vô cùng thoải mái khi thao tác. Ngoài ra máy cũng đc trang bị bảo mật vân tay đem đến sự an toàn cho người sử dụng.</p>
                                    <h5 class="footer-title">Kết luận</h5>
                                    <p>Laptop HP 348 G5 7CS02PA sở hữu một cấu hình vô cùng mạnh mẽ cùng với thiết kế cứng cáp nhưng cũng không kém phần thẩm mỹ nhưng lại có một mứa giá vô cùng hợp lý sẽ là một trong số những sự lựa chọn rất đáng được chú ý. </p>
                                </div>
                            </div>
                        </div>
                        <!-- /tab2  -->

                        <!-- tab3  -->
                        <div id="tab3" class="tab-pane fade in">
                            <div class="row">
                                <!-- Rating -->
                                <div class="col-md-3">
                                    <div id="rating">
                                        <div class="rating-avg">
                                            <span>4.5</span>
                                            <div class="rating-stars">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-o"></i>
                                            </div>
                                        </div>
                                        <ul class="rating">
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div style="width: 80%;"></div>
                                                </div>
                                                <span class="sum">3</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div style="width: 60%;"></div>
                                                </div>
                                                <span class="sum">2</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div></div>
                                                </div>
                                                <span class="sum">0</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div></div>
                                                </div>
                                                <span class="sum">0</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div></div>
                                                </div>
                                                <span class="sum">0</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /Rating -->

                                <!-- Reviews -->
                                <div class="col-md-6">
                                    <div id="reviews">
                                        <ul class="reviews">
                                            <li>
                                                <div class="review-heading">
                                                    <h5 class="name">Tuấn</h5>
                                                    <p class="date">27 DEC 2018, 8:0 PM</p>
                                                    <div class="review-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o empty"></i>
                                                    </div>
                                                </div>
                                                <div class="review-body">
                                                    <p>có lắp thêm ổ cứng SSD cho máy không ạ, giá bao nhiêu thế ạ ?</p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="review-heading">
                                                    <h5 class="name">Thu Hoài</h5>
                                                    <p class="date">27 DEC 2018, 8:0 PM</p>
                                                    <div class="review-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o empty"></i>
                                                    </div>
                                                </div>
                                                <div class="review-body">
                                                    <p>Em mua máy được hơn 1 tuần rồi mà nó cứ hiển thị phải kích hoạt Windows thì sao ạ</p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="review-heading">
                                                    <h5 class="name">Tình</h5>
                                                    <p class="date">27 DEC 2018, 8:0 PM</p>
                                                    <div class="review-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o empty"></i>
                                                    </div>
                                                </div>
                                                <div class="review-body">
                                                    <p>Word với excel khi mua máy đã có chưa ạ</p>
                                                </div>
                                            </li>
                                        </ul>
                                        <ul class="reviews-pagination">
                                            <li class="active">1</li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">4</a></li>
                                            <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /Reviews -->

                                <!-- Review Form -->
                                <div class="col-md-3">
                                    <div id="review-form">
                                        <form class="review-form">
                                            <input class="input" type="text" placeholder="Tên">
                                            <input class="input" type="email" placeholder="Email">
                                            <textarea class="input" placeholder="Nhận xét của bạn"></textarea>
                                            <div class="input-rating">
                                                <span>Đánh giá: </span>
                                                <div class="stars">
                                                    <input id="star5" name="rating" value="5" type="radio"><label for="star5"></label>
                                                    <input id="star4" name="rating" value="4" type="radio"><label for="star4"></label>
                                                    <input id="star3" name="rating" value="3" type="radio"><label for="star3"></label>
                                                    <input id="star2" name="rating" value="2" type="radio"><label for="star2"></label>
                                                    <input id="star1" name="rating" value="1" type="radio"><label for="star1"></label>
                                                </div>
                                            </div>
                                            <button class="primary-btn">Gửi</button>
                                        </form>
                                    </div>
                                </div>
                                <!-- /Review Form -->
                            </div>
                        </div>
                        <!-- /tab3  -->
                    </div>
                    <!-- /product tab content  -->
                </div>
            </div>
            <!-- /product tab -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- Section -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <div class="col-md-12">
                <div class="section-title text-center">
                    <h3 class="title">Sản phẩm liên quan</h3>
                </div>
            </div>

         
            <!-- product -->
                    <c:forEach items="${listRelated}" var="objPro">
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <c:url var="urlDetail" value="/detail/${StringUtils.makeSlug(objPro.name)}-${objPro.id }"></c:url>
                                    <div class="product-img">
                                    <c:set var="picture" value="${proDAO.getFistPicture(objPro) }"></c:set>
                                    <img style="display: block; height: 200px; max-width: 200px;" src="${pageContext.request.contextPath }/resources/public/img/${picture}" alt="">
                                    <div class="product-label">
                                        <span class="sale">-30%</span>
                                        <span class="new">NEW</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Laptop</p>
                                    <h3 class="product-name"><a href="${urlDetail}"><p>${objPro.name }</p></a></h3>
                                    <h4 class="product-price">${en.format(objPro.price)}đ </h4>                      
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> <a href="javascript:void(0)" title=""
                                                                                                           onclick="addcart(${objPro.id})">Thêm vào giỏ hàng</a></button>
                                </div>
                            </div>
                            <script type="text/javascript">
                                function addcart(id) {
                                    alert("Đã thêm vào giỏ hàng");
                                    $.ajax({
                                        url: '<%=request.getContextPath()%>/cart/add',
                                        type: 'POST',
                                        cache: false,
                                        data: {id: id},
                                        success: function (data) {
                                            $('#cart').html(data);
                                        },
                                        error: function () {
                                            alert('Có lỗi xảy ra');
                                        }
                                    });
                                    return false;
                                }
                            </script>
                        </div>
                    </c:forEach>
                    <!-- /product -->


            <div class="clearfix visible-sm visible-xs"></div>

            <!-- product -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /Section -->