package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.ConnectionUtils;
import connect.DBConnect;
import models.KhachHang;
import models.NhanVien;
import models.TaiKhoan;

public class KhachHangDAOImplement implements KhachHangDAO{
	
	@Override
	public KhachHang getKH(String email)  {
		// TODO Auto-generated method stub
		Connection connection = null;
		KhachHang khachHang = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}	
	
		try {
			String sql = "SELECT * FROM khachhang WHERE Email = ? ";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				khachHang = new KhachHang();
				khachHang.setcMND(rs.getString("CMND"));
				khachHang.setHoTen(rs.getString("HoTen"));
				khachHang.setsDT(rs.getString("SDT"));
				khachHang.setEmail(rs.getString("Email"));
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return khachHang;
	}
	@Override
	public boolean InsertKhachHang( KhachHang khachhang) {
		Connection conn = null;
		// TODO Auto-generated method stub
		try {
			conn = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}	
		try {
			conn =  ConnectionUtils.getConnection();
			String sql = "Insert into KhachHang values(?,?,?,?)";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1,khachhang.getcMND());
			pstm.setString(2,khachhang.getHoTen());
			pstm.setString(3,khachhang.getsDT());
			pstm.setString(4,khachhang.getEmail());
			int res = pstm.executeUpdate();
			if(res!=0)
				return true;
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
	public KhachHang showInfor(TaiKhoan taiKhoan) {
		// TODO Auto-generated method stub
		KhachHang customer = new KhachHang();
	try {
		Connection conn =  ConnectionUtils.getConnection();
		String sql = "Select * from KhachHang where email=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1,taiKhoan.getEmail());
		ResultSet rs = pstm.executeQuery();
		while(rs.next())
		{
			customer.setcMND(rs.getString("CMND"));
			customer.setHoTen(rs.getString("HoTen"));
			customer.setsDT(rs.getString("SDT"));
			customer.setEmail(rs.getString("Email"));
		}
		conn.close();
		return customer;
		
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return null;
	}
	@Override
	public boolean UpdateKhachHang(KhachHang khachhang) {
		// TODO Auto-generated method stub
		try {
			Connection conn = null;
			conn =  ConnectionUtils.getConnection();
			String sql = "Update KhachHang set HoTen=?, SDT=? where CMND=?";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1,khachhang.getHoTen());
			pstm.setString(2,khachhang.getsDT());
			pstm.setString(3,khachhang.getcMND());
			int res = pstm.executeUpdate();
			if(res!=0)
				return true;
			else
				return false;
		}
		catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			return false;
		}
	}

}
