package dao;

import java.math.BigDecimal;
import java.security.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalTime;
import java.util.ArrayList;

import connect.ConnectionUtils;
import connect.DBConnect;
import models.ChuyenDi;
import models.TuyenDi;

public class TuyenDiDAOImplement implements TuyenDiDAO {
	@Override
	public TuyenDi getTuyenDi(String maTuyen) {
		// TODO Auto-generated method stub
		TuyenDi tuyenDi = null;
		Connection conn= null;
		try {
			conn = ConnectionUtils.getConnection();
			String sql = "Select * from tuyendi where id= ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, maTuyen);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				tuyenDi = new TuyenDi();
				tuyenDi.setDiaDiemDi(rs.getString("DiaDiemDi"));
				tuyenDi.setDiaDiemDen(rs.getString("DiaDiemDen"));
			}
			conn.close();
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tuyenDi;
		
	}
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
	public BigDecimal getDonGia(String idTuyen,String giodi) {
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
		String sql = "SELECT DonGia FROM chuyendi where MaTuyen = ? and GioDi = ?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, idTuyen);
			
			ps.setString(2, giodi);
//			System.out.println(Time.valueOf(giodi));
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

	/*@Override
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
	}*/
	@Override
	public ArrayList<TuyenDi> getDiaDiemDenFill(String DiemDi) {
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
		String sql = "SELECT DISTINCT DiaDiemDen FROM tuyendi where DiaDiemDi=?";
	
		ArrayList<TuyenDi> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, DiemDi);
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


	@Override
	public String getHangdoi(String DiemDi, String DiemDen) {
		// TODO Auto-generated method stub
		String HangDoi = "";
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
		String sql = "SELECT HangDoi FROM tuyendi where DiaDiemDi = ? and DiaDiemDen = ?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, DiemDi);
			ps.setString(2, DiemDen);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				HangDoi = rs.getString("HangDoi");
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return HangDoi;
	}
	@Override
	public ChuyenDi getChuyenDi(Integer IdChuyen) {
		// TODO Auto-generated method stub
		ChuyenDi chuyenDi = null;
		Connection conn= null;
		try {
			conn = ConnectionUtils.getConnection();
			String sql = "Select * from chuyendi where id= ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, IdChuyen);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				chuyenDi = new ChuyenDi();
				chuyenDi.setMaTuyen(rs.getString("MaTuyen"));
				LocalTime giodi = LocalTime.parse(rs.getString("GioDi"));
				chuyenDi.setGioDi(giodi);
				chuyenDi.setDonGia(rs.getBigDecimal("DonGia"));
				LocalTime gioden = LocalTime.parse(rs.getString("GioDen"));
				chuyenDi.setGioDen(gioden);
			}
			conn.close();
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return chuyenDi;
	}
}
