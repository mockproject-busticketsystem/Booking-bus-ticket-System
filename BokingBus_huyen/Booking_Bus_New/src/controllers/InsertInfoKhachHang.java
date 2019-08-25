package controllers;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connect.ConnectionUtils;
import dao.KhachHangDAOImplement;
import models.KhachHang;
@WebServlet("/InsertKhachHang")
public class InsertInfoKhachHang extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private KhachHangDAOImplement khDao = new KhachHangDAOImplement();
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
		String CMND = req.getParameter("CMND");
		String email = req.getParameter("email");
		try {
			Connection conn = ConnectionUtils.getConnection();
			KhachHang khachHang = new KhachHang();
			khachHang.setHoTen(hoten);
			khachHang.setsDT(sdt);
			khachHang.setcMND(CMND);
			khachHang.setEmail(email);
			boolean inserted = khDao.InsertKhachHang(conn,khachHang);
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
