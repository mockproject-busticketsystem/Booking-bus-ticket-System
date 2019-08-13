package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TaiKhoanDAOImplement;
import models.TaiKhoan;
import models.TuyenDi;

public class TaiKhoanServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private TaiKhoanDAOImplement tkDao = new TaiKhoanDAOImplement();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<TaiKhoan> taiKhoan = null;
//		String diemden = request.getParameter("diemDen");
		taiKhoan = tkDao.getTaikhoan();
        req.setAttribute("taikhoan", taiKhoan);
    	req.getRequestDispatcher("/views/DashboardAdmin.jsp").forward(req, resp);//forwarding the request
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}
