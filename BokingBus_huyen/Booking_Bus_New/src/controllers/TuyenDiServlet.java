package controllers;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connect.MyConnect;
import dao.ChuyenDiDAOImplement;
import dao.TuyenDiDAOImplement;
import dao.VexeDAOImplement;
import models.KhachHang;
import models.VeXe;
@WebServlet("/idtuyen")
public class TuyenDiServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private TuyenDiDAOImplement tdDao = new TuyenDiDAOImplement();
	private VexeDAOImplement vxDao = new VexeDAOImplement();
	private ChuyenDiDAOImplement cdDao = new ChuyenDiDAOImplement();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String diemdi = req.getParameter("diemdi");
		String diemden = req.getParameter("diemden");
		String giodi = req.getParameter("giodi");
		System.out.println(giodi);
		String ngaydi = req.getParameter("ngaydi");
		LocalDate ngay_di = LocalDate.parse(ngaydi.toString());
	/*	String HangDoi = tdDao.getHangdoi(diemdi, diemden);*/
		System.out.println(ngay_di.getYear());
		String idTuyendi = tdDao.getIdTuyen(diemdi, diemden);
		Integer idChuyen = cdDao.getIdChuyen(idTuyendi,giodi);
		BigDecimal donGia = tdDao.getDonGia(idTuyendi, giodi);
		System.out.println(donGia);
		HttpSession session = req.getSession();
		KhachHang khachHang = MyConnect.getLoginedKhachHang(session);
		String CMND = khachHang.getcMND();
		Integer countGhe = vxDao.CountGheKhach(CMND, ngay_di, idChuyen);
		System.out.println(CMND);
		System.out.println(ngaydi);
		System.out.println(idChuyen);
		System.out.println("so luong ghe: " + countGhe);
		List<VeXe> vexe = null; 
		vexe = vxDao.getMaghe(idChuyen,ngay_di);
		req.setAttribute("countGhe", countGhe);
		/*req.setAttribute("HangDoi", HangDoi);*/
		req.setAttribute("ngaydi", ngay_di);
	    req.setAttribute("giodi", giodi);
	    req.setAttribute("maghe", vexe);
		req.setAttribute("dongia", donGia);
		req.setAttribute("idtuyen", idTuyendi);
		req.setAttribute("idchuyen", idChuyen);
		req.setAttribute("diemdi", diemdi);
		req.setAttribute("diemden", diemden);
		req.setAttribute("CMND",CMND);
//		req.setAttribute("gia", donGia);
		req.getRequestDispatcher("/views/booking_ghe.jsp").forward(req, resp);//forwarding the request
	}

}
