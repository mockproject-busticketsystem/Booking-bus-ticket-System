package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NhanVienDAOImplement;
import dao.TaiKhoanDAOImplement;
import models.NhanVien;
@WebServlet("/infoNhanvien")
public class InfoNhanvienServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private NhanVienDAOImplement nvDao = new NhanVienDAOImplement();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
			String email = req.getParameter("email");
			NhanVien nv = null;     
			nv = nvDao.getInfoNhanVien(email);
			req.setAttribute("nv", nv);
	    	req.getRequestDispatcher("/views/infoNhanvien.jsp").forward(req, resp);//forwarding the request
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}
