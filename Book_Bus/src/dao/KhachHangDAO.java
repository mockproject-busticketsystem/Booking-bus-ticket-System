package dao;


import java.sql.Connection;
import java.util.ArrayList;

import models.*;

public interface KhachHangDAO {
	public ArrayList<KhachHang> getKH(String email);
	public boolean InsertKhachHang(Connection conn, KhachHang khachhang);
	public boolean UpdateKhachHang(KhachHang khachhang);
	public KhachHang showInfor(TaiKhoan taiKhoan);
}
