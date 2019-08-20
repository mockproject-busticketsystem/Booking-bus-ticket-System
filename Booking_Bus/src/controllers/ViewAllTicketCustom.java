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
import dao.KhachHangDAOImplement;
import dao.VexeDAOImplement;
import models.KhachHang;
import models.TaiKhoan;
import models.VeXe;

/**
 * Servlet implementation class ViewAllTicketCustom
 */
@WebServlet("/ViewAllTicketCustom")
public class ViewAllTicketCustom extends HttpServlet {
	private static final long serialVersionUID = 1L;
	KhachHangDAOImplement khachHangDao = new KhachHangDAOImplement();
	VexeDAOImplement veXeDao = new VexeDAOImplement();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewAllTicketCustom() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		TaiKhoan taiKhoan = MyConnect.getLoginedUser(session);
		if(taiKhoan==null)
		{
			response.sendRedirect(request.getContextPath()+"/views/loginView.jsp");
		}
		else
		{
			// lay khach hang
			KhachHang khach = khachHangDao.showInfor(taiKhoan);
			// lay cac ve da dduoc thanh toan
			ArrayList<VeXe> listVeStatusTrue = new ArrayList<>();
			listVeStatusTrue = veXeDao.viewAllTicketCusTomNotChanage(khach.getcMND());
			ArrayList<VeXe> listVeStatusFalse = new ArrayList<>();
			listVeStatusFalse = veXeDao.viewAllTicketCusTomChanage(khach.getcMND());
			System.out.println(listVeStatusTrue.size());
			request.setAttribute("listVeStatusTrue",listVeStatusTrue);
			request.setAttribute("listVeStatusFalse",listVeStatusFalse);
			RequestDispatcher dispatcher //
			= this.getServletContext().getRequestDispatcher("/views/ViewTicketCustom.jsp");
			dispatcher.forward(request, response);
		}
		/*request.getRequestDispatcher("/info-user").forward(request, response);//forwarding the request
		 */		


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		/*	HttpSession session = request.getSession();
		// Lay Tai Khoan 
		TaiKhoan taiKhoan = MyConnect.getLoginedUser(session);
		// lay khach hang
		KhachHang khach = khachHangDao.showInfor(taiKhoan);
		// lay cac ve da dduoc thanh toan
		ArrayList<VeXe> listVeStatusTrue = new ArrayList<>();
		listVeStatusTrue = veXeDao.viewAllTicketCusTomNotChanage(khach.getcMND());
		ArrayList<VeXe> listVeStatusFalse = new ArrayList<>();
		listVeStatusFalse = veXeDao.viewAllTicketCusTomChanage(khach.getcMND());
		System.out.println(listVeStatusTrue.size());
		request.setAttribute("listVeStatusTrue",listVeStatusTrue);
		request.setAttribute("listVeStatusFalse",listVeStatusFalse);
		RequestDispatcher dispatcher //
		= this.getServletContext().getRequestDispatcher("/views/ViewTicketCustom.jsp");
		dispatcher.forward(request, response);*/
	}

}
