<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - import</title>
</head>
<body>
	<h2>import</h2>
	<p>다른 문서의 내용을 가져오면서 전달값을 변경하여 가져오기</p>
	<c:import url="D05Catch.jsp">
		<c:param name="x" value="1234"/>
		<c:param name="y" value="4321"/>
	</c:import>
	<hr>
	<h3>URL</h3>
	<c:url var="D6" value="D05Catch.jsp"/>
	<c:import url="${D6 }">
		<c:param name="x" value="1111"/>
		<c:param name="y" value="2222"/>
	</c:import>
	<hr>
	<h3>OUT</h3>
	<c:set var="num" value="4331" />
	<c:out value="${num }" /><br>
	<c:out value="<h3>OUT test</h3>" />
	<c:url var="a1" value="http://www.naver.com" />
	<c:url var="a2" value="http://www.daum.net" />
	<c:url var="a3" value="http://www.google.com" />
	<c:set var="tag1" value="<a href='${a1 }'>네이버</a>"/>
	<c:set var="tag1" value="<a href='${a2 }'>다음</a>"/>
	<c:set var="tag1" value="<a href='${a3 }'>구글</a>"/>
	<ul>
		<li>${tag1 }</li>
		<li>${tag2 }</li>
		<li>${tag3 }</li>
	</ul>
	<p>만약, set으로 저장된 내용 중에서 태그를 인식 못하는 경우는 그 값을 태그로 out을 활용해 인식 할 수 있다.</p>
	<c:set var="str" value="<header><h2>헤더</h2></header>"/>
	<c:out value="${str }" escapeXml="false"/><br>	<!-- 태그로 인식하지 않고 그대로 출력 -->
	<c:out value="${str }" escapeXml="true"/><br>	<!-- 태그로 인식하고 출력 -->
	<c:out value="${x }" escapeXml="true" default="내용이 없습니다."/><br>
</body>
</html>