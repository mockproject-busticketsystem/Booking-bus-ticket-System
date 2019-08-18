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
		
		req.setAttribute("choosethuoctinh2", choosethuoctinh2);
		req.setAttribute("choosethuoctinh", choosethuoctinh);
		req.setAttribute("choosevalues", choosevalues);
		req.setAttribute("choosevalues2", choosevalues2);

		//distinct  filter values
		List<VeXe> idchuyen = null;
		List<VeXe> ngaydi = null;
		List<VeXe> giodi = null;
		List<VeXe> diemdi = null;
		List<VeXe> diemden = null;
		List<VeXe> dongia = null;
		List<VeXe> hangdoi = null;
		List<VeXe> soluong = null;
		String temp="0";
		String temp2="0";
		//	String chonfilter=null;
		if(choosethuoctinh.equals("Id Chuyen"))
		{
			idchuyen = vexeDao.VeXedistinctIDChuyen();	
			req.setAttribute("distinctidchuyen", idchuyen);
			//chonfilter="ve.ngayDi.toString()";
			temp="1";
		}	
		if(choosethuoctinh.equals("Ngay Di"))
		{
			ngaydi = vexeDao.VeXedistinctDate();	
			req.setAttribute("distinctngaydi", ngaydi);
			//chonfilter="ve.ngayDi.toString()";
			temp="2";
		}	
		if(choosethuoctinh.equals("Gio Di"))
		{
			giodi = vexeDao.VeXedistinctTime();	
			req.setAttribute("distinctgiodi", giodi);
			//	chonfilter="ve.gioDi.toString()";
			temp="3";
		}
		if(choosethuoctinh.equals("Diem Di")) 
		{
			diemdi = vexeDao.VeXedistinctDi();
			req.setAttribute("distinctdiemdi", diemdi);
			//chonfilter="ve.diaDiemDi.toString()";
			temp="4";
		}

		if(choosethuoctinh.equals("Diem Den")) 
		{
			diemden = vexeDao.VeXedistinctDen();
			req.setAttribute("distinctdiemden", diemden);
			//	chonfilter="ve.diaDiemDen.toString()";
			temp="5";
		}
		if(choosethuoctinh.equals("Don Gia")) 
		{
			dongia = vexeDao.VeXedistinctDonGia();	
			req.setAttribute("distinctdongia", dongia);
			//	chonfilter="ve.donGia.toString()";
			temp="6";
		}
		if(choosethuoctinh.equals("Hang Doi")) 
		{
			hangdoi = vexeDao.VeXedistinctHangDoi();	
			req.setAttribute("distincthangdoi", hangdoi);
			//		chonfilter="ve.hangDoi.toString()";
			temp="7";
		}
		if(choosethuoctinh.equals("So Luong")) 
		{
			soluong = vexeDao.VeXedistinctSoLuong();
			req.setAttribute("distinctsoluong", soluong);
			//			chonfilter="ve.SoLuong.toString()";

		}
		
		
		//temp2
		if(choosethuoctinh2.equals("Id Chuyen"))
		{
			idchuyen = vexeDao.VeXedistinctIDChuyen();	
			req.setAttribute("distinctidchuyen2", idchuyen);
			//chonfilter="ve.ngayDi.toString()";
			temp2="21";
		}	
		if(choosethuoctinh2.equals("Ngay Di"))
		{
			ngaydi = vexeDao.VeXedistinctDate();	
			req.setAttribute("distinctngaydi2", ngaydi);
			//chonfilter="ve.ngayDi.toString()";
			temp2="22";
		}	
		if(choosethuoctinh2.equals("Gio Di"))
		{
			giodi = vexeDao.VeXedistinctTime();	
			req.setAttribute("distinctgiodi2", giodi);
			//	chonfilter="ve.gioDi.toString()";
			temp2="23";
		}
		if(choosethuoctinh2.equals("Diem Di")) 
		{
			diemdi = vexeDao.VeXedistinctDi();
			req.setAttribute("distinctdiemdi2", diemdi);
			//chonfilter="ve.diaDiemDi.toString()";
			temp2="24";
		}

		if(choosethuoctinh2.equals("Diem Den")) 
		{
			diemden = vexeDao.VeXedistinctDen();
			req.setAttribute("distinctdiemden2", diemden);
			//	chonfilter="ve.diaDiemDen.toString()";
			temp2="25";
		}
		if(choosethuoctinh2.equals("Don Gia")) 
		{
			dongia = vexeDao.VeXedistinctDonGia();	
			req.setAttribute("distinctdongia2", dongia);
			//	chonfilter="ve.donGia.toString()";
			temp2="26";
		}
		if(choosethuoctinh2.equals("Hang Doi")) 
		{
			hangdoi = vexeDao.VeXedistinctHangDoi();	
			req.setAttribute("distincthangdoi2", hangdoi);
			//		chonfilter="ve.hangDoi.toString()";
			temp2="27";
		}
		if(choosethuoctinh2.equals("So Luong")) 
		{
			soluong = vexeDao.VeXedistinctSoLuong();
			req.setAttribute("distinctsoluong2", soluong);
			//			chonfilter="ve.SoLuong.toString()";

		}
		
		
		
		if(choosevalues!=null||choosethuoctinh.equals("All"))
		{
			ve = vexeDao.getAllInformationVeXe(choosevalues,temp,choosevalues2,temp2);
			req.setAttribute("AllInfor", ve);
		}
		//req.setAttribute("chonfilter", chonfilter);
		req.getRequestDispatcher("/views/DashboardNhanVien.jsp").forward(req, resp);//forwarding the request
	}
}
