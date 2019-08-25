package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NhanVienDAOImplement;
import models.NhanVien;
import models.TaiKhoan;
@WebServlet("/UpdateNhanVienServlet")
public class UpdateNhanVienServlet extends HttpServlet{

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
		String hoten = req.getParameter("HoTen");
		String sdt = req.getParameter("SDT");
		String chucvu = req.getParameter("Chucvu");
		String CMND = req.getParameter("CMND");
		System.out.println(hoten);
		System.out.println(sdt);
		try {
			NhanVien nhanVien = new NhanVien();
			nhanVien.setHoTen(hoten);
			nhanVien.setsDT(sdt);
			nhanVien.setChucVu(chucvu);
			nhanVien.setcMND(CMND);
			boolean updated = nvDao.UpdateNhanVien(nhanVien);
			if(updated == true) {
				req.setAttribute("updated", updated);
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