package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ChuyenDiDAOImplement;
import models.ChuyenDi;
@WebServlet("/LoadChuyen")
public class loadChuyen extends HttpServlet{

	private static final long serialVersionUID = 1L;

	private ChuyenDiDAOImplement chuyenDiDao = new ChuyenDiDAOImplement();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<ChuyenDi> allChuyen = new ArrayList<>();
		allChuyen = chuyenDiDao.getAllChuyen();
		req.setAttribute("AllChuyen",allChuyen);


		req.getRequestDispatcher("/views/NhanVienAllChuyen.jsp").forward(req, resp);//forwarding the request
	}
}
