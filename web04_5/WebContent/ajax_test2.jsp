<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
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
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@localhost:1521:xe";		//orcl
	String id = "system";
	String pw = "1234";
	String sql;
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");

	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, id, pw);
		sql = "select * from ajax_member where userid=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, userid);
		rs = stmt.executeQuery();
		
		Gson gson = new Gson();	//json으로 온 데이터를 받아오는 객체
		JsonObject obj = new JsonObject();	 //json으로 변환하여 보낼 객체
		
		if(rs.next()){		//입력된 아이디가 현재 회원 테이블에 존재하면,
			obj.addProperty("result", "no");	//사용 불가능한 아이디
		} else {
			obj.addProperty("result","yes");	//사용 가능한 아이디
		}
		
		out.print(gson.toJson(obj));
		rs.close();
		stmt.close();
		conn.close();
	} catch(ClassNotFoundException e) {
		System.out.println("드라이버 로딩이 실패되었습니다.");
		e.printStackTrace();
	} catch(SQLException e) {
		System.out.println("DB 연결이 실패되었거나 SQL 구문을 처리하지 못했습니다..");
		e.printStackTrace();		
	}
%>
</body>
</html>