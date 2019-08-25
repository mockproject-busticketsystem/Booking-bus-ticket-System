package dao;


import java.sql.Connection;
import java.util.ArrayList;

import models.KhachHang;
import models.TaiKhoan;

public interface KhachHangDAO {
	public boolean InsertKhachHang(Connection conn, KhachHang khachhang);
	public boolean UpdateKhachHang(KhachHang khachhang);
	public KhachHang showInfor(TaiKhoan taiKhoan);
	public KhachHang getKH(String email);
}
