package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connect.MyConnect;
import dao.KhachHangDAOImplement;
import models.KhachHang;
import models.TaiKhoan;

/**
 * Servlet implementation class InfoCustom
 */
@WebServlet("/ThongTinKhachHang")
public class InfoCustom extends HttpServlet {
	private static final long serialVersionUID = 1L;
	KhachHangDAOImplement khachHangDao = new KhachHangDAOImplement();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoCustom() {
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
		
		KhachHang khachHang = khachHangDao.showInfor(taiKhoan);
		request.setAttribute("khachHang",khachHang);
		RequestDispatcher dispatcher //
		= this.getServletContext().getRequestDispatcher("/views/ThongTinKhach.jsp");
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
