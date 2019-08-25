package dao;

import java.sql.Connection;
import java.util.ArrayList;

import models.KhachHang;
import models.NhanVien;
import models.TaiKhoan;

public interface TaiKhoanDAO {
	public TaiKhoan findUser(String email, String password);
	public TaiKhoan findUser(String email);
	public String getHoten(String Role, String email); 
	public ArrayList<TaiKhoan> getTaikhoan();
	public int UpdateTaiKhoan(TaiKhoan TaiKhoan);
	public ArrayList<KhachHang> getInfoKhachHang(String email);
	
	public NhanVien getInfoAdmin(String email);
	public ArrayList<TaiKhoan> getTaiKhoanFilter(String role);
	public boolean InsertUserCustom(Connection conn, TaiKhoan taiKhoan);
	public boolean UpdateUser(TaiKhoan taiKhoan);
	
}
