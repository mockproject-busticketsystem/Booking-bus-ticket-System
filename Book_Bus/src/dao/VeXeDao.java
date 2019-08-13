package dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

import connect.ConnectionUtils;
import models.ChuyenDi;
import models.VeXe;

public class VeXeDao {
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
				ChuyenDi chuyenDi = new ChuyenDi(iDChuyen,maTuyen,gio,donGia);
				VeXe veXe = new VeXe(cMND,ngayDi,hangDoi,maGhe,donGia,status,chuyenDi);
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
				ChuyenDi chuyenDi = new ChuyenDi(iDChuyen,maTuyen,gio,donGia);
				VeXe veXe = new VeXe(cMND,ngayDi,hangDoi,maGhe,donGia,status,chuyenDi);
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
		ArrayList<VeXe> array = null;
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
				ChuyenDi chuyenDi = new ChuyenDi(iDChuyen,maTuyen,gio,donGia);
				VeXe veXe = new VeXe(cMND,ngayDi,hangDoi,maGhe,donGia,status,chuyenDi);
				array.add(veXe);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return array;
		
	}

}
