package com.shop.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.shop.biz.CustomDAO2;
import com.shop.model.CustomVO;

@WebServlet("/UserIdCheckCtrl")
public class UserIdCheckCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String cusid = request.getParameter("userid");
		
		CustomVO vo = new CustomVO();
		vo.setCusid(cusid);
		
		CustomDAO2 dao = new CustomDAO2();
		int res = dao.getIdCheck(vo); 
	
		Gson gson = new Gson();	//json으로 온 데이터를 받아오는 객체
		JsonObject obj = new JsonObject();	 //json으로 변환하여 보낼 객체
		
		if(res==0) {
			obj.addProperty("result", "no");
		} else {
			obj.addProperty("result", "yes");
		}
		
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(obj));
	}
}