package dao;

import java.util.ArrayList;

import models.TaiKhoan;

public interface TaiKhoanDAO {
	public TaiKhoan findUser(String email, String password);
	public TaiKhoan findUser(String email);
	public String getHoten(String Role, String email); 
	public ArrayList<TaiKhoan> getTaikhoan();
}
