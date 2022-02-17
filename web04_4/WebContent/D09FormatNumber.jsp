<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - FormatNumber</title>
</head>
<body>
<div class="card_body">
	<h2>Format Number</h2>
	<h3>일반 숫자의 표시방법</h3>
	<c:set var="num" value ="12345.4321"/>
	<p>그룹핑: <fmt:formatNumber value="${num }" groupingUsed="true"/></p>
	<!-- 남은 자릿수의 무시 -->
	<p>표시형식1: <fmt:formatNumber value="${num }" pattern="#.##"/></p>
	<p>표시형식2: <fmt:formatNumber value="${num }" pattern="#,###,#"/></p>
	<p>표시형식3: <fmt:formatNumber value="${num }" pattern="#,###.######"/></p>
	<!-- 남은 자릿수의 채우기 -->
	<p>표시형식1: <fmt:formatNumber value="${num }" pattern="0.00"/></p>
	<p>표시형식2: <fmt:formatNumber value="${num }" pattern="0,000,0"/></p>
	<p>표시형식3: <fmt:formatNumber value="${num }" pattern="0,000.000000"/></p>
	<!-- 표준적인 방법 -->
	<p>표준 표시형식1: <fmt:formatNumber value="${num }" pattern="#,###.000"/></p>
	<hr>
	<h3>백분율 표시방법</h3>
	<p><fmt:formatNumber value="${num }" type="percent"/></p>
	<p><fmt:formatNumber value="0.5" type="percent"/></p>
	<hr>
	<h3>국가별 표시형식 활용</h3>
	<c:set var="today" value="<%=new Date() %>"/>
	<h4>대한민국</h4>
	<fmt:setLocale value="ko_KR" />
	<p><fmt:formatNumber value="${num } type="currency"/></p>
	<p><fmt:formatDate value="${today }" pattern="YYYY-MM-dd EEEE a HH:mm:ss"/></p>
	<hr>
	<h4>중국</h4>
	<fmt:setLocale value="zh_CN" />
	<p><fmt:formatNumber value="${num } type="currency"/></p>
	<p><fmt:formatDate value="${today }" pattern="YYYY-MM-dd EEEE a HH:mm:ss"/></p>
	<hr>
	<h4>대한민국</h4>
	<fmt:setLocale value="ja_JP" />
	<p><fmt:formatNumber value="${num } type="currency"/></p>
	<p><fmt:formatDate value="${today }" pattern="YYYY-MM-dd EEEE a HH:mm:ss"/></p>
	<hr>
	<h4>대한민국</h4>
	<fmt:setLocale value="zh_TW" />
	<p><fmt:formatNumber value="${num } type="currency"/></p>
	<p><fmt:formatDate value="${today }" pattern="YYYY-MM-dd EEEE a HH:mm:ss"/></p>
	<hr>
	<h4>베트남</h4>
	<fmt:setLocale value="vi_VN" />
	<p><fmt:formatNumber value="${num } type="currency"/></p>
	<p><fmt:formatDate value="${today }" pattern="YYYY-MM-dd EEEE a HH:mm:ss"/></p>
	<hr>
</div>
</body>
</html>