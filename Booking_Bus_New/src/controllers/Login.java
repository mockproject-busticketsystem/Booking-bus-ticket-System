package controllers;

import java.io.IOException;
import java.sql.SQLException;

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
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TaiKhoanDAOImplement tkDao = new TaiKhoanDAOImplement();
	KhachHangDAOImplement khDao = new KhachHangDAOImplement();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/loginView.jsp");
		dispatcher.forward(request, response);*/
		request.getRequestDispatcher("/info-user").forward(request, response);//forwarding the request
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userName = request.getParameter("Username");
		String password = request.getParameter("Password");
		String rememberMeStr = request.getParameter("checkRemember");
		boolean remember = "Y".equals(rememberMeStr);
		TaiKhoan user = null;
		boolean hasError = false;
		String errorString = null;

		if (userName == null || password == null || userName.length() == 0 || password.length() == 0) {
			hasError = true;
			errorString = "Required username and password!";
		} else {
			// TÃ¬m user trong DB.
			user = tkDao.findUser(userName, password);
			if (user == null) {
				hasError = true;
				errorString = "User Name or password invalid";
			}
		}
	
		if (hasError== true) {
			user = new TaiKhoan();
			user.setEmail(userName);
			user.setPass(password);

			request.setAttribute("errorString", errorString);
			request.setAttribute("user", user);

			// Forward (Chuyá»ƒn tiáº¿p) tá»›i trang /views/loginView.jsp
			/*RequestDispatcher dispatcher //
			= this.getServletContext().getRequestDispatcher("/views/loginView.jsp");

			dispatcher.forward(request, response);*/
			request.getRequestDispatcher("/views/loginView.jsp").forward(request, response);
		}
		else {
			HttpSession session = request.getSession();
			// luu vao session
			MyConnect.storeLoginedUser(session, user);
			if (remember) {
				MyConnect.storeUserCookie(response, user);
			}
			// xoa cookie
			else {
				MyConnect.deleteUserCookie(response);
			}
			
			request.getRequestDispatcher("/info-user").forward(request, response);


		}
	}
}

