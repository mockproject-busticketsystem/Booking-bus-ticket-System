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

import dao.TuyenDiDAOImplement;

/**
 * Servlet implementation class LoadDiemDen
 */
@WebServlet("/loadDiemDen")
public class LoadDiemDen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadDiemDen() {
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
		TuyenDiDAOImplement tuyenDiDao = new TuyenDiDAOImplement();
		ArrayList<String> arrayDiemDen;
		String diemDi = request.getParameter("diemdi");
		/*String diemDi ="Ho Chi Minh";*/
		arrayDiemDen = tuyenDiDao.getDiaDiemDenTheoDDD(diemDi);
		/*request.setAttribute("arrayDiemDen", arrayDiemDen);
		RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/views/showDiemDen.jsp");
				dispatcher.forward(request, response);*/
		out.println("<select name=\"diemden\" class=\"txtFrm\" id=\"diemden\" required=\"required \">\r\n" + 
				"		<option value=\"0\">Chon Diem Den</option>\r\n");
				for(int i=0;i<arrayDiemDen.size();i++)
				{
					out.println("<option value='"+arrayDiemDen.get(i)+"'>"+arrayDiemDen.get(i)+"</option>");
				}
				
				out.print("</select>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
