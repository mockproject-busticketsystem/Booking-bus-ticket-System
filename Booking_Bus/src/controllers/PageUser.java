package controllers;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connect.DBConnect;
import dao.ChuyenDiDAOImplement;
import dao.KhachHangDAOImplement;
import dao.TuyenDiDAOImplement;
import models.ChuyenDi;
import models.KhachHang;
import models.TuyenDi;
@WebServlet("/pageUser")
public class PageUser extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */

	 	private TuyenDiDAOImplement tdDao = new TuyenDiDAOImplement();
	 	private ChuyenDiDAOImplement cdDao = new ChuyenDiDAOImplement();
		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
			// TODO Auto-generated method stub
			ArrayList<String> arrayDiemDi = tdDao.getDiaDiemDi();
			request.setAttribute("arrayDiemDi", arrayDiemDi);
			RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/views/pageUser.jsp");
			dispatcher.forward(request, response);
		}
		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			doGet(request, response);
			
		}

}
