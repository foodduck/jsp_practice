package com.company.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

@WebServlet("/IdCheckCtrl")
public class IdCheckCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");		
		String userid = request.getParameter("userid");
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "system";
		String pass = "1234";
		String sql;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, pass);
			sql = "select * from mem where userid=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, userid);
			rs = stmt.executeQuery();

			Gson gson = new Gson();	//json으로 온 데이터를 받아오는 객체
			JsonObject obj = new JsonObject();	 //json으로 변환하여 보낼 객체
			
			if(rs.next()) {
				obj.addProperty("result", "no");
			} else {
				obj.addProperty("result", "yes");
			}
			
			PrintWriter out = response.getWriter();
			out.print(gson.toJson(obj));
			stmt.close();
			con.close();
		} catch(Exception e ) {
			e.printStackTrace();
			response.sendRedirect("e404.jsp");
		}
	}
}