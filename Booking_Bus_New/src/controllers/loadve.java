package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.VexeDAOImplement;

import models.VeXe;
@WebServlet("/LoadVe")
public class loadve extends HttpServlet{


	private static final long serialVersionUID = 1L;

	private VexeDAOImplement vexeDao = new VexeDAOImplement();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		List<VeXe> ve = null;
		ve = vexeDao.getAllVe();
		req.setAttribute("AllVe", ve);
		
		
		req.getRequestDispatcher("/views/NhanVienAllVe.jsp").forward(req, resp);//forwarding the request
	}
}
