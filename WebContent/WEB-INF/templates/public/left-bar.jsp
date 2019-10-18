<%@page import="Utils.StringUtils"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%@include file="/WEB-INF/templates/taglib.jsp" %>
				<div class="w3l_banner_nav_left">
			<nav class="navbar nav_bottom">
			 <!-- Brand and toggle get grouped for better mobile display -->
			  <div class="navbar-header nav_2">
				  <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				  </button>
			   </div> 
			   <!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
					<ul class="nav navbar-nav nav_1">
					
						<%
						
						CategoryDAO catDAO = (CategoryDAO)request.getAttribute("catDAO");
					   List<Category> listCatPar = catDAO.getParItems();
					   if(listCatPar.size() > 0){
							for(Category item:listCatPar){   
								if(item.getParrent_id() == 0){				   
									List<Category> listItem = catDAO.getItemsByParrent_id(item.getCid());
									if(listItem.size() > 0){
						%>
						<li class="dropdown mega-dropdown active">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=item.getCname() %><span class="caret"></span></a>				
							<div class="dropdown-menu mega-dropdown-menu w3ls_vegetables_menu">
								<div class="w3ls_vegetables">
										<% 
										catDAO.ShowCategoryPublic(listCatPar, item.getCid(), response, request,out);
                                			 %>							
								</div>                  
							</div>				
						</li>
						<%}else{ %>
						<li><a href="${pageContext.request.contextPath }/cat/<%=StringUtils.makeSlug(item.getCname()) %>-<%=item.getCid()%>"><%=item.getCname() %></a></li>
						<%}}}} %>
					</ul>
				 </div><!-- /.navbar-collapse -->
			</nav>
		</div>