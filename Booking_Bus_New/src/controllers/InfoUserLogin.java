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
import dao.TaiKhoanDAOImplement;
import models.KhachHang;
import models.TaiKhoan;



/**
 * Servlet implementation class InfoUserLogin
 */
@WebServlet("/info-user")
public class InfoUserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TaiKhoanDAOImplement tkDao = new TaiKhoanDAOImplement();
	KhachHangDAOImplement khachHangDao = new KhachHangDAOImplement();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InfoUserLogin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		TaiKhoan loginedUser = MyConnect.getLoginedUser(session);
		if (loginedUser == null) {
			request.getRequestDispatcher("/views/loginView.jsp").forward(request, response);//forwarding the request
		}
		else
		{
			request.setAttribute("user", loginedUser);
			String role = loginedUser.getRole();
			String email = loginedUser.getEmail();
			session.setAttribute("role",role);	
			session.setAttribute("email",email);
			if(role.equals("KhachHang")) {
				String hoTen = "";
				hoTen = tkDao.getHoten(role, loginedUser.getEmail());
				session.setAttribute("hoTen", hoTen);
				KhachHang khachHang = null;
				khachHang = khachHangDao.showInfor(loginedUser);
				String CMND = khachHang.getcMND();
				session.setAttribute("CMND",CMND);
				request.getRequestDispatcher("/pageUser").forward(request, response);
			}
			else if(role.equals("Admin")) {

				request.getRequestDispatcher("/DashboardAdmin").forward(request, response);
			}
			else if(role.equals("NhanVien")) {
				String hoTen = "";
				hoTen = tkDao.getHoten(role,loginedUser.getEmail());
				request.setAttribute("hoTen", hoTen);
				request.getRequestDispatcher("/DashboardNhanVien").forward(request, response);
			}
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
