package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ChuyenDiDAOImplement;
import dao.VexeDAOImplement;

import models.VeXe;
@WebServlet("/LoadChuyen")
public class loadChuyen extends HttpServlet{

	private static final long serialVersionUID = 1L;

	private ChuyenDiDAOImplement chuyendiDao = new ChuyenDiDAOImplement();
	private VexeDAOImplement vexeDao = new VexeDAOImplement();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String chondiemdi=req.getParameter("chondiemdi");
		req.setAttribute("chondiemdi", chondiemdi);

		

		String chondiemden=req.getParameter("chondiemden");
		req.setAttribute("chondiemden", chondiemden);
		
		String search="-999";
		search=req.getParameter("search");
		req.setAttribute("search", search);
		if(search=="")search="-999";
		
//kiem tra chon diem di
		String ktchondiemdi="0";
		 ktchondiemdi=req.getParameter("ktchondiemdi");
		req.setAttribute("ktchondiemdi", ktchondiemdi);
		System.out.println("di "+ chondiemdi);

		
		if(chondiemden!=null && chondiemdi!=null && ktchondiemdi!=null)
		if(ktchondiemdi.equals(chondiemdi)==false)
			chondiemden="filter value";
		
//end kiem tra chon diem di
	
		List<VeXe> ve = null;
		ve = chuyendiDao.getAllChuyen(chondiemdi,chondiemden,search);
		req.setAttribute("AllChuyen", ve);

		List<VeXe> loaddiemdi = null;
		loaddiemdi = chuyendiDao.filterDistinct();
		req.setAttribute("loaddiemdi", loaddiemdi);
		if(chondiemdi!=null) {
			List<VeXe> loaddiemden = null;

			loaddiemden = chuyendiDao.filterDistinct2(chondiemdi);
			req.setAttribute("loaddiemden", loaddiemden);
		}

		req.getRequestDispatcher("/views/NhanVienAllChuyen.jsp").forward(req, resp);//forwarding the request
	}
}
