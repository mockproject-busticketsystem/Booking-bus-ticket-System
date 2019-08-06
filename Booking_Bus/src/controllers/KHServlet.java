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
import model.*;

/**
 * Servlet implementation class KHServlet
 */
@WebServlet("/khachhang")
public class KHServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private khachhangDAOImplement  khDao = new khachhangDAOImplement(); 
		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
	        List<KhachHang> cus = null;
	        String email = "trinhnguyen@email.com";
	        cus = khDao.getKH(email);
	        request.setAttribute("customer", cus);
	        RequestDispatcher dispatcher = request.getServletContext()
	                .getRequestDispatcher("/views/pageUser.jsp");
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
