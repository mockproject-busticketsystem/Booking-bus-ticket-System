package controllers;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.chuyendiDAOImplement;
import dao.tuyendiDAOImplement;
import dao.vexeDAOImplement;
import models.TuyenDi;
import models.VeXe;
@WebServlet("/idtuyen")
public class TuyenDiServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private tuyendiDAOImplement tdDao = new tuyendiDAOImplement();
	private chuyendiDAOImplement cdDao = new chuyendiDAOImplement();
	private vexeDAOImplement veDao = new vexeDAOImplement();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String diemdi = req.getParameter("di"); 
		String diemden = req.getParameter("den");
		String idTuyendi = tdDao.getIdTuyen(diemdi, diemden); 
		BigDecimal donGia = tdDao.getDonGia(diemdi, diemden);
		String giodi = req.getParameter("giodi");
		 String ngaydi = req.getParameter("ngaydi");
		 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		 LocalDate date = LocalDate.parse(ngaydi);
		 LocalTime time = LocalTime.parse(giodi);
		 List<VeXe> maghe = null;
		maghe = veDao.getStringMaGhe(date, time,idTuyendi);
		req.setAttribute("maghe",maghe);
		req.setAttribute("dongia", donGia);
		req.setAttribute("idtuyen", idTuyendi);
		req.setAttribute("di", diemdi);
		req.setAttribute("den", diemden);
		req.setAttribute("gia", donGia);
		req.setAttribute("giodi", giodi);
		req.setAttribute("ngaydi", ngaydi);
		req.getRequestDispatcher("/views/booking_ghe.jsp").forward(req, resp);//forwarding the request
	}

}
