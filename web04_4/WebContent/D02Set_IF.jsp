<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - Set And IF</title>
</head>
<body>
	<div class ="card-body">
	<h3>SET</h3>
	<!-- pageContext.setAttribute("num1",10); -->
	<c:set var="num1" value="10" scope="page"/>
	<c:set var="num2" value="20" scope="page"/>
	<!-- appllication.setAttribute("num2", 20); -->
	<c:set var="num2" value="20" scope="application"/>
	<c:set var="result" value ="${num1 + num2 }"/>
	<p>Result: ${num1 } + ${num2 } = ${result }</p>
	<br>
	<h2>액션 태그 활용</h2>
	<jsp:useBean id="vo" class="com.company.model.PersonVO"/>
	<jsp:setProperty property="name" value="kim" name="vo"/>
	<jsp:setProperty property="age" value="27" name="vo"/>
	<jsp:setProperty property="address" value="행신" name="vo"/>
	<p>이름: ${vo.name }, 나이: ${vo.age }, 주소: ${vo.address }</p>
	<hr>
	<h2>JSTL 활용</h2>
	<c:set target= "${vo }" property ="name" value="jung"/><!-- 객체(reference type) target.property -->
	<c:set target= "${vo }" property ="age" value="33"/>
	<c:set target= "${vo }" property ="address" value="능곡"/>
	<p>이름: ${vo.name }, 나이: ${vo.age }, 주소: ${vo.address }</p>
	<hr>
	<h2>변수 삭제</h2>
	<c:set var="num3" value ="lee"/><!-- 기본변수 (premitive type): var-->
	<p>이름: ${num3 }</p>
	<c:remove var = "num3"/><!-- 기본변수(premitive type) -->
	<c:remove var="vo"/><!-- 객체(reference type) -->
	<h2>IF</h2>
	<c:if test= "${num1 > num2 }">
		<p></p>
	</c:if>	
	
	<h2>choose</h2>
	</div>
</body>
</html>