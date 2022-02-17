<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonObject" %>
<!-- ajax_test.jsp -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼 데이터를 처리하여 반환하는 페이지</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String uid = "admin";
	
	Gson gson = new Gson();	//json으로 온 데이터를 받아오는 객체
	JsonObject obj = new JsonObject();	 //json으로 변환하여 보낼 객체
	
	if(uid.equals(userid) || uid==userid){
		obj.addProperty("result", "ok");
		obj.addProperty("userid", userid);
		obj.addProperty("username", "관리자");
		obj.addProperty("email", "admin@kkt09072.com");
	} else {
		obj.addProperty("result","nothing");
	}
	
	out.print(gson.toJson(obj));
%>
</body>
</html>