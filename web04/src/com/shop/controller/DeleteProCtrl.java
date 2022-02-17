package com.shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.biz.ProlistDAO;
import com.shop.model.ProlistVO;

@WebServlet("/DeleteProCtrl")
public class DeleteProCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		int proid = Integer.parseInt(request.getParameter("proid"));
		int cnt = 0;
		ProlistVO vo = new ProlistVO();
		vo.setProid(proid);
		
		ProlistDAO dao = new ProlistDAO();
		cnt = dao.deletePro(vo);
		if(cnt!=0) response.sendRedirect("GetProListCtrl");
	}
}