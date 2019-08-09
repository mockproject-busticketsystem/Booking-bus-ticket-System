package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connect.DBConnect;
import dao.khachhangDAOImplement;
import dao.tuyendiDAOImplement;
import models.KhachHang;
import models.TuyenDi;
@WebServlet("/khachhang")
public class KHServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private khachhangDAOImplement  khDao = new khachhangDAOImplement(); 
		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
	 	private tuyendiDAOImplement tdDao = new tuyendiDAOImplement();
		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
	        List<KhachHang> cus = null;
	        String email = "tuan@gmail.com";
	        cus = khDao.getKH(email);
	        request.setAttribute("customer", cus);
			List<TuyenDi> diaDiemDi = null;
			diaDiemDi = tdDao.getDiaDiemDi();
			List<TuyenDi> diaDiemDen = null;
//			String diemden = request.getParameter("diemDen");
			diaDiemDen = tdDao.getDiaDiemDen();
			request.setAttribute("diaDiemDi", diaDiemDi);
	        request.setAttribute("diaDiemDen", diaDiemDen);
	    	request.getRequestDispatcher("/views/pageUser.jsp").forward(request, response);//forwarding the request
		}
		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			doGet(request, response);
			
		}

}
