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
import dao.TaiKhoanDAOImplement;
import models.TaiKhoan;



/**
 * Servlet implementation class InfoUserLogin
 */
@WebServlet("/info-user")
public class InfoUserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TaiKhoanDAOImplement tkDao = new TaiKhoanDAOImplement();

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

		// Kiá»ƒm tra ngÆ°á»�i dÃ¹ng Ä‘Ã£ Ä‘Äƒng nháº­p (login) chÆ°a.
		TaiKhoan loginedUser = MyConnect.getLoginedUser(session);

		// Náº¿u chÆ°a Ä‘Äƒng nháº­p (login).
		if (loginedUser == null) {
			// Redirect (Chuyá»ƒn hÆ°á»›ng) tá»›i trang login.
			request.getRequestDispatcher("/views/loginView.jsp").forward(request, response);//forwarding the request
			return;
		}
		// LÆ°u thÃ´ng tin vÃ o request attribute trÆ°á»›c khi forward (chuyá»ƒn tiáº¿p).
		request.setAttribute("user", loginedUser);
		String role = loginedUser.getRole();
		session.setAttribute("role",role);
		String hoTen = "";
		hoTen = tkDao.getHoten(role, loginedUser.getEmail());
		request.setAttribute("hoTen", hoTen);
		

		// Náº¿u ngÆ°á»�i dÃ¹ng Ä‘Ã£ login thÃ¬ forward (chuyá»ƒn tiáº¿p) tá»›i trang
		// /WEB-INF/views/pageUser.jsp
	/*	RequestDispatcher dispatcher //
		= this.getServletContext().getRequestDispatcher("/views/pageUser.jsp");
		dispatcher.forward(request, response);*/
		/*request.getRequestDispatcher("/views/pageUser.jsp").forward(request, response);*/
		RequestDispatcher dispatcher //
		= this.getServletContext().getRequestDispatcher("/LoadDiemDi");
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
