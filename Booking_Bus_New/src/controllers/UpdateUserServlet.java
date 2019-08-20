package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TaiKhoanDAOImplement;
import models.TaiKhoan;

@WebServlet("/UpdateServlet")
public class UpdateUserServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private TaiKhoanDAOImplement tkDao = new TaiKhoanDAOImplement();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = req.getParameter("email_edit");
		String role = req.getParameter("role_edit");
		System.out.println(email);
		System.out.println(role);
		try {
			TaiKhoan taikhoan = new TaiKhoan();
			taikhoan.setEmail(email);
			taikhoan.setRole(role);
			System.out.println(taikhoan.getEmail());
			System.out.println(taikhoan.getRole());
			int updated = tkDao.UpdateTaiKhoan(taikhoan);
			if(updated == 1) {
				req.getServletContext().getRequestDispatcher("/DashboardAdmin").forward(req, resp);
			}	
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}	
		
	}
}
