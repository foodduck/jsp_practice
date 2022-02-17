package com.shop.view;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.biz.CustomDAO2;
import com.shop.model.CustomVO;

@WebServlet("/MyPageCtrl")
public class MyPageCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String cusid = request.getParameter("cusid");
		
		CustomVO vo = new CustomVO();
		vo.setCusid(cusid);
		
		CustomDAO2 dao = new CustomDAO2();
		//받을객체 = DAO객체명.메서드명(vo)
		CustomVO custom = new CustomVO();
		custom = dao.myPage(vo);
		System.out.println("처리된 아이디 : "+custom.getCusid());		
		if(custom.getCusid() == null) {
			response.sendRedirect("login.jsp");
		} else {
			request.setAttribute("custom", custom);
			RequestDispatcher view = request.getRequestDispatcher("mypage.jsp");
			view.forward(request, response);
		}
	}
}