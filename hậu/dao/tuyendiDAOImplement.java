package dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.DBConnect;
import models.TuyenDi;

public class tuyendiDAOImplement implements tuyendiDAO {
	@Override
	public ArrayList<TuyenDi> getDiaDiemDi() {
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
		String sql = "SELECT DISTINCT DiaDiemDi FROM tuyendi";
		ArrayList<TuyenDi> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				TuyenDi tuyendi = new TuyenDi();
				tuyendi.setDiaDiemDi(rs.getString("DiaDiemDi"));
				arr.add(tuyendi);
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}

	@Override
	public String getIdTuyen(String DiemDi, String DiemDen) {
		String idTuyen = "";
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
		String sql = "SELECT Id FROM tuyendi where DiaDiemDi = ? and DiaDiemDen = ?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, DiemDi);
			ps.setString(2, DiemDen);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				idTuyen = rs.getString("Id");
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return idTuyen;
	}

	@Override
	public ArrayList<TuyenDi> getDiaDiemDen() {
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
		String sql = "SELECT DISTINCT DiaDiemDen FROM tuyendi";
	
		ArrayList<TuyenDi> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
		
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				TuyenDi tuyendi = new TuyenDi();
				tuyendi.setDiaDiemDen(rs.getString("DiaDiemDen"));
				arr.add(tuyendi);
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}
	@Override
	public BigDecimal getDonGia(String DiemDi, String DiemDen) {
		BigDecimal donGia =  new BigDecimal(0.00); 
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
		String sql = "SELECT DonGia FROM tuyendi where DiaDiemDi = ? and DiaDiemDen = ?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, DiemDi);
			ps.setString(2, DiemDen);
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
