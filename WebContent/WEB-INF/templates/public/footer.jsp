<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<footer id="footer">
    <!-- top footer -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row" style= "display: flex;justify-content: center;">
                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Về chúng tôi</h3>

                        <ul class="footer-links">
                            <li><a href="#"><i class="fa fa-map-marker"></i>54 Nguyễn Lương Bằng-Đà Nẵng</a></li>
                            <li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
                            <li><a href="#"><i class="fa fa-envelope-o"></i>mega_t@email.com</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Danh mục</h3>
                        <ul class="footer-links">
                            <li><a href="${pageContext.request.contextPath }">Trang chủ</a></li>
                            <li><a href="${pageContext.request.contextPath }/contact">Liên hệ</a></li>

                        </ul>
                    </div>
                </div>

                <div class="clearfix visible-xs"></div>

               

             
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /top footer -->

    <!-- bottom footer -->
    <div id="bottom-footer" class="section">
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12 text-center">
                    <ul class="footer-payments">
                        <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                        <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                    </ul>
                    <span class="copyright">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="${pageContext.request.contextPath }" target="_blank">Mega-T</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </span>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /bottom footer -->
</footer>
<!-- jQuery Plugins -->
<script src="${pageContext.request.contextPath }/resources/public/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/public/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/public/js/slick.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/public/js/nouislider.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/public/js/jquery.zoom.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/public/js/main.js"></script>

<script>
                                                    window.onscroll = function () {
                                                        myFunction()
                                                    };

                                                    // Get the header
                                                    var header = document.getElementById("myHeader");

                                                    // Get the offset position of the navbar
                                                    var sticky = header.offsetTop;

                                                    // Add the sticky class to the header when you reach its scroll position. Remove "sticky" when you leave the scroll position
                                                    function myFunction() {
                                                        if (window.pageYOffset > sticky) {
                                                            header.classList.add("sticky");
                                                        } else {
                                                            header.classList.remove("sticky");
                                                        }
                                                    }
</script>
</body>
</html>
