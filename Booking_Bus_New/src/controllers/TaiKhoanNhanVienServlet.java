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
@WebServlet("/DashboardNhanVien")
public class TaiKhoanNhanVienServlet extends HttpServlet{
	/**
	 * 
	 */
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



		ArrayList<String> thuoctinh = new ArrayList<String>();
		thuoctinh.add("All");
		thuoctinh.add("Id Chuyen");
		thuoctinh.add("Ngay Di");
		thuoctinh.add("Gio Di");
		thuoctinh.add("Diem Di");
		thuoctinh.add("Diem Den");
		thuoctinh.add("Don Gia");
		thuoctinh.add("Hang Doi");

		req.setAttribute("thuoctinh", thuoctinh);


		//chosse filter
		String choosethuoctinh=req.getParameter("choosethuoctinh");
		String choosethuoctinh2=req.getParameter("choosethuoctinh2");
		String choosevalues=req.getParameter("choosevalues");
		String choosevalues2=req.getParameter("choosevalues2");

		if(choosethuoctinh==null)choosethuoctinh="All";
		if(choosethuoctinh2==null||choosethuoctinh.equals("All"))choosethuoctinh2="All";
		if(choosevalues==null)choosevalues="filter value";
		if(choosevalues2==null)choosevalues2="filter value";
		req.setAttribute("choosethuoctinh2", choosethuoctinh2);
		req.setAttribute("choosethuoctinh", choosethuoctinh);
		req.setAttribute("choosevalues", choosevalues);
		req.setAttribute("choosevalues2", choosevalues2);
		
		//distinct  filter values

		String temp="0";
		String temp2="0";	

		String data[] = {"IdChuyen", "NgayDi", "GioDi","DiaDiemDi","DiaDiemDen","DonGia","HangDoi"};
		String datachoose[]={"Id Chuyen", "Ngay Di", "Gio Di","Diem Di","Diem Den","Don Gia","Hang Doi"};
		for(int i=0;i<datachoose.length;i++)
		{
			if(choosethuoctinh.equals(datachoose[i]))
			{
				temp=data[i];
			}		
			if(choosethuoctinh2.equals(datachoose[i]))
			{
				temp2=data[i];
			}	
		}



		List<VeXe> distinct = null;
		distinct = vexeDao.filterDistinct(choosevalues,temp);
		req.setAttribute("distinct", distinct);
		List<VeXe> distinct2 = null;
		distinct2 = vexeDao.filterDistinct2(choosevalues,temp,choosevalues2,temp2);
		req.setAttribute("distinct2", distinct2);
		
		if(choosevalues!=null||choosethuoctinh.equals("All"))
		{

	if(choosevalues.equals("filter value")) {
		temp="0";
	}
	if(choosevalues2.equals("filter value")) {
		temp2="0";
	}
			ve = vexeDao.getAllInformationVeXe(choosevalues,temp,choosevalues2,temp2);
			req.setAttribute("AllInfor", ve);
		}

		req.getRequestDispatcher("/views/DashboardNhanVien.jsp").forward(req, resp);//forwarding the request
	}
}
