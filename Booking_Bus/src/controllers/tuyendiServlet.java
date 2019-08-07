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
import dao.tuyendiDAOImplement;
@WebServlet("/idtuyen")
public class tuyendiServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private tuyendiDAOImplement tdDao = new tuyendiDAOImplement();
	private chuyendiDAOImplement cdDao = new chuyendiDAOImplement();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String diemdi = req.getParameter("diemDi");
		String diemden = req.getParameter("diemDen");
		String idTuyendi = tdDao.getIdTuyen(diemdi, diemden);
		BigDecimal donGia = cdDao.getDongia(idTuyendi);
		req.setAttribute("dongia", donGia);
		req.setAttribute("idtuyen", idTuyendi);
		req.getRequestDispatcher("/views/booking_ghe.jsp").forward(req, resp);//forwarding the request
	}

}
