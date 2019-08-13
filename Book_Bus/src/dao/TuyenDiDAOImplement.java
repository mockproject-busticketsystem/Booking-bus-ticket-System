package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.ConnectionUtils;
import connect.DBConnect;
import models.TuyenDi;

public class TuyenDiDAOImplement implements TuyenDiDAO {
	@Override
	public ArrayList<String> getDiaDiemDi() {
		Connection connection = null;
		ArrayList<String> arr = null;
		try {
			connection = ConnectionUtils.getConnection();
			String sql = "SELECT DISTINCT DiaDiemDi FROM tuyendi";
			arr = new ArrayList<>();
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				arr.add(rs.getString("DiaDiemDi"));
			}
			connection.close();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return arr;
	}

	@Override
	public String getIdTuyen(String DiemDi, String DiemDen) {
		String idTuyen = null;
		// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = ConnectionUtils.getConnection();
			String sql = "SELECT Id FROM tuyendi where DiaDiemDi = ? and DiaDiemDen = ?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, DiemDi);
			ps.setString(2, DiemDen);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				idTuyen = rs.getString("Id");
			}
			connection.close();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return idTuyen;
	}

	@Override
	public ArrayList<String> getDiaDiemDen() {
		// TODO Auto-generated method stub
		Connection connection = null;
		ArrayList<String> arr = null;
		try {
			connection = ConnectionUtils.getConnection();
			String sql = "SELECT DISTINCT DiaDiemDen FROM tuyendi";
			arr = new ArrayList<>();
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				arr.add(rs.getString("DiaDiemDi"));
			}
			connection.close();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return arr;
	}
	@Override
	public ArrayList<String> getDiaDiemDenTheoDDD(String diaDiemDi)
	{
		ArrayList<String> arrayTuyen = new ArrayList<>();
		Connection conn= null;
		try {
			conn = ConnectionUtils.getConnection();
			String sql = "Select DISTINCT DiaDiemDen from tuyendi where diadiemdi= ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, diaDiemDi);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				arrayTuyen.add(rs.getString("DiaDiemDen"));
			}
			conn.close();
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return arrayTuyen;
	}
	
}
