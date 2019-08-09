package dao;


import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;

import models.TuyenDi;

public interface tuyendiDAO {
	public ArrayList<TuyenDi> getDiaDiemDi();
	public ArrayList<TuyenDi> getDiaDiemDen();

	public BigDecimal getDonGia(String DiemDi, String DiemDen);
	public String getIdTuyen(String DiemDi, String DiemDen);
}
