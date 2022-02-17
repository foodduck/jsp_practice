<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = "guest";
	id = (String) session.getAttribute("cusid");
%>    
<%
if(id.equals("admin") && id!=null) {
%>
	<br>
	<header class="hd container">
        <a class="navbar-brand" href="index.jsp">일산 쇼핑몰</a>
        <nav class="tnb">
        	<ul>
				<li><a href="GetInformListCtrl">게시판 관리</a></li>
				<li><a href="GetCustomListCtrl">회원 관리</a></li>
				<li><a href="GetProListCtrl">상품 관리</a></li>
				<li><a href="LogoutCtrl">로그아웃</a></li>
        	</ul>
        </nav>
		<nav class="navbar navbar-inverse navbar-static-top" id="gnb">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">메뉴</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li class="active"><a href="index.jsp">Home</a></li>
                <li><a href="company.jsp">About</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Product <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                  	<li class="dropdown-header">의류</li>
                    <li><a href="#">블라우스</a></li>
                    <li><a href="#">셔츠</a></li>
                    <li><a href="#">바지</a></li>
                    <li><a href="#">스커트</a></li>
                    <li class="divider"></li>
                    <li class="dropdown-header">잡화</li>
                    <li><a href="#">란제리</a></li>
                    <li><a href="#">양말</a></li>
                    <li class="divider"></li>
                    <li class="dropdown-header">액세서리</li>
                    <li><a href="#">벨트</a></li>
                    <li><a href="#">헤어밴드</a></li>
                  </ul>
                </li>
                <li><a href="notice.jsp">Community</a></li>
                <li><a href="service.jsp">Service</a></li>
              </ul>
            </div>
          </div>
        </nav>
	</header>
<%
	} else if(id=="guest" || id==null){
		response.sendRedirect("login.jsp");
	} else {
		response.sendRedirect("index.jsp");
	}
%>