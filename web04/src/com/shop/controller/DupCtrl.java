package com.shop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.biz.CustomDAO2;
import com.shop.model.CustomVO;

@WebServlet("/DupCtrl")
public class DupCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String cusid = request.getParameter("cusid");
		if(cusid==null) {
			response.sendRedirect("idcheck.jsp?pass=1");	
		}
		CustomVO vo = new CustomVO();
		vo.setCusid(cusid);
		
		CustomDAO2 dao = new CustomDAO2();
		//받을객체 = DAO객체명.메서드명(vo)
		int cnt = dao.dupCheck(vo);
		response.sendRedirect("idcheck.jsp?pass="+cnt);
	}
}