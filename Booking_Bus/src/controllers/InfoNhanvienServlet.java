package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TaiKhoanDAOImplement;
import models.NhanVien;
@WebServlet("/infoNhanvien")
public class InfoNhanvienServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private TaiKhoanDAOImplement tkDao = new TaiKhoanDAOImplement();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
			String email = req.getParameter("email");
			List<NhanVien> nv = null;     
			nv = tkDao.getInfoNhanVien(email);
			req.setAttribute("infoNhanvien", nv);
	    	req.getRequestDispatcher("/views/infoNhanvien.jsp").forward(req, resp);//forwarding the request
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}
