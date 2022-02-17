package com.shop.view;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.biz.ProlistDAO;
import com.shop.model.ProlistVO;

@WebServlet("/GetProCtrl")
public class GetProCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int proid = Integer.parseInt(request.getParameter("proid"));
		
		ProlistVO vo = new ProlistVO();
		vo.setProid(proid);
		
		ProlistDAO dao = new ProlistDAO();
		ProlistVO pro = dao.getPro(vo);
		
		if(pro != null) {
			request.setAttribute("pro", pro);
			RequestDispatcher view = request.getRequestDispatcher("getPro.jsp");
			view.forward(request, response);
		} else {
			response.sendRedirect("GetProListCtrl");
		}
	}
}