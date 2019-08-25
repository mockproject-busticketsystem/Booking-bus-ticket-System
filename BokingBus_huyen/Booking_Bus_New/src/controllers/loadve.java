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

		List<VeXe> loaddiemdi = null;
		loaddiemdi = vexeDao.filterDistinct("a","DiaDiemDi");
		req.setAttribute("loaddiemdi", loaddiemdi);
		if(chondiemdi!=null) {
			List<VeXe> loaddiemden = null;
			loaddiemden = vexeDao.filterDistinct2(chondiemdi,"DiaDiemDi","b","DiaDiemDen");
			req.setAttribute("loaddiemden", loaddiemden);
		}

		List<VeXe> ve = null;
		ve = vexeDao.getAllVe(chondiemdi,chondiemden,search);
		req.setAttribute("AllVe", ve);
		req.getRequestDispatcher("/views/NhanVienAllVe.jsp").forward(req, resp);//forwarding the request
	}
}
