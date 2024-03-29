package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connect.ConnectionUtils;
import dao.KhachHangDAOImplement;
import dao.TaiKhoanDAOImplement;
import models.KhachHang;
import models.TaiKhoan;


/**
 * Servlet implementation class Register
 */
@WebServlet("/register-customer")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		KhachHangDAOImplement khachHangDao = new KhachHangDAOImplement();
		TaiKhoanDAOImplement taiKhoanDao = new TaiKhoanDAOImplement();
		String name = request.getParameter("Ten");
		String cMND = request.getParameter("CMND");
		String SDT = request.getParameter("SDT");
		String Email = request.getParameter("Email");
		String Pass = request.getParameter("Pass");
		KhachHang khachHang = new KhachHang(cMND,name,SDT,Email);
		TaiKhoan taiKhoan = new TaiKhoan(Email,Pass);
		boolean success = false;
		String errorString = null;
		Connection conn = null;
		try {
			conn = ConnectionUtils.getConnection();
			conn.setAutoCommit(false);
			success = khachHangDao.InsertKhachHang(conn,khachHang);
			if(success == true)
			{
			taiKhoan.setRole("khachhang");
			success = taiKhoanDao.InsertUserCustom(conn, taiKhoan);
			ConnectionUtils.closeQuietly(conn);
			}
			else
			{
				ConnectionUtils.rollbackQuietly(conn);
			}
			if(success==false)
			{
				errorString = "Opss.... Something was wrong!!! CMND or Email not available :( :(";
			}
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			ConnectionUtils.rollbackQuietly(conn);
//			errorString = "Opss.... Something was wrong!!!";
			errorString = errorString.concat(e1.getMessage());
		}
		request.setAttribute("errorString", errorString);
		request.setAttribute("success", success);
		/*System.out.println(success);*/
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/index.jsp");
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
