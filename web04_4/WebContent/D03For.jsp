<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page import = "java.util.ArrayList" %>
<%
	String[] names = {"kim", "lee", "park", "choi"};
	ArrayList<String> list = new ArrayList<String>();
	list.add("blue");
	list.add("red");
	list.add("yellow");
	list.add("black");
	list.add("brown");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL-For</title>
</head>
<body>
	<div class="card-body">
		<h2>for</h2>
		<c:set var="result" value="0"/>
		<c:forEach var="i" begin="1" end="100" step="2">
			<c:set var="result" value="${result + i }" />
		</c:forEach>	
		<p>1부터 100까지의 홀수의 합: ${result }</p>
		<hr>
		<h3>Array의 For</h3>
		<c:forEach items="${names }" var="item">
			<p>${item }</p>
		</c:forEach>
		<hr>
		<h3>ArrayList의 For</h3>
		<c:forEach items="${list }" var="item">
			<p>${item }</p>
		</c:forEach>
		<hr>
		<h3>Map의 For</h3>
		<c:forEach items="${personMap }" var="item">
			<p>${item.name }</p>
			<p>${item.age }</p>
			<p>${item.address }</p>
		</c:forEach>
		<table class="tb">
			<thead>
				<tr>
					<th>
					<th>
					<th>
					<th>
					<th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${memberList }" var "item" varStatus="status">
				<tr>
					<td>${item.num }</td>
					<td>${item.id }</td>
					<td>${item.name }</td>
					<td>${item.email }</td>
					<td>${item.tel }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<h3>ForToken</h3>
		<p>하나의 문자열데이터가 구분기호로 분리가 가능한 형태일 경우</p>
		<c:forToken items="A/B/C/D" delims="/" var="item">
			<p>${item }</p>
		</c:forToken>
		<br>
		<c:forToken items="A/B*C D" delims="/* " var="item">
			<p>${item }</p>
		</c:forToken>
		<br>
	</div>
</body>
</html>