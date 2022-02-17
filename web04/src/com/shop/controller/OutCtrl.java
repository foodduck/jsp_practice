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

@WebServlet("/OutCtrl")
public class OutCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String cusid = (String) session.getAttribute("cusid");
		
		CustomVO vo = new CustomVO();
		vo.setCusid(cusid);
		
		CustomDAO2 dao = new CustomDAO2();
		CustomVO custom = new CustomVO();
		//받을객체 = DAO객체명.메서드명(vo)
		int cnt = dao.deleteCustom(vo);
	
		if(cnt>0) {
			session.invalidate();
			response.sendRedirect("index.jsp");
		}  else {
			response.sendRedirect("index.jsp");
		}
	}
}