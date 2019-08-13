package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.DBConnect;
import models.KhachHang;

public class khachhangDAOImplement implements khachhangDAO{
	KhachHang customer = new KhachHang();
	@Override
	public ArrayList<KhachHang> getKH(String email)  {
		// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "SELECT * FROM khachhang WHERE Email = '"+email+"'";
		ArrayList<KhachHang> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				customer.setcMND(rs.getString("CMND"));
				customer.setHoTen(rs.getString("HoTen"));
				customer.setNgaySinh(rs.getDate("NgaySinh"));
				customer.setsDT(rs.getString("SDT"));
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
