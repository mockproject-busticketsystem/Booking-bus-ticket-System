package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.KhachHangDAOImplement;
import models.KhachHang;
import models.TaiKhoan;

/**
 * Servlet implementation class showInfoCustom
 */
@WebServlet("/showInfoCustom")
public class showInfoCustom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showInfoCustom() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		// show thong tin khach hang
		TaiKhoan taiKhoan = (TaiKhoan)session.getAttribute("loginedUser");
		KhachHangDAOImplement khachHangDao = new KhachHangDAOImplement();
		KhachHang khachHang = null;
		khachHang = khachHangDao.showInfor(taiKhoan);
		request.setAttribute("khachHang", khachHang);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/loginView.jsp");
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
