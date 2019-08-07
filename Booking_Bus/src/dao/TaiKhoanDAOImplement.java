package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.ConnectionUtils;
import connect.DBConnect;
import models.KhachHang;
import models.TaiKhoan;

public class TaiKhoanDAOImplement implements TaiKhoanDAO{
	@Override
	public TaiKhoan findUser(String email, String password){
		Connection conn = null;
		try {
			conn = ConnectionUtils.getConnection();
			String sql = "Select * from taikhoan" //
					+ " where email = ? and pass = ?";

			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, email);
			pstm.setString(2, password);
			ResultSet rs = pstm.executeQuery();

			if (rs.next()) {
				String role = rs.getString("Role");
				TaiKhoan user = new TaiKhoan();
				user.setEmail(email);
				user.setPass(password);
				user.setRole(role);
				return user;
			}
			return null;
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			return null;
		}
	}
	@Override
	public TaiKhoan findUser(String email) {
		Connection conn = null;
		try {
			conn = ConnectionUtils.getConnection();
			String sql = "Select * from taikhoan" //
					+ " where email = ?";

			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, email);

			ResultSet rs = pstm.executeQuery();

			if (rs.next()) {
				String password = rs.getString("Pass");
				String role = rs.getString("Role");
				TaiKhoan user = new TaiKhoan();
				user.setEmail(email);
				user.setPass(password);
				user.setRole(role);
				return user;
			}
			return null;
		}
		catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			return null;
		}
	}
	@Override
	public String getHoten(String Role, String email) {
		String hoTen = "";
		// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "SELECT HoTen FROM "+Role+" WHERE Email = ?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, email);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				hoTen = rs.getString("HoTen");
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return hoTen;
	}
	@Override
	public ArrayList<TaiKhoan> getTaikhoan() {
		// TODO Auto-generated method stub
		Connection conn = null;
		try {
			conn = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "select * from taikhoan";
		ArrayList<TaiKhoan> arrTK = new ArrayList<>();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				TaiKhoan tk = new TaiKhoan();
				tk.setEmail(rs.getString("Email"));
				tk.setPass(rs.getString("Pass"));
				tk.setRole(rs.getString("Role"));
				arrTK.add(tk);
			}
			conn.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return arrTK;
	}


}
