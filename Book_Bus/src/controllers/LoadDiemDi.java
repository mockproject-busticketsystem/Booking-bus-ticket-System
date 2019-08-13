package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TuyenDiDAOImplement;

/**
 * Servlet implementation class LoadDiemDi
 */
@WebServlet("/LoadDiemDi")
public class LoadDiemDi extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TuyenDiDAOImplement tuyenDiDaoImplement = new TuyenDiDAOImplement();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoadDiemDi() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<String> arrayDiemDi = tuyenDiDaoImplement.getDiaDiemDi();
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
