package com.shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.biz.ProlistDAO;
import com.shop.model.ProlistVO;

@WebServlet("/AddProCtrl")
public class AddProCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String protype = request.getParameter("protype");
		String proname = request.getParameter("proname");
		String procom = request.getParameter("procom");
		int price = Integer.parseInt(request.getParameter("price"));
		int num = Integer.parseInt(request.getParameter("cnt"));
		String imgdata = request.getParameter("imgdata");
		
		ProlistVO vo = new ProlistVO();
		vo.setProtype(protype);
		vo.setProname(proname);
		vo.setProcom(procom);
		vo.setPrice(price);
		vo.setCnt(num);
		vo.setImgData(imgdata);
		
		ProlistDAO dao = new ProlistDAO();
		int cnt = dao.addPro(vo);
		
		if(cnt != 0) {
			response.sendRedirect("GetProListCtrl");
		} else {
			response.sendRedirect("addPro.jsp");
		} 
	}

}
