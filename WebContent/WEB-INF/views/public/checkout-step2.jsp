<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	<%@include file="/WEB-INF/templates/taglib.jsp" %>
<div class="w3l_banner_nav_right">
	<div class="privacy about">
		<h3>
			THANH TOÁN
		</h3>
	<p style="color:red">${msg }</p>
		<div class="checkout-left">
			<div class="col-md-4 checkout-left-basket">
				
				<ul>
					
					<li>Tổng sau khi giảm: <i></i> <span  style="color:red">${en.format(sessionScope.myCartTotal) }Đ</span></li>
				</ul>
			</div>
			<div class="col-md-8 address_form_agile">
			
				<form action="${pageContext.request.contextPath }/checkout-step2" method="post"
					class="creditly-card-form agileinfo_form">
					<section class="creditly-wrapper wthree, w3_agileits_wrapper">						
						<label class="control-label">Hình thức thanh toán: </label> 	<br />
						<input type="radio" checked="checked" name="payments" value="Thanh toán sau khi nhận hàng">Thanh toán sau khi nhận hàng<br>
						<img alt="" src="${pageContext.request.contextPath }/resources/public/images/ship.png" height="70px" width="70px"><br>
						 <div id="paypal-button-container">
						<input type="radio" id="forwardStep" name="payments" value="Thanh toán với paypal "> Thanh toán với paypal <br>
						 </div>
							
							<c:choose>
												<c:when test="${customer == null }">
													<a href="${pageContext.request.contextPath }/customer/login" class="submit check_out">ĐĂNG NHẬP ĐỂ MUA HÀNG</a>
												</c:when>
												<c:otherwise>
													<button  class="submit check_out">Xác nhận</button>
												</c:otherwise>
											</c:choose>
					</section>
					<input type="hidden" value="0" id="status" name = "paid"> <!--  0 : chua thanh toan | 1 thanh toan-->
					
				</form>
				<div class="checkout-right-basket">

    <!-- Include the PayPal JavaScript SDK -->
    <script src="https://www.paypal.com/sdk/js?client-id=AU28AYNE-noSFHuxLPEE8a7dr2t6SvSObnRPHJ4wHBFjKQ6ELGT9PPyRIng7oQW3s8uiOlaoAFSBeOTO&currency=USD"></script>

    <script>
        // Render the PayPal button into #paypal-button-container
        paypal.Buttons({
        	
            // Set up the transaction
            createOrder: function(data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '${Math.round(sessionScope.myCartTotal/24000 * 1000)/100}'
                        }
                    }]
                });
            },        

            // Finalize the transaction
            onApprove: function(data, actions) {
                return actions.order.capture().then(function(details) {
                    $("#status").val(1);						                
                    actions.redirect();
                });
                // 
            }
        }).render('#paypal-button-container');
    </script>
				</div>
			</div>

			<div class="clearfix"></div>

		</div>

	</div>
</div>
<script type="text/javascript">
		function subquatity(id){
			var tmp = "#quatity-"+id;
			$.ajax({
				url: '<%=request.getContextPath()%>/cart/sub',
				type: 'POST',
				cache: false,
				data: {id: id},
				success: function(data){
					$(tmp).html(data);
				},
				error: function (){
					alert('Có lỗi xảy ra');
				}
			});
			return false;
		}
</script>

<script type="text/javascript">
			$(document).ready(function(){
				$('#forwardStep').bind('click',function(){
				  var page = $(this).attr('rel');
				  	alert('Kích vào nút Paypal để tiến hành thanh toán');
				 });
			});
		</script>


<script type="text/javascript">
		function addquatity(id){
			var tmp = "#quatity-"+id;
			$.ajax({
				url: '<%=request.getContextPath()%>/cart/addquatity',
				type: 'POST',
				cache: false,
				data: {id: id},
				success: function(data){
					$(tmp).html(data);
				},
				error: function (){
					alert('Có lỗi xảy ra');
				}
			});
			return false;
		}
		
		// nne cho 1 the script thoi 
		
</script>