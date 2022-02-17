<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="card-body">
	<h3>Receive</h3>
	<p>x: ${param.x }, y: ${param.y }</p>
	<!-- 만약 에러가 날 경우 -->
	<c:catch var="error">
	<%
		int x = Integer.parseInt(request.getParameter("x"));
		int y = Integer.parseInt(request.getParameter("y"));
	%>
	x: <%=x %>, y: <%=y %>
	</c:catch>
	<c:if test="${!empty error }"><!-- 에러 메시지가 있으면 그 메시지를 출력  -->
		<p>Error: ${error }</p>
	</c:if>
</div>	
</body>
</html>