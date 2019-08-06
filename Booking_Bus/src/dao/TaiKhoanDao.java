package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connect.ConnectionUtils;
import connect.DBConnect;
import model.TaiKhoan;

public class TaiKhoanDao {
	/*public static TaiKhoan findUser(Connection conn, //
			String email, String password) throws SQLException {
			String sql = "Select * from Taikhoan" //
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
	}

	public static TaiKhoan findUser(Connection conn, String email) throws SQLException {
		String sql = "Select * from Taikhoan" //
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
	}*/
	public static TaiKhoan findUser(String email, String password) throws SQLException {
		Connection conn = null;
		try {
			conn = ConnectionUtils.getConnection();
			String sql = "Select * from Taikhoan" //
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

	public static TaiKhoan findUser(String email) throws SQLException {
		Connection conn = null;
		try {
			conn = ConnectionUtils.getConnection();
			String sql = "Select * from Taikhoan" //
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


}
