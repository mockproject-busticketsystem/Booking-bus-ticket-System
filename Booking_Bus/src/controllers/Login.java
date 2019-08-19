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
		/*request.getRequestDispatcher("/views/loginView.jsp").forward(request, response);//forwarding the request*/
		String user = MyConnect.getUserNameInCookie(request);
		if(user!=null)
		{
			request.getRequestDispatcher("/info-user").forward(request, response);
		}
		else
		{
			request.getRequestDispatcher("/views/loginView.jsp").forward(request, response);//forwarding the request
		}
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
		// Trong trÆ°á»�ng há»£p cÃ³ lá»—i,
		// forward (chuyá»ƒn hÆ°á»›ng) tá»›i /views/loginView.jsp
		if (hasError) {
			user = new TaiKhoan();
			user.setEmail(userName);
			user.setPass(password);

			// LÆ°u cÃ¡c thÃ´ng tin vÃ o request attribute trÆ°á»›c khi forward.
			request.setAttribute("errorString", errorString);
			request.setAttribute("user", user);

			// Forward (Chuyá»ƒn tiáº¿p) tá»›i trang /views/loginView.jsp
			/*RequestDispatcher dispatcher //
			= this.getServletContext().getRequestDispatcher("/views/loginView.jsp");

			dispatcher.forward(request, response);*/
			request.getRequestDispatcher("/views/loginView.jsp").forward(request, response);
		}
		// TrÆ°á»�ng há»£p khÃ´ng cÃ³ lá»—i.
		// LÆ°u thÃ´ng tin ngÆ°á»�i dÃ¹ng vÃ o Session.
		// VÃ  chuyá»ƒn hÆ°á»›ng sang trang userInfo.
		else {
			HttpSession session = request.getSession();
			MyConnect.storeLoginedUser(session, user);

			// Náº¿u ngÆ°á»�i dÃ¹ng chá»�n tÃ­nh nÄƒng "Remember me".
			if (remember) {
				MyConnect.storeUserCookie(response, user);
			}
			// NgÆ°á»£c láº¡i xÃ³a Cookie
			else {
				MyConnect.deleteUserCookie(response);
			}
			String role = user.getRole();
			String email = user.getEmail();
			session.setAttribute("role",role);	
			session.setAttribute("email",email);

			// Redirect (Chuyá»ƒn hÆ°á»›ng) sang trang /userInfo.
			if(role.equals("khachhang")) {
				String hoTen = "";
				hoTen = tkDao.getHoten(role, userName);
				session.setAttribute("hoTen", hoTen);
				KhachHang khachHang = null;
				khachHang = khDao.showInfor(user);
				String CMND = khachHang.getcMND();
				session.setAttribute("CMND",CMND);
				request.getRequestDispatcher("/pageUser").forward(request, response);
			}
			else if(role.equals("admin")) {

				request.getRequestDispatcher("/DashboardAdmin").forward(request, response);
			}
			else if(role.equals("nhanvien")) {
				String hoTen = "";
				hoTen = tkDao.getHoten(role, userName);
				request.setAttribute("hoTen", hoTen);
				request.getRequestDispatcher("/DashboardNhanVien").forward(request, response);
			}

		}
	}
}

