package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connect.ConnectionUtils;
import dao.KhachHangDAOImplement;
import dao.NhanVienDAOImplement;
import dao.TaiKhoanDAOImplement;
import models.KhachHang;
import models.NhanVien;
import models.TaiKhoan;
@WebServlet("/InsertUserNhanVien")
public class InsertUserNhanVien extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private TaiKhoanDAOImplement taiKhoanDao = new TaiKhoanDAOImplement();
	private KhachHangDAOImplement khachHangDao = new KhachHangDAOImplement();
	private NhanVienDAOImplement nhanVienDao = new NhanVienDAOImplement();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cmnd = req.getParameter("cmnd_insert");
		String pass = req.getParameter("pass_insert");
		String email = req.getParameter("email_insert");
		String hoten = req.getParameter("hoten_insert");
		String sdt = req.getParameter("sdt_insert");
		String chucvu = req.getParameter("chucvu_insert");
		String role = req.getParameter("role_insert");
		System.out.println(email);
		System.out.println(role);
		boolean success = false;
		String errorString = null;
		TaiKhoan taiKhoan = new TaiKhoan(email,pass,role);
		Connection conn = null;
		try {
			conn = ConnectionUtils.getConnection();
			conn.setAutoCommit(false);
			if(role.equals("NhanVien"))
			{
				NhanVien nhanVien = new NhanVien(cmnd,hoten,sdt,email,chucvu);
				success = nhanVienDao.InsertUserNhanVien(conn, nhanVien);
				if(success == true)
				{
					taiKhoan.setRole("NhanVien");
					success = taiKhoanDao.InsertUserCustom(conn, taiKhoan);
					if(success == true)
					{
						ConnectionUtils.closeQuietly(conn);
					}
					else
					{
						ConnectionUtils.rollbackQuietly(conn);
						errorString = "Opss.... Something was wrong!!! CMND or Email not available :( :(";
					}
				}
			}
			else if(role.equals("KhachHang"))
			{
				KhachHang khachHang = new KhachHang(cmnd,hoten,sdt,email);
				success = khachHangDao.InsertKhachHang(conn,khachHang);
				if(success == true)
				{
					taiKhoan.setRole("khachhang");
					success = taiKhoanDao.InsertUserCustom(conn, taiKhoan);
					if(success == true)
					{
						ConnectionUtils.closeQuietly(conn);
					}
					else
					{
						ConnectionUtils.rollbackQuietly(conn);
						errorString = "Opss.... Something was wrong!!! CMND or Email not available :( :(";
					}
				}

			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			errorString += e.getMessage();
			
		}
		req.setAttribute("success", success);
		req.setAttribute("errorString",errorString);
		req.getServletContext().getRequestDispatcher("/DashboardAdmin").forward(req, resp);

	}

}
