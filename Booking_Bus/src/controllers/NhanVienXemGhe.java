package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.VexeDAOImplement;
import models.VeXe;
@WebServlet("/DashboardNhanVien/XemGhe")
public class NhanVienXemGhe extends HttpServlet {
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
		String update=null;
		 update=req.getParameter("update");
		 System.out.println(update);
		
		 String delete=null;
		 delete=req.getParameter("delete");
		 System.out.println(delete);
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
