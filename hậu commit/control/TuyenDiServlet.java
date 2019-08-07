package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.tuyendiDAOImplement;
import model.TuyenDi;
@WebServlet("/khachhang2")
public class TuyenDiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private tuyendiDAOImplement  tuyen = new tuyendiDAOImplement(); 
		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
	        List<TuyenDi> tuyendi = null;
	     
	        tuyendi = tuyen.getTuyen();
	        request.setAttribute("tuyen2",tuyendi);
	        RequestDispatcher dispatcher = request.getServletContext()
	                .getRequestDispatcher("/pageChooseSlot.jsp");
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
