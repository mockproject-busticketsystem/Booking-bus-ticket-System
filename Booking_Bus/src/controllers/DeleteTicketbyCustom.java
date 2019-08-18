package controllers;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connect.MyConnect;
import dao.ChuyenDiDAOImplement;
import dao.KhachHangDAOImplement;
import dao.TuyenDiDAOImplement;
import dao.VexeDAOImplement;
import models.ChuyenDi;
import models.KhachHang;
import models.TaiKhoan;
import models.VeXe;

/**
 * Servlet implementation class DeleteTicketbyCustom
 */
@WebServlet("/DeleteTicketbyCustom")
public class DeleteTicketbyCustom extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TuyenDiDAOImplement tuyenDiDao = new TuyenDiDAOImplement();
	ChuyenDiDAOImplement chuyenDiDao = new ChuyenDiDAOImplement();
	VexeDAOImplement veXeDao = new VexeDAOImplement();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteTicketbyCustom() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		TaiKhoan taiKhoan = MyConnect.getLoginedUser(session);
		// show thong tin khach
		KhachHangDAOImplement khachHangDao = new KhachHangDAOImplement();
		KhachHang khachHang = khachHangDao.showInfor(taiKhoan);
		String diemDi = request.getParameter("diemDi");
		String diemDen = request.getParameter("diemDen");
		String ngayDi = request.getParameter("ngayDi");
		String gioDi = request.getParameter("gioDi");
		String maGhe = request.getParameter("maGhe");
		String hangDoi = request.getParameter("hangDoi");
		// tim chuyen di 
		String tuyenDi = tuyenDiDao.getIdTuyen(diemDi, diemDen);
		ChuyenDi chuyenDi = chuyenDiDao.findChuyenDi(tuyenDi,LocalTime.parse(gioDi));
		VeXe veXe = new VeXe(khachHang.getcMND(),chuyenDi.getiD(),LocalDate.parse(ngayDi),hangDoi,maGhe,false);
		Boolean success = veXeDao.deleteTickeNotPay(veXe);
		System.out.println(success);
		request.setAttribute("success",success);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
