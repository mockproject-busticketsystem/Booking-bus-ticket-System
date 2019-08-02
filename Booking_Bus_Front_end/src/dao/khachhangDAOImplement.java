package dao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.DBConnect;
import models.khachhang;


public class khachhangDAOImplement implements khachhangDAO{
	khachhang customer = new khachhang();
	@Override
	public ArrayList<khachhang> getKH(String email)  {
		// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "SELECT * FROM khachhang WHERE Email = '"+email+"'";
		ArrayList<khachhang> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				customer.setCMND(rs.getString("CMND"));
				customer.setHoTen(rs.getString("HoTen"));
				customer.setNgaySinh(rs.getDate("NgaySinh"));
				customer.setSDT(rs.getString("SDT"));
				customer.setEmail(rs.getString("Email"));
				arr.add(customer);
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}

}
