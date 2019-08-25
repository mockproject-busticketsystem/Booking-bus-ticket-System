package dao;


import java.sql.Connection;
import java.util.ArrayList;

import models.KhachHang;
import models.TaiKhoan;

public interface KhachHangDAO {
	public KhachHang getKH(String email);
	public boolean InsertKhachHang(KhachHang khachhang);
	public boolean UpdateKhachHang(KhachHang khachhang);
	public KhachHang showInfor(TaiKhoan taiKhoan);
}
