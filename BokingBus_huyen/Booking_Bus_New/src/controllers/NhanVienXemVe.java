package controllers;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.Period;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ChuyenDiDAOImplement;
import dao.VexeDAOImplement;
import models.ChuyenDi;
import models.VeXe;
@WebServlet("/DashboardNhanVien/XemVe")
public class NhanVienXemVe  extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ChuyenDiDAOImplement chuyenDiDao = new ChuyenDiDAOImplement();

	private VexeDAOImplement vexeDao = new VexeDAOImplement();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String all=null;
		all=req.getParameter("all");
		String ngaydi=req.getParameter("ngaydi");
	    String idchuyen=req.getParameter("idchuyen");
	    String Search=req.getParameter("Search");
	    req.setAttribute("idchuyen", idchuyen);
	    req.setAttribute("ngaydi", ngaydi);
	   
		ArrayList<VeXe> allve = null;
	    allve = vexeDao.getAllVeXe(idchuyen,ngaydi);
		req.setAttribute("allve", allve);
		req.setAttribute("all", all);
		req.getRequestDispatcher("/views/nhanVienXemVe.jsp").forward(req, resp);//forwarding the request
	}
}
