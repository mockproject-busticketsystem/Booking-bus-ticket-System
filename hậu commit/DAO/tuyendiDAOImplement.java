package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.DBConnect;

import model.TuyenDi;


public class tuyendiDAOImplement implements tuyendiDAO {
	
	@Override
	public ArrayList<TuyenDi> getTuyen() {
		// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "SELECT * FROM tuyendi";
		ArrayList<TuyenDi> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{TuyenDi tuyen = new TuyenDi();
			
				tuyen.setMaTuyen(rs.getString("Id"));
				tuyen.setDiaDiemDi(rs.getString("DiaDiemDi"));
				tuyen.setDiaDiemDen(rs.getString("DiaDienDen"));
				tuyen.setDonGia(rs.getBigDecimal("Gia"));
				arr.add(tuyen);
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}


}
