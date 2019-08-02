package dao;


import java.util.ArrayList;

import models.khachhang;

public interface khachhangDAO {
	public ArrayList<khachhang> getKH(String email);
}
