package controllers;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.chuyendiDAOImplement;
@WebServlet("/chuyendi")
public class chuyendiServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private chuyendiDAOImplement cdDao = new chuyendiDAOImplement();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String tuyendi = req.getParameter("tuyendi");
		BigDecimal donGia = cdDao.getDongia(tuyendi);
		req.setAttribute("dongia", donGia);
		req.getRequestDispatcher("/views/booking_bus.jsp").forward(req, resp);//forwarding the request
	  
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}
