package com.shop.view;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.biz.InformDAO;
import com.shop.model.InformVO;

@WebServlet("/GetInformCtrl2")
public class GetInformCtrl2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		InformVO vo = new InformVO();
		vo.setSeq(seq);
		
		InformDAO dao = new InformDAO();
		InformVO inform = dao.getInform(vo);
		
		if(inform != null) {
			request.setAttribute("inform", inform);
			RequestDispatcher view = request.getRequestDispatcher("/inform/getInform2.jsp");
			view.forward(request, response);
		} else {
			response.sendRedirect("GetInformListCtrl");
		}
	}
}