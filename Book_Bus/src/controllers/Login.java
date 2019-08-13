package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

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
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TaiKhoanDAOImplement tkDao = new TaiKhoanDAOImplement();
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
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher(request.getContextPath()+"/views/loginView.jsp");
		dispatcher.forward(request, response);
		//request.getRequestDispatcher("/views/loginView.jsp").forward(request, response);//forwarding the request
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
			Connection conn = MyConnect.getStoredConnection(request);
			try {
				// TÃƒÂ¬m user trong DB.
				user = tkDao.findUser(conn, userName, password);
				if (user == null) {
					hasError = true;
					errorString = "User Name or password invalid";
				}
			} catch (SQLException e) {
				e.printStackTrace();
				hasError = true;
				errorString = e.getMessage();
			}
		}
		// Trong trường hợp có lỗi,
		// forward (chuyển hướng) tới /views/loginView.jsp
		if (hasError== true) {
			user = new TaiKhoan();
			user.setEmail(userName);
			user.setPass(password);

			// Lưu các thông tin vào request attribute trước khi forward.
			request.setAttribute("errorString", errorString);
			request.setAttribute("user", user);

			// Forward (Chuyển tiếp) tới trang /views/loginView.jsp
			RequestDispatcher dispatcher //
			= this.getServletContext().getRequestDispatcher("/views/loginView.jsp");
			dispatcher.forward(request, response);
		}
		// Trường hợp không có lỗi.
		// Lưu thông tin người dùng vào Session.
		// Và chuyển hướng sang trang userInfo.
		else {
			HttpSession session = request.getSession();
			MyConnect.storeLoginedUser(session, user);

			// Nếu người dùng chọn tính năng "Remember me".
			if (remember) {
				MyConnect.storeUserCookie(response, user);
			}
			// Ngược lại xóa Cookie
			else {
				MyConnect.deleteUserCookie(response);
			}
		
			/*String role = user.getRole();
			session.setAttribute("role",role);
			String hoTen = "";
			hoTen = tkDao.getHoten(role, userName);
			request.setAttribute("hoTen", hoTen);
			// Redirect (ChuyÃ¡Â»Æ’n hÃ†Â°Ã¡Â»â€ºng) sang trang /userInfo.
//			request.getRequestDispatcher("/views/pageUser.jsp").forward(request, response);
			//response.sendRedirect(request.getContextPath() + "/info-user");
*/			request.getRequestDispatcher("/info-user").forward(request, response);
		}
	}
}

