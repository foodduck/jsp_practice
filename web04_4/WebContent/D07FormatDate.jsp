<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - Format Date</title>
</head>
<body>
<div class="card-body">
	<h2>Format Date</h2>
	<c:set var="today" value="<%=new Date() %>"/>
	<p>${today }</p>
	<p>type:both - <fmt:formatDate value="${today }" type="both"/></p>
	<p>type:time - <fmt:formatDate value="${today }" type="time"/></p>
	<p>type:date - <fmt:formatDate value="${today }" type="date"/></p>
	<br>
	<h3>type: date인 경우</h3>
	<p>dateStyle : full - <fmt:formatDate value="${today }" type="date" dateStyle="full"/></p>
	<p>dateStyle : long - <fmt:formatDate value="${today }" type="date" dateStyle="long"/></p>
	<p>dateStyle : medium - <fmt:formatDate value="${today }" type="date" dateStyle="medium"/></p>
	<p>dateStyle : short - <fmt:formatDate value="${today }" type="date" dateStyle="short"/></p>
	<hr>
	<h3>type: time인 경우</h3>
	<p>dateStyle : full - <fmt:formatDate value="${today }" type="time" dateStyle="full"/></p>
	<p>dateStyle : long - <fmt:formatDate value="${today }" type="time" dateStyle="long"/></p>
	<p>dateStyle : medium - <fmt:formatDate value="${today }" type="time" dateStyle="medium"/></p>
	<p>dateStyle : short - <fmt:formatDate value="${today }" type="time" dateStyle="short"/></p>
	<hr>
	<h3>type: both인 경우</h3>
	<p>dateStyle : full - <fmt:formatDate value="${today }" type="both" timeStyle="full"/></p>
	<p>dateStyle : long - <fmt:formatDate value="${today }" type="both" timeStyle="long"/></p>
	<p>dateStyle : medium - <fmt:formatDate value="${today }" type="both" timeStyle="medium"/></p>
	<p>dateStyle : short - <fmt:formatDate value="${today }" type="both" timeStyle="short"/></p>
	<hr>
	<!--
	 d: 일, D:1월 1일부터 몇번재 날인지 E: 요일
	 h:12시간제 H:24시간제 S:밀리초 a:오전/오후
	 -->
	<h3>pattern을 활용하여 출력하는 경우</h3>
	<p> <fmt.formatDate value="${today }" pattern="YYYY/MM/dd EEEE" /></p>
	<p> <fmt.formatDate value="${today }" pattern="YY/M/d E a H:m:s" /></p>
</div>
</body>
</html>