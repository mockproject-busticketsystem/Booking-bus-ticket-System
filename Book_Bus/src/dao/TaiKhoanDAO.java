package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import models.*;

import models.TaiKhoan;

public interface TaiKhoanDAO {
	public TaiKhoan findUser(Connection conn,String email, String password)throws SQLException;
	public TaiKhoan findUser(Connection conn,String email)throws SQLException;
	public boolean InsertUserCustom(Connection conn, TaiKhoan taiKhoan);
	public boolean UpdateUser(TaiKhoan taiKhoan);
	
	public String getHoten(String Role, String email); 
	public ArrayList<TaiKhoan> getTaikhoan();
}
