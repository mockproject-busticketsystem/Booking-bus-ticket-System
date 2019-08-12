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
import models.TuyenDi;
@WebServlet("/DashboardAdmin")
public class TaiKhoanServlet extends HttpServlet{

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
		List<TaiKhoan> taiKhoan = null;
		List<TaiKhoan> filternhanvien = null;
		
		String khach ="";
		khach=req.getParameter("filter");
		
		taiKhoan = tkDao.getTaikhoan();
		filternhanvien = tkDao.getTaiKhoanFilter(khach);
	
        req.setAttribute("taikhoan", taiKhoan);
        req.setAttribute("choosefilter", khach);
        req.setAttribute("filter", filternhanvien);
  
    	req.getRequestDispatcher("/views/DashboardAdmin.jsp").forward(req, resp);//forwarding the request
	}

}
