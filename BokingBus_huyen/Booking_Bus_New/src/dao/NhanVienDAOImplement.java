package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.ConnectionUtils;
import connect.DBConnect;
import models.NhanVien;
import models.TaiKhoan;

public class NhanVienDAOImplement implements NhanVienDAO{

	@Override
	public boolean UpdateNhanVien(NhanVien nhanVien) {
		// TODO Auto-generated method stub
		try {
			Connection conn = ConnectionUtils.getConnection();
			String sql = "update nhanvien set HoTen = ?, SDT = ?, Chucvu = ? where CMND = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, nhanVien.getHoTen());
			ps.setString(2, nhanVien.getsDT());
			ps.setString(3, nhanVien.getChucVu());		
			ps.setString(4, nhanVien.getcMND());
			int res = ps.executeUpdate();
			if(res > 0) 
			return true;
		}
		catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean InsertNhanVien(NhanVien nhanVien) {
		// TODO Auto-generated method stub
		Connection conn = null;
		try {
			conn =  ConnectionUtils.getConnection();
			String sql = "Insert into nhanvien values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, nhanVien.getcMND());
			ps.setString(2, nhanVien.getHoTen());
			ps.setString(3, nhanVien.getsDT());
			ps.setString(4, nhanVien.getEmail());
			ps.setString(5, nhanVien.getChucVu());	
			int res = ps.executeUpdate();
			if(res!=0)
			{
				return true;
			}
			else
				return false;
		}
		catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			return false;
		}
	}
	@Override
	public NhanVien getInfoNhanVien(String email) {
		// TODO Auto-generated method stub
		Connection connection = null;
		NhanVien nv = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "SELECT * FROM nhanvien where Email = ?";
		ArrayList<NhanVien> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				nv = new NhanVien();
				nv.setcMND(rs.getString("CMND"));
				nv.setHoTen(rs.getString("HoTen"));
				nv.setsDT(rs.getString("SDT"));
				nv.setEmail(rs.getString("Email"));
				nv.setChucVu(rs.getString("Chucvu"));
				arr.add(nv);
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return nv;
	}
	

}
