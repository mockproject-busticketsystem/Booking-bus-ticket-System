package dao;


import java.sql.SQLException;
import java.util.ArrayList;

import models.TuyenDi;

public interface tuyendiDAO {
	public ArrayList<TuyenDi> getDiaDiemDi();
	public ArrayList<TuyenDi> getDiaDiemDen();
	public String getIdTuyen(String DiemDi, String DiemDen);
}
