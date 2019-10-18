<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp"%>
<div class="sidebar" data-color="white" data-active-color="danger">
	<!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
	<div class="logo">
		<a class="simple-text logo-mini">
			<div class="logo-image-small">
				<img
					src="${pageContext.request.contextPath }/resources/admin/img/logo-small.png">
			</div>
		</a> <a class="simple-text logo-normal"> ${name } </a>
		<div class="left-pro">
			<a href="${pageContext.request.contextPath}/admin/user/edit-profile">Edit</a>
			<a href="${pageContext.request.contextPath}/logout">Logout</a>
		</div>
	</div>
	<div class="sidebar-wrapper">
		<ul class="nav">
		<c:choose>
			<c:when test="${id_current == 1 }">
				<c:set var="activeHome" value="class='active '"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="activeHome" value=""></c:set>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${id_current == 2 }">
				<c:set var="activeCat" value="class='active '"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="activeCat" value=""></c:set>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${id_current == 3 }">
				<c:set var="activePro" value="class='active '"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="activePro" value=""></c:set>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${id_current == 4 }">
				<c:set var="activeOrder" value="class='active '"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="activeOrder" value=""></c:set>
			</c:otherwise>
		</c:choose>
		
			<c:choose>
			<c:when test="${id_current == 5 }">
				<c:set var="activeSlide" value="class='active '"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="activeSlide" value=""></c:set>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${id_current == 6}">
				<c:set var="activeGiftCode" value="class='active '"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="activeGiftCode" value=""></c:set>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${id_current == 7 }">
				<c:set var="activeUser" value="class='active '"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="activeUser" value=""></c:set>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${id_current == 8 }">
				<c:set var="activeCont" value="class='active '"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="activeCont" value=""></c:set>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${id_current == 9 }">
				<c:set var="activeCus" value="class='active '"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="activeCus" value=""></c:set>
			</c:otherwise>
		</c:choose>
		
			<c:choose>
			<c:when test="${id_current == 10 }">
				<c:set var="activeRevenue" value="class='active '"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="activeRevenue" value=""></c:set>
			</c:otherwise>
		</c:choose>
			<li ${activeHome }><a
				href="${pageContext.request.contextPath }/admin"> <i
					class="nc-icon nc-bank"></i>
					<p>Trang chủ</p>
			</a></li>

			<li ${activeCat }><a
				href="${pageContext.request.contextPath }/admin/cat"> <i
					class="nc-icon nc-paper"></i>
					<p>Danh mục</p>
			</a></li>

			<li ${activePro }><a href="${pageContext.request.contextPath }/admin/product">
					<i class="nc-icon nc-tile-56"></i>
					<p>Sản phẩm</p>
			</a></li>
			
			<li ${activeOrder }><a href="${pageContext.request.contextPath }/admin/order">
					<i class="nc-icon nc-delivery-fast"></i>
					<p>Đơn hàng <span style="color:red">(${newOrder })</span></p>
			</a></li>
			
			
			<li ${activeRevenue }><a href="${pageContext.request.contextPath }/admin/revenue">
					<i class="nc-icon nc-delivery-fast"></i>
					<p>Doanh thu</p>
			</a></li>
			
			<li ${activeSlide }><a href="${pageContext.request.contextPath }/admin/slide">
					<i class="nc-icon nc-album-2"></i>
					<p>Slide</p>
			</a></li>
			
			
			<li ${activeGiftCode }><a href="${pageContext.request.contextPath }/admin/giftcode">
					<i class="nc-icon nc-money-coins"></i>
					<p>Mã giảm giá</p>
			</a></li>
			
			<li ${activeUser }><a href="${pageContext.request.contextPath }/admin/user">
					<i class="nc-icon nc-single-02"></i>
					<p>User</p>
			</a></li>
			<li ${activeCus }><a href="${pageContext.request.contextPath }/admin/customer/index">
					<i class="nc-icon nc-circle-10"></i>
					<p>Khách hàng</p>
			</a></li>

			<li ${activeCont }><a href="${pageContext.request.contextPath }/admin/contact">
					<i class="nc-icon nc-send"></i>
					<p>Liên hệ</p>
			</a></li>
		</ul>
	</div>
</div>