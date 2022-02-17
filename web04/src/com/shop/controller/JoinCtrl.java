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

@WebServlet("/JoinCtrl")
public class JoinCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String cusid = request.getParameter("cusid");
		String cuspw = request.getParameter("cuspw");
		String cusname = request.getParameter("cusname");
		String cusemail = request.getParameter("cusemail");
		String custel = request.getParameter("custel");
		String zipcode = request.getParameter("zipcode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		
		CustomVO vo = new CustomVO();
		vo.setCusid(cusid);
		vo.setCuspw(cuspw);
		vo.setCusname(cusname);
		vo.setCusemail(cusemail);
		vo.setCustel(custel);
		vo.setZipcode(zipcode);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		
		CustomDAO2 dao = new CustomDAO2();
		CustomVO custom = new CustomVO();
		//받을객체 = DAO객체명.메서드명(vo)
		int cnt = dao.addCustom(vo);
		HttpSession session = request.getSession();
		
		if(cnt>0) {
			response.sendRedirect("login.jsp");
		}  else {
			response.sendRedirect("join.jsp");
		}
	}
}