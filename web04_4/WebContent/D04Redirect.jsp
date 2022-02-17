<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - Redirect</title>
</head>
<body>
	<div class="card-body">
	<h2>Redirect</h2>
	<c:redirect url="D05Catch.jsp">
		<c:param name="x" value="123" />
		<c:param name="y" value="321" />
	</c:redirect>
	</div>
</body>
</html>