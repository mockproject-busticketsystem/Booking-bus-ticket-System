package dao;

import java.util.ArrayList;

import models.NhanVien;

public interface NhanVienDAO {
	public boolean UpdateNhanVien(NhanVien nhanVien);
	public boolean InsertNhanVien(NhanVien nhanVien);
	public NhanVien getInfoNhanVien(String email);
}
