package com.shop.view;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.biz.CustomDAO;
import com.shop.model.CustomVO;

@WebServlet("/GetCustomCtrl")
public class GetCustomCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cusid = request.getParameter("cusid");
		
		CustomVO vo = new CustomVO();
		vo.setCusid(cusid);
		
		CustomDAO dao = new CustomDAO();
		CustomVO custom = dao.getCustom(vo);
		
		if(custom != null) {
			request.setAttribute("custom", custom);
			RequestDispatcher view = request.getRequestDispatcher("getCustom.jsp");
			view.forward(request, response);
		} else {
			response.sendRedirect("GetCustomListCtrl");
		}
	}
}