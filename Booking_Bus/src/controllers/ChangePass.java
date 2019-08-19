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
 * Servlet implementation class ChangePass
 */
@WebServlet("/ThayDoiMatKhau")
public class ChangePass extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TaiKhoanDAOImplement taiKhoanDao = new TaiKhoanDAOImplement();
	KhachHangDAOImplement khachHangDao = new KhachHangDAOImplement();


	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangePass() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		// lay session
		Boolean success= false;
		String err ="";
		String oldPass = request.getParameter("curPass");
		TaiKhoan taiKhoan = MyConnect.getLoginedUser(session);
		System.out.println(taiKhoan+"l2222");
		System.out.println(taiKhoan.getPass());
		System.out.println(oldPass);
		if(taiKhoan.getPass().equals(oldPass))
		{
			String newPass = request.getParameter("newPass");
			taiKhoan.setPass(newPass);
			success = taiKhoanDao.UpdateUser(taiKhoan);
		}
		if(success == true)
		{
			MyConnect.storeLoginedUser(session, taiKhoan);
			err="Cập Nhập Thành Công";
		}
		else
		{
			err="Mật khẩu hiện tại không đúng";
		}
		KhachHang khachHang = khachHangDao.showInfor(taiKhoan);
		request.setAttribute("success", success);
		request.setAttribute("khachHang",khachHang);
		request.setAttribute("err", err);
		RequestDispatcher dispatcher 
		= this.getServletContext().getRequestDispatcher("/views/ThongTinKhach.jsp");
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
