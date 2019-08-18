package controllers;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.VexeDAOImplement;
import models.KhachHang;
import models.NhanVien;
import models.TaiKhoan;
import models.VeXe;
@WebServlet("/booking")
public class Booking_Ve extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private VexeDAOImplement vxDao = new VexeDAOImplement();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String CMND = req.getParameter("CMND");
		Integer idchuyen = Integer.valueOf(req.getParameter("idchuyen"));
		LocalDate ngaydi = LocalDate.parse(req.getParameter("ngaydi"));
/*		String HangDoi = req.getParameter("HangDoi");*/
		String  array_ghe = req.getParameter("array_ghe");
		System.out.println("array_ghe" + array_ghe);
		Integer count = array_ghe.split(",").length;
		System.out.println(count);
		VeXe vexe = new VeXe();
		for(int i = 0;i < count;i++) {
			System.out.print( array_ghe.split(",")[i] + "  ");
		try {
			vexe.setcMND(CMND);
			vexe.setiDChuyen(idchuyen);
			vexe.setNgayDi(ngaydi);
			vexe.setMaGhe(array_ghe.split(",")[i]);	
		/*	vexe.setHangDoi(HangDoi);*/
			Boolean success = vxDao.Booking_Ve(vexe);
			if(success == true) {
				req.getServletContext().getRequestDispatcher("/views/booking_toi.jsp").forward(req, resp);
			}else {
				System.out.println("insert fail!");
				}
			}
			catch (Exception e) {
				// TODO: handle exception
				e.getMessage();
			}
		}
		
//		boolean book = vxDao.Booking_Ve(veXe);
//		try {
//			VeXe vexe = new VeXe();
//			vexe.setcMND(CMND);
//			vexe.setiDChuyen(idchuyen);
//			vexe.setNgayDi(ngaydi);
//			vexe.setMaGhe(maGhe);
//				System.out.println("Insert ok!: " );
//				req.getServletContext().getRequestDispatcher("/DashboardAdmin").forward(req, resp);
//			
//		}catch (Exception e) {
//			// TODO: handle exception
//			e.getMessage();
//		}
	}

}
