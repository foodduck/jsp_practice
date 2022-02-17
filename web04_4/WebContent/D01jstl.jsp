<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바 표준 태그 라이브러리(JSTL)</title>
</head>
<body>
	<h2>Tag library : 많이 활용하는 명령이나 문서 요소를 라이브러리 형식으로 제공하므로, taglib로 선언하여 활용</h2>
	<h3>Core Tags</h3>
	c:out  표현식과 같이 활용<br>
		<c:out value="${'kim' }"/>
	c:import  특정 페이지나 자원을 불러올 때 활용<br>
		<c:import file:"header.jsp"/>
	c:set  변수와 스코프를 설정<br>
		<c:set var="age" scope="session" value="13"/>
		<c:out value= "${age }" />
	c:remove  변수를 제거할 때 활용<br>
		<c:remove var="age"/>
	c:catch  예외처리를 할 때 사용<br>
		<c:catch var="catchtheException">
		<% int x=2/0 %>
		<c:catch>
		<c:if test=
	c:if 조건분기문이 필요할 때 활용<br>
	
	c:choose, c:when, c:otherwise  선택문이 필요할 때 활용<br>
		<c:set var="score" scope="page" value="90"/>
		<c:choose>
		  <c:when test= "${score>=90 }" />
		    <p class="red">wonderful</p>
		  </c:when>
		   <c:when test= "${score>=80 }" />
		    <p class="red">good</p>
		  </c:when>
		   <c:when test= "${score>=70 }" />
		    <p class="red">ok</p>
		  </c:when>
		  <c:otherwise>
		  	<p class="red">no</p>
		  <c:otherwise>
		</c:choose> 
	c:forEach  반복문이 필요할 때 활용<br>
	c:forTokens  토큰이 있는 곳의 반복을 처리할 때 활용<br> 
	c:param  import 액션태그의 url에 지정될 매개변수를 추가할 때 활용
	c:redirect  특정 URL로 페이지를 이동하는 경우에 활용
</body>
</html>