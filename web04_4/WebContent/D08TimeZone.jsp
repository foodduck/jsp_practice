<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - TimeZone</title>
</head>
<body>
<div class="card-body">
	<h3>TimeZone</h3>
	<c:set var="today" value ="<%=new Date() %>"/>
	<h4>서울</h4>
	<p>
	  <fmt:timeZone value="Asia/Seoul">
	    <fmt:formatDate value="${today }" pattern="YYYY-MM-DD EEEE a HH:mm:sss"/>
	  </fmt:timeZone>
	</p>
	<h4>런던</h4>
	<p>
	  <fmt:timeZone value="Europe/London">
	    <fmt:formatDate value="${today }" pattern="YYYY-MM-DD EEEE a HH:mm:sss"/>
	  </fmt:timeZone>
	</p>
	<h4>뉴욕</h4>
	<p>
	  <fmt:timeZone value="America/New_York">
	    <fmt:formatDate value="${today }" pattern="YYYY-MM-DD EEEE a HH:mm:sss"/>
	  </fmt:timeZone>
	</p>
	<h4>세계표준시</h4>
	<p>
	  <fmt:timeZone value="UTC">
	    <fmt:formatDate value="${today }" pattern="YYYY-MM-DD EEEE a HH:mm:sss"/>
	  </fmt:timeZone>
	</p>
</div>
</body>
</html>