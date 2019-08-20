package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ChuyenDiDAOImplement;
import dao.TuyenDiDAOImplement;
import models.ChuyenDi;

/**
 * Servlet implementation class LoadThoiGian
 */
@WebServlet("/LoadThoiGian")
public class LoadThoiGian extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TuyenDiDAOImplement tuyenDiDao = new TuyenDiDAOImplement();
	ChuyenDiDAOImplement chuyenDiDao = new ChuyenDiDAOImplement();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadThoiGian() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String diaDiemDi = request.getParameter("diemdi");
		String diaDiemDen = request.getParameter("diemden");
		String maTuyen = tuyenDiDao.getIdTuyen(diaDiemDi,diaDiemDen);
		/*String maTuyen = tuyenDiDao.getIdTuyen("Ho Chi Minh","Ha Noi");*/
		ArrayList<ChuyenDi> arr = chuyenDiDao.loadGioDi(maTuyen);
		request.setAttribute("arrayChuyenDi", arr);
		/*RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/views/showDiemDen.jsp");
		dispatcher.forward(request, response);*/
		out.println("<select name=\"giodi\" id=\"giodi\" class=\"txtFrm\" required=\"required\" data-date-format=\"hh:ii\">");
		for(int i=0;i<arr.size();i++)
		{
			out.println("<option value='"+arr.get(i).getGioDi()+"'>"+ arr.get(i).getGioDi()+"</option>");
		}
		out.println("</select> <span><i class=\"glyphicon glyphicon-time\"style=\"font-size: 30px; margin-top: 4px; margin-right: 15px;\"></i></span>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
