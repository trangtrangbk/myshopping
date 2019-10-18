<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<tiles:insertAttribute name="header"/>
<!-- products-breadcrumb -->
	<div class="products-breadcrumb">
		<div class="container">
			<ul>
				<li><i class="fa fa-home" aria-hidden="true"></i><a href="${pageContext.request.contextPath }">Trang chủ</a><span>|</span></li>
				<li>${cname }</li>
			</ul>
		</div>
	</div>
	<div class="banner">
<tiles:insertAttribute name="left-bar"/>
		<tiles:insertAttribute name="content"/>
		<div class="clearfix"></div>
	</div>
<!-- //banner -->
<tiles:insertAttribute name="footer"/>