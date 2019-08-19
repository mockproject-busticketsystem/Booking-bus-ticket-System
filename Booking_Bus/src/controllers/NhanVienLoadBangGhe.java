package controllers;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.VexeDAOImplement;
import models.VeXe;
@WebServlet("/DashboardNhanVien/LoadBangGhe")
public class NhanVienLoadBangGhe extends HttpServlet {
	
		private static final long serialVersionUID = 1L;

		private VexeDAOImplement vexeDao = new VexeDAOImplement();
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// TODO Auto-generated method stub
			doGet(req, resp);
		}
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String all=null;
			all=req.getParameter("all");
			String ngaydi=req.getParameter("ngaydi");
		    String idchuyen=req.getParameter("idchuyen");
		    LocalDate ngay_di = LocalDate.parse(ngaydi);
		    System.out.println(ngaydi);
		    req.setAttribute("idchuyen", idchuyen);
		    req.setAttribute("ngaydi", ngaydi);
			List<VeXe> allve = null;
		    allve = vexeDao.getAllVeXe(idchuyen,ngaydi);
		    List<VeXe> vexe = null; 
			vexe = vexeDao.getMaghe(Integer.valueOf(idchuyen),ngay_di);
			req.setAttribute("allve", allve);
			req.setAttribute("maghe", vexe);
			req.setAttribute("all", all);
			req.getRequestDispatcher("/views/NhanVienXemSoDoGhe.jsp").forward(req, resp);//forwarding the request
		}
}
