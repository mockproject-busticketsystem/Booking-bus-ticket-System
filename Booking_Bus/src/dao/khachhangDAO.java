package dao;


import java.util.ArrayList;

import models.KhachHang;

public interface khachhangDAO {
	public ArrayList<KhachHang> getKH(String email);
}
