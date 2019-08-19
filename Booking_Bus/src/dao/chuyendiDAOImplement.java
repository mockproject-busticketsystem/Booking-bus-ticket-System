package dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalTime;
import java.util.ArrayList;

import connect.ConnectionUtils;
import connect.DBConnect;
import models.ChuyenDi;

public class ChuyenDiDAOImplement implements ChuyenDiDAO{
	@Override
	public ChuyenDi findChuyenDi(String idTuyen, LocalTime gioDi) {
		// TODO Auto-generated method stub
		ChuyenDi chuyenDi = null;
		Connection connection = null;
		try {
			connection = ConnectionUtils.getConnection();
			String sql = "SELECT * FROM chuyendi where MaTuyen = ? and GioDi = ?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1,idTuyen);
			ps.setTime(2,java.sql.Time.valueOf(gioDi));
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				int id = rs.getInt("id");
				BigDecimal donGia = rs.getBigDecimal("DonGia");
				LocalTime gioDen = LocalTime.parse(rs.getString("GioDen"));
				chuyenDi = new ChuyenDi(id,idTuyen,gioDi,gioDen,donGia);
			}
			connection.close();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return chuyenDi;
	}
	@Override
	public ChuyenDi findChuyenDi(int id) {
		// TODO Auto-generated method stub
		ChuyenDi chuyenDi = null;
		Connection connection = null;
		try {
			connection = ConnectionUtils.getConnection();
			String sql = "SELECT * FROM chuyendi where id = ?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				BigDecimal donGia = rs.getBigDecimal("DonGia");
				LocalTime gioDen = LocalTime.parse(rs.getString("GioDen"));
				LocalTime gioDi = LocalTime.parse(rs.getString("GioDi"));
				String idTuyen = rs.getString("MaTuyen");
				chuyenDi = new ChuyenDi(id,idTuyen,gioDi,gioDen,donGia);
			}
			connection.close();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return chuyenDi;
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

	@Override
	public Integer getIdChuyen(String idTuyen, String gio) {
		// TODO Auto-generated method stub
		Integer idChuyen = 0;
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
		String sql = "SELECT id FROM chuyendi where MaTuyen = ? and GioDi = ?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, idTuyen);
			ps.setString(2, gio);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				idChuyen = rs.getInt("id");
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return idChuyen;
	}
	@Override
	public ArrayList<ChuyenDi> loadGioDi(String tuyenDi) {
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
				ChuyenDi chuyenDi = new ChuyenDi();
				chuyenDi.setiD(rs.getInt("id"));
				chuyenDi.setGioDi(LocalTime.parse(rs.getString("GioDi")));
				chuyenDi.setDonGia(rs.getBigDecimal("DonGia"));		
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
	public LocalTime getGioDen(String tuyenDi, LocalTime gioDi) {
		// TODO Auto-generated method stub
		return null;
	}
}
