package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connect.MyConnect;
import dao.TaiKhoanDAOImplement;
import models.NhanVien;
import models.TaiKhoan;
import models.TuyenDi;
@WebServlet("/DashboardAdmin")
public class AdminServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private TaiKhoanDAOImplement tkDao = new TaiKhoanDAOImplement();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		TaiKhoan taiKhoan = MyConnect.getLoginedUser(session);
//		List<TaiKhoan> taiKhoan = null;
//		taiKhoan = tkDao.getTaikhoan();
//        TaiKhoan user = null;
       
//		MyConnect.storeLoginedUser(session, user);
//		String email = (String) session.getAttribute("email");	
		System.out.println(taiKhoan.getEmail());
        NhanVien nhanVien = tkDao.getInfoAdmin(taiKhoan.getEmail());
        req.setAttribute("admin", nhanVien);
		List<TaiKhoan> filternhanvien = null;
		
		String khach ="";
		khach=req.getParameter("filter");
		if(khach==null)khach="Admin";
//		taiKhoan = tkDao.getTaikhoan();
		filternhanvien = tkDao.getTaiKhoanFilter(khach);
	
        req.setAttribute("taikhoan", taiKhoan);
        req.setAttribute("choosefilter", khach);
        req.setAttribute("filter", filternhanvien);
  
    	req.getRequestDispatcher("/views/DashboardAdmin.jsp").forward(req, resp);//forwarding the request
	}
}
