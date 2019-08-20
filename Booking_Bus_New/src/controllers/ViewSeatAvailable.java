package controllers;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ChuyenDiDAOImplement;
import dao.TuyenDiDAOImplement;
import dao.VexeDAOImplement;
import models.VeXe;
@WebServlet("/ViewSeatAvalable")
public class ViewSeatAvailable extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private TuyenDiDAOImplement tdDao = new TuyenDiDAOImplement();
	private VexeDAOImplement vxDao = new VexeDAOImplement();
	private ChuyenDiDAOImplement cdDao = new ChuyenDiDAOImplement();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
		String idTuyendi = tdDao.getIdTuyen(diemdi, diemden);
		Integer idChuyen = cdDao.getIdChuyen(idTuyendi,giodi);
		String HangDoi = tdDao.getHangdoi(diemdi, diemden);
		List<VeXe> vexe = null; 
		vexe = vxDao.getMaghe(idChuyen,ngay_di);
		 req.setAttribute("maghe", vexe);
		 req.setAttribute("ngaydi", ngay_di);
		 req.setAttribute("giodi", giodi);
		 req.setAttribute("idchuyen", idChuyen);
		 req.setAttribute("diemdi", diemdi);
		 req.setAttribute("diemden", diemden);
		 req.setAttribute("HangDoi", HangDoi);
		 RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/views/NhanVienXemSoDoGhe.jsp");
			dispatcher.forward(req, resp);
	}

}
