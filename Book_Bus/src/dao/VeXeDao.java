package dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.ConnectionUtils;
import connect.DBConnect;
import models.KhachHang;
import models.TaiKhoan;

import connect.ConnectionUtils;
import models.ChuyenDi;
import models.TuyenDi;
import models.VeXe;

public class VeXeDao {
	TuyenDiDAOImplement tuyenDiDao = new TuyenDiDAOImplement();
	public ArrayList<String> getStringMaGhe(LocalDate ngayDi, LocalTime gioiDi,String idChuyen)
	{
		ArrayList<String> maGhe = null;
		try {
			Connection conn = ConnectionUtils.getConnection();
			String query="SELECT * FROM vexe where NgayDi = ? and GioiDi = ? and IdChuyen =? ";
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
			ps.setDate(1,Date.valueOf(ngayDi));
			ps.setTime(2,Time.valueOf(gioiDi));
			ps.setString(3, idChuyen);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				String ma = rs.getString("MaGhe");
				maGhe.add(ma);
			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return maGhe;
	}
	public ArrayList<VeXe> viewAllTicketCusTom(String cMND)
	{
		ArrayList<VeXe> array = null;
		try {
			Connection conn = ConnectionUtils.getConnection();
			String query="SELECT * FROM vexe INNER JOIN chuyendi ON vexe.IdChuyen=chuyendi.id where vexe.CMND = ?" ;
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
			ps.setString(1, cMND);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				int iDChuyen = rs.getInt("IdChuyen");
				String maTuyen = rs.getString("MaTuyen");
				LocalTime gio = LocalTime.parse(rs.getString("Gio"));
				LocalDate ngayDi = LocalDate.parse(rs.getString("NgayDi"));
				String hangDoi = rs.getString("HangDoi");
				String maGhe = rs.getString("MaGhe");
				BigDecimal donGia = rs.getBigDecimal("DonGia");
				Boolean status = rs.getBoolean("Status");
				LocalDateTime ngayDat = rs.getTimestamp("NgayGioDat").toLocalDateTime();
				TuyenDi tuyenDi = tuyenDiDao.getTuyenDi(maTuyen);
				LocalTime gioDen = LocalTime.parse(rs.getString("GioDen"));
				ChuyenDi chuyenDi = new ChuyenDi(iDChuyen,gio,gioDen,donGia,tuyenDi);
				VeXe veXe = new VeXe(cMND,ngayDi,hangDoi,maGhe,donGia,status,chuyenDi,ngayDat);
				array.add(veXe);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return array;

	}
	public ArrayList<VeXe> viewAllTicketCusTomNotChanage(String cMND)
	{
		ArrayList<VeXe> array = new ArrayList<>();
		try {

			Connection conn = ConnectionUtils.getConnection();
			String query="SELECT * FROM vexe INNER JOIN chuyendi ON vexe.IdChuyen=chuyendi.id where vexe.CMND = ? and Status = ?";
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
			ps.setString(1, cMND);
			ps.setBoolean(2, true);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				int iDChuyen = rs.getInt("IdChuyen");
				String maTuyen = rs.getString("MaTuyen");
				LocalTime gio = LocalTime.parse(rs.getString("Gio"));
				LocalDate ngayDi = LocalDate.parse(rs.getString("NgayDi"));
				String hangDoi = rs.getString("HangDoi");
				String maGhe = rs.getString("MaGhe");
				BigDecimal donGia = rs.getBigDecimal("DonGia");
				Boolean status = rs.getBoolean("Status");
				LocalDateTime ngayDat = rs.getTimestamp("NgayGioDat").toLocalDateTime();
				TuyenDi tuyenDi = tuyenDiDao.getTuyenDi(maTuyen);
				LocalTime gioDen = LocalTime.parse(rs.getString("GioDen"));
				ChuyenDi chuyenDi = new ChuyenDi(iDChuyen,gio,gioDen,donGia,tuyenDi);
				VeXe veXe = new VeXe(cMND,ngayDi,hangDoi,maGhe,donGia,status,chuyenDi,ngayDat);
				array.add(veXe);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return array;

	}
	public ArrayList<VeXe> viewAllTicketCusTomChanage(String cMND)
	{
		ArrayList<VeXe> array = new ArrayList<>();
		try {
			Connection conn = ConnectionUtils.getConnection();
			String query="SELECT * FROM vexe INNER JOIN chuyendi ON vexe.IdChuyen=chuyendi.id where vexe.CMND = ? and Status = ?";
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
			ps.setString(1, cMND);
			ps.setBoolean(2, false);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				int iDChuyen = rs.getInt("IdChuyen");
				String maTuyen = rs.getString("MaTuyen");
				LocalTime gio = LocalTime.parse(rs.getString("Gio"));
				LocalDate ngayDi = LocalDate.parse(rs.getString("NgayDi"));
				String hangDoi = rs.getString("HangDoi");
				String maGhe = rs.getString("MaGhe");
				BigDecimal donGia = rs.getBigDecimal("DonGia");
				Boolean status = rs.getBoolean("Status");
				LocalDateTime ngayDat = rs.getTimestamp("NgayGioDat").toLocalDateTime();
				TuyenDi tuyenDi = tuyenDiDao.getTuyenDi(maTuyen);
				LocalTime gioDen = LocalTime.parse(rs.getString("GioDen"));
				ChuyenDi chuyenDi = new ChuyenDi(iDChuyen,gio,gioDen,donGia,tuyenDi);
				VeXe veXe = new VeXe(cMND,ngayDi,hangDoi,maGhe,donGia,status,chuyenDi,ngayDat);
				array.add(veXe);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return array;

	}
	public Boolean deleteTickeNotPay(VeXe veXe)
	{
		Connection conn;
		try {
			conn = ConnectionUtils.getConnection();
			String sql = "delete from Vexe where CMND=? and IdChuyen=? and NgayDi=? and HangDoi=? and MaGhe=? and status=?";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, veXe.getcMND());
			pstm.setInt(2, veXe.getiDChuyen());
			pstm.setDate(3, java.sql.Date.valueOf(veXe.getNgayDi()));
			pstm.setString(4,veXe.getHangDoi());
			pstm.setString(5,veXe.getMaGhe());
			pstm.setBoolean(6,veXe.getStatus());
			int res = pstm.executeUpdate();
			if(res!=0)
				return true;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	/*public VeXe finVeXe(String cMND,ChuyenDi chuyenDi, LocalDate ngayDi, String hangDoi, String maGhe)
	{
		VeXe veXe = null;
		Connection conn;
		try {
			conn = ConnectionUtils.getConnection();
			String sql = "select *  from Vexe where CMND=? and IdChuyen=? and NgayDi=? and HangDoi=? MaGhe=?";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, cMND);
			pstm.setInt(2,chuyenDi.getiD());
			pstm.setDate(3,Date.valueOf(ngayDi));
			pstm.setString(4,hangDoi);
			pstm.setString(5,maGhe);
			ResultSet rs = pstm.executeQuery();
			while(rs.next())
			{
				
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return veXe;
	}
*/
}
