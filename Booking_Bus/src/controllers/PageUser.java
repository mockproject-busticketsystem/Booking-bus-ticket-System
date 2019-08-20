package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connect.MyConnect;
import dao.ChuyenDiDAOImplement;
import dao.TuyenDiDAOImplement;
import models.TaiKhoan;
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
			//
			HttpSession session = request.getSession();
			TaiKhoan taiKhoan = MyConnect.getLoginedUser(session);
			if(taiKhoan==null)
			{
				response.sendRedirect(request.getContextPath()+"/views/loginView.jsp");
			}
			else
			{
			ArrayList<String> arrayDiemDi = tdDao.getDiaDiemDi();
			request.setAttribute("arrayDiemDi", arrayDiemDi);
			RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/views/pageUser.jsp");
			dispatcher.forward(request, response);
			}
			}
		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			doGet(request, response);
			
			
		}

}
