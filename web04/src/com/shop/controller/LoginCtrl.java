package com.shop.controller;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.biz.CustomDAO2;
import com.shop.model.CustomVO;

@WebServlet("/LoginCtrl")
public class LoginCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String cusid = request.getParameter("cusid");
		String cuspw = request.getParameter("cuspw");
		
		CustomVO vo = new CustomVO();
		vo.setCusid(cusid);
		vo.setCuspw(cuspw);
		
		CustomVO custom = new CustomVO();
		CustomDAO2 dao = new CustomDAO2();
		//받을객체 = DAO객체명.메서드명(vo)
		custom = dao.getCustom(vo);
		HttpSession session = request.getSession();
		int level = 8;
		if((int) custom.getGrade() <= 4) {
			level = (int) custom.getGrade();
		}
		System.out.println(level);
		if(custom!=null) {
			session.setAttribute("cusid", custom.getCusid());
			session.setAttribute("cusname", custom.getCusname());
			session.setAttribute("level", custom.getGrade());
			response.sendRedirect("index.jsp");
		} else {
			response.sendRedirect("login.jsp");
		}
		/*
		 * String cid = (String) custom.getCusid(); String admin = "admin";
		 * if(Objects.equals(cid, admin) || level==1) { session.setAttribute("cusid",
		 * custom.getCusid()); session.setAttribute("cusname", custom.getCusname());
		 * session.setAttribute("level", custom.getGrade());
		 * System.out.println("관리자페이지로"); response.sendRedirect("admin.jsp"); } else
		 * if(Objects.isNull(cid) && !(Objects.equals(cid, admin))) {
		 * session.setAttribute("cusid", custom.getCusid());
		 * session.setAttribute("cusname", custom.getCusname());
		 * session.setAttribute("level", custom.getGrade());
		 * System.out.println("일반회원페이지로"); response.sendRedirect("index.jsp"); } else {
		 * response.sendRedirect("join.jsp"); }
		 */
	}
}
