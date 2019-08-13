package dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import connect.ConnectionUtils;
import connect.DBConnect;
import models.ChuyenDi;

public class ChuyenDiDAOImplement implements ChuyenDiDAO{

	@Override
	public ArrayList<ChuyenDi> loadGioiDi(String tuyenDi) {
		Connection connection = null;
		ArrayList<ChuyenDi> arr = new ArrayList<>();
		//DateTimeFormatter dtf = DateTimeFormatter.ofPattern("hh:ii");
		try {
			connection = ConnectionUtils.getConnection();
			String sql = "SELECT * FROM chuyendi where MaTuyen = ?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1,tuyenDi);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				int id = rs.getInt("id");
				LocalTime gio = LocalTime.parse(rs.getString("Gio"));
				BigDecimal donGia = rs.getBigDecimal("DonGia");
				ChuyenDi chuyenDi = new ChuyenDi(id,tuyenDi,gio,donGia);
				arr.add(chuyenDi);
			}
			connection.close();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return arr;
	}

	@Override
	public BigDecimal getDongia(String tuyendi) {
		// TODO Auto-generated method stub
		BigDecimal donGia = new BigDecimal("0.0");
		// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "SELECT DonGia FROM chuyendi where MaTuyen = ?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, tuyendi);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				donGia = rs.getBigDecimal("DonGia");
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return donGia;
	}

}
