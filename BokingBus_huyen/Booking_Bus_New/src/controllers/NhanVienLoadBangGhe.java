package controllers;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TuyenDiDAOImplement;
import dao.VexeDAOImplement;
import models.VeXe;
@WebServlet("/LoadBangGhe")
public class NhanVienLoadBangGhe extends HttpServlet {
	
		private static final long serialVersionUID = 1L;
		private TuyenDiDAOImplement tdDao = new TuyenDiDAOImplement();
	
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// TODO Auto-generated method stub
			ArrayList<String> arrayDiemDi = tdDao.getDiaDiemDi();
			req.setAttribute("arrayDiemDi", arrayDiemDi);
			RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/views/DashboardNhanVien_GheAvailable.jsp");
			dispatcher.forward(req, resp);
		}
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			doGet(req, resp);
		}
}
