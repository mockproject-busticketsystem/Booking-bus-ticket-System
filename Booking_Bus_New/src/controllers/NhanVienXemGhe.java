package controllers;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ChuyenDiDAOImplement;
import dao.VexeDAOImplement;
import models.ChuyenDi;
import models.VeXe;
@WebServlet("/DashboardNhanVien/XemGhe")
public class NhanVienXemGhe extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ChuyenDiDAOImplement chuyenDiDao = new ChuyenDiDAOImplement();
	private VexeDAOImplement vexeDao = new VexeDAOImplement();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String cmnd=req.getParameter("cmnd");
		req.setAttribute("cmnd", cmnd);
		String idchuyen=req.getParameter("idchuyen");
		req.setAttribute("idchuyen", idchuyen);
		String ngaydi=req.getParameter("ngaydi");
		req.setAttribute("ngaydi", ngaydi);
		String maghe=req.getParameter("maghe");
		req.setAttribute("maghe", maghe);

		String giodi=req.getParameter("giodi");
		req.setAttribute("giodi", giodi);
		String diemdi=req.getParameter("diemdi");
		req.setAttribute("diemdi", diemdi);
		String diemden=req.getParameter("diemden");
		req.setAttribute("diemden", diemden);

		String hoten=req.getParameter("hoten");
		req.setAttribute("hoten", hoten);

		String sdt=req.getParameter("sdt");
		req.setAttribute("sdt", sdt);
		String statuschoose="";
		statuschoose=req.getParameter("statuschoose");
		req.setAttribute("statuschoose", statuschoose);
	
		 // tim chuyen di 
		Boolean checkDelete = true;
	    ChuyenDi chuyenDi = chuyenDiDao.findChuyenDi(Integer.parseInt(idchuyen));
	    LocalTime gioDi = chuyenDi.getGioDi();
	    
		// kiem tra xem thoa dieu kien xoa hay khong
	    LocalDate ngayDi = LocalDate.parse(ngaydi);
	    LocalDate today = LocalDate.now();
	    Period period = Period.ofDays(1);
	    LocalDate ngaymai = today.plus(period);
	    LocalTime curr = LocalTime.now();
	    System.out.println("so sanh ngay"+ngayDi.compareTo(today));
	    System.out.println("so sanh gio:"+gioDi.compareTo(curr));
	    if(ngayDi.compareTo(today)<=0)
	    {
	    	checkDelete = false;
	    }
	    else if(ngayDi.compareTo(ngaymai)==0)
	    {
	    	// so sanh gio
	    	
	    	if(gioDi.compareTo(curr)<0)
	    	{
	    		checkDelete = false;
	    	}
	    }
	    System.out.println("checkDelete"+checkDelete);
	    
	    req.setAttribute("checkDelete",checkDelete );


		String update=null;
		update=req.getParameter("update");

		req.setAttribute("update", update);
		String delete=null;
		delete=req.getParameter("delete");


		if(update!=null) {

			vexeDao.UpdateStatus(cmnd,idchuyen,ngaydi,maghe);


		}else
			if(delete!=null) {
				vexeDao.DeleteVe(cmnd,idchuyen,ngaydi,maghe);

			}

		List<VeXe> ghe = null;
		ghe = vexeDao.getKhachGhe(cmnd,idchuyen,ngaydi);
		req.setAttribute("ghe", ghe);

		req.getRequestDispatcher("/views/nhanVienXemGhe.jsp").forward(req, resp);//forwarding the request
	}

}
