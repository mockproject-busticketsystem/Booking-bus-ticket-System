package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.ConnectionUtils;
import connect.DBConnect;
import models.KhachHang;
import models.NhanVien;
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
		String sql = "select * from taikhoan where Role = 'nhanvien' or Role = 'khachhang'";
		ArrayList<TaiKhoan> arrTK = new ArrayList<>();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				TaiKhoan tk = new TaiKhoan();
				tk.setEmail(rs.getString("Email"));
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
	@Override
	public ArrayList<TaiKhoan> getTaiKhoanFilter(String role) {
		// TODO Auto-generated method stub
		Connection conn = null;
		try {
			conn = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String sql = null;
		if(role.compareTo("nhanvien")==0||role.compareTo("khachhang")==0){
			sql="select * from taikhoan where Role = ?";

		}else
		{
			 sql = "select * from taikhoan ";
		}
	
		ArrayList<TaiKhoan> arrTK = new ArrayList<>();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			if(role.compareTo("nhanvien")==0||role.compareTo("khachhang")==0) 
			{
			ps.setString(1, role);
			}
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				TaiKhoan tk = new TaiKhoan();
				tk.setEmail(rs.getString("Email"));
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

	@Override
	public int UpdateTaiKhoan(TaiKhoan TaiKhoan) {
		// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
			String sql = "UPDATE taikhoan SET Role = ? WHERE Email = ?";			
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, TaiKhoan.getRole());
			ps.setString(2, TaiKhoan.getEmail());
			System.out.println(ps.executeUpdate());
			ps.executeUpdate();
			return 1;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return 0;
	}
	@Override
	public ArrayList<KhachHang> getInfoKhachHang(String email) {
		// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "SELECT * FROM khachhang WHERE Email = ? ";
		ArrayList<KhachHang> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				KhachHang cus = new KhachHang();
				cus.setcMND(rs.getString("CMND"));
				cus.setHoTen(rs.getString("HoTen"));
				cus.setsDT(rs.getString("SDT"));
				cus.setEmail(rs.getString("Email"));
				arr.add(cus);
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}
	@Override
	public ArrayList<NhanVien> getInfoNhanVien(String email) {
		// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "SELECT * FROM nhanvien where Email = ?";
		ArrayList<NhanVien> arr = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				NhanVien nv = new NhanVien();
				nv.setcMND(rs.getString("CMND"));
				nv.setHoTen(rs.getString("HoTen"));
				nv.setsDT(rs.getString("SDT"));
				nv.setEmail(rs.getString("Email"));
				nv.setChucVu(rs.getString("Chucvu"));
				arr.add(nv);
			}
			connection.close();
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}
	@Override
	public void themUser_NhanVien(TaiKhoan taikhoan, NhanVien nhanVien) {
		// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
			String sql = "Insert taikhoan values(?, ?, ?)";
			String sql1 = "Insert into nhanvien values(?, ?, ?, ?, ?)";
			PreparedStatement ps = connection.prepareStatement(sql);
			PreparedStatement ps1 = connection.prepareStatement(sql1);
			ps.setString(1, taikhoan.getEmail());
			ps.setString(2, taikhoan.getPass());
			ps.setString(3, taikhoan.getRole());
			ps1.setString(1, nhanVien.getcMND());
			ps1.setString(2, nhanVien.getHoTen());
			ps1.setString(3, nhanVien.getsDT());
			ps1.setString(4, nhanVien.getEmail());
			ps1.setString(5, nhanVien.getChucVu());
			System.out.println(ps.executeUpdate());
			System.out.println("insert nh�n vi�n: " + ps1.executeUpdate());
			ps.executeUpdate();
			ps1.executeUpdate();
//			return 1;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
//		return 0;
	}
	@Override
	public void themUser_KhachHang(TaiKhoan taikhoan, KhachHang khachHang) {
		// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = DBConnect.getMySQLConnection();
			String sql = "Insert taikhoan(Email,Pass,Role) values(?, ?, ?)";
			String sql1 = "Insert into khachhang values(?, ?, ?, ?)";
			PreparedStatement ps = connection.prepareStatement(sql);
			PreparedStatement ps1 = connection.prepareStatement(sql1);
			ps.setString(1, taikhoan.getEmail());
			ps.setString(2, taikhoan.getPass());
			ps.setString(3, taikhoan.getRole());
			ps1.setString(1, khachHang.getcMND());
			ps1.setString(2, khachHang.getHoTen());
			ps1.setString(3, khachHang.getsDT());
			ps1.setString(4, khachHang.getEmail());
			System.out.println(ps.executeUpdate());
			System.out.println(ps1.executeUpdate());
			ps.executeUpdate();
			ps1.executeUpdate();
//			retrun 1;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
//		return 0;
	}
}

