package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	private TaiKhoanDAOImplement tkDao = new TaiKhoanDAOImplement();
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
		try {
			TaiKhoan taikhoan = new TaiKhoan();
			taikhoan.setEmail(email);
			taikhoan.setPass(pass);
			taikhoan.setRole(role);
			System.out.println(taikhoan.getEmail());
			System.out.println(taikhoan.getRole());
			NhanVien nhanVien = new NhanVien();
			nhanVien.setcMND(cmnd);
			nhanVien.setHoTen(hoten);
			nhanVien.setsDT(sdt);
			nhanVien.setEmail(email);
			nhanVien.setChucVu(chucvu);
			System.out.println(nhanVien.getcMND());
			KhachHang khachHang = new KhachHang();
			khachHang.setcMND(cmnd);
			khachHang.setHoTen(hoten);
			khachHang.setsDT(sdt);
			khachHang.setEmail(email);
			if(role.equals("nhanvien")) {
				tkDao.themUser_NhanVien(taikhoan, nhanVien);
				System.out.println("Insert ok!: " );
				req.getServletContext().getRequestDispatcher("/DashboardAdmin").forward(req, resp);
			}
			else if(role.equals("khachhang")) {
				tkDao.themUser_KhachHang(taikhoan, khachHang);
				System.out.println("Insert ok!: " );
				req.getServletContext().getRequestDispatcher("/DashboardAdmin").forward(req, resp);
			}
			
		}
		catch (Exception e)
		{
			e.getMessage();
		}	
		
	}

}
