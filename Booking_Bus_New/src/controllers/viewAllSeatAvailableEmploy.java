package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.ChuyenDiDAOImplement;
import dao.TuyenDiDAOImplement;
import dao.VexeDAOImplement;
import models.VeXe;

/**
 * Servlet implementation class viewAllSeatAvailableEmploy
 */
@WebServlet("/viewAllSeatAvailableEmploy")
public class viewAllSeatAvailableEmploy extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TuyenDiDAOImplement tdDao = new TuyenDiDAOImplement();
	private VexeDAOImplement vxDao = new VexeDAOImplement();
	private ChuyenDiDAOImplement cdDao = new ChuyenDiDAOImplement();    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewAllSeatAvailableEmploy() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		/*PrintWriter write = response.getWriter();*/
		String diemdi = request.getParameter("diemdi");
		String diemden = request.getParameter("diemden");
		String giodi = request.getParameter("giodi");
		String ngaydi = request.getParameter("ngaydi");
		LocalDate ngay_di = LocalDate.parse(ngaydi.toString());
		String idTuyendi = tdDao.getIdTuyen(diemdi, diemden);
		Integer idChuyen = cdDao.getIdChuyen(idTuyendi,giodi);
		String HangDoi = tdDao.getHangdoi(diemdi, diemden);
		List<VeXe> vexe = null; 
		vexe = vxDao.getMaghe(idChuyen,ngay_di);
		 String json = new Gson().toJson(vexe);
		request.setAttribute("maghe", vexe);
		response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
	}

}
