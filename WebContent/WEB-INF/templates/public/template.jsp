<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<tiles:insertAttribute name="header"/>
		<!-- NAVIGATION -->
		<nav id="navigation">
			<!-- container -->
			<div class="container">
				<!-- responsive-nav -->
				<div id="responsive-nav">
					<!-- NAV -->
					<ul class="main-nav nav navbar-nav">
						<li class="active"><a href="${pageContext.request.contextPath }">Trang chủ</a></li>						
						<li><a href="${pageContext.request.contextPath }/contact">Liên hệ</a></li>
					</ul>
					<!-- /NAV -->
				</div>
				<!-- /responsive-nav -->
			</div>
			<!-- /container -->
		</nav>
	<div class="banner">
		<tiles:insertAttribute name="content"/>
		<div class="clearfix"></div>
	</div>
<!-- //banner -->

<tiles:insertAttribute name="footer"/>