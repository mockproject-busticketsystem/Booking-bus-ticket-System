package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.VexeDAOImplement;
import models.VeXe;

/**
 * Servlet implementation class ViewAll
 */
@WebServlet("/ViewAll")
public class ViewAllTicketEmployy extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VexeDAOImplement vexeDao = new VexeDAOImplement();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewAllTicketEmployy() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<String> thuoctinh = new ArrayList<String>();
		thuoctinh.add("All");
		thuoctinh.add("Id Chuyen");
		thuoctinh.add("Ngay Di");
		thuoctinh.add("Gio Di");
		thuoctinh.add("Diem Di");
		thuoctinh.add("Diem Den");
		thuoctinh.add("Don Gia");
		thuoctinh.add("Hang Doi");
		request.setAttribute("thuoctinh", thuoctinh);
		ArrayList<VeXe> viewAllTicket = new ArrayList<>();
		viewAllTicket = vexeDao.getAllVeXe();
		request.setAttribute("viewAllTicket",viewAllTicket);
		request.getRequestDispatcher("/views/DashboardNhanVien.jsp").forward(request,response);//forwarding the request	
		/*request.getRequestDispatcher("/views/indexEmploy.jsp").forward(request,response);*/
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
