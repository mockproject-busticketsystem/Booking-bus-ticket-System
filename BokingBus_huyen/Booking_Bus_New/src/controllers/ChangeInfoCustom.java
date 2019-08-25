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
 * Servlet implementation class ChangeInfoCustom
 */
@WebServlet("/ChangeInfoCustom")
public class ChangeInfoCustom extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private KhachHangDAOImplement khachHangDao = new KhachHangDAOImplement();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeInfoCustom() {
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
		KhachHang khachHang = new KhachHang();
		khachHang = MyConnect.getLoginedKhachHang(session);
		String name = request.getParameter("hoTen");
		String SDT = request.getParameter("SDT");
		khachHang.setHoTen(name);
		khachHang.setsDT(SDT);
		Boolean success = khachHangDao.UpdateKhachHang(khachHang);
		if(success == true)
		{
			MyConnect.storedLoginedCustom(session, khachHang);
			System.out.println(MyConnect.getLoginedKhachHang(session).getHoTen());
		}
		request.setAttribute("success", success);
		/*request.setAttribute("khachHang",khachHang);*/
		RequestDispatcher dispatcher //
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
