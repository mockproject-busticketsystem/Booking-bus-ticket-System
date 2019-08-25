package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NhanVienDAOImplement;
import models.KhachHang;
import models.NhanVien;
@WebServlet("/InsertNhanVien")
public class InsertInfoNhanVien extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private NhanVienDAOImplement nvDao = new NhanVienDAOImplement();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String hoTen = req.getParameter("HoTen");
		String sdt = req.getParameter("SDT");
		String CMND = req.getParameter("CMND");
		String email = req.getParameter("email");
		String chucVu = req.getParameter("Chucvu");
		System.out.println(hoTen);
		System.out.println(sdt);
		System.out.println(CMND);
		System.out.println(email);
		try {
			NhanVien nhanVien = new NhanVien();
			nhanVien.setHoTen(hoTen);
			nhanVien.setsDT(sdt);
			nhanVien.setcMND(CMND);
			nhanVien.setEmail(email);
			nhanVien.setChucVu(chucVu);
			boolean inserted = nvDao.InsertNhanVien(nhanVien);
			if(inserted == true) {
				System.out.println("insert success!");
				req.getServletContext().getRequestDispatcher("/DashboardAdmin").forward(req, resp);
			}	
			else {
				System.out.println("update fail!");
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

}
