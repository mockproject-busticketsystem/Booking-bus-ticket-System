package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.KhachHangDAOImplement;
import models.KhachHang;
import models.NhanVien;
@WebServlet("/info_UpdateKhachhang")
public class KhachHangServlet extends HttpServlet{
private KhachHangDAOImplement khDao = new KhachHangDAOImplement();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		KhachHang cus = null;
        String email = req.getParameter("email");
        cus = khDao.getKH(email);
        req.setAttribute("email", email);
        req.setAttribute("cus", cus);
        req.getRequestDispatcher("/views/infoKhachhang.jsp").forward(req, resp);//forwarding the request
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				String hoten = req.getParameter("HoTen");
				String sdt = req.getParameter("SDT");
				String CMND = req.getParameter("CMND");
				String email = req.getParameter("email");
				System.out.println(hoten);
				System.out.println(sdt);
				System.out.println(CMND);
				System.out.println(email);
				try {
					KhachHang khachHang = new KhachHang();
					khachHang.setHoTen(hoten);
					khachHang.setsDT(sdt);
					khachHang.setcMND(CMND);
					khachHang.setEmail(email);
					boolean updated = khDao.UpdateKhachHang(khachHang);
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

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

}
