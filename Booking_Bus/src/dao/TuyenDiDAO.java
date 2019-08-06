package dao;


import java.sql.SQLException;
import java.util.ArrayList;

import model.TuyenDi;

public interface TuyenDiDAO {
	public ArrayList<TuyenDi> getDiaDiemDi();
	public ArrayList<TuyenDi> getDiaDiemDen(String DiaDiemDi);
	public String getIdTuyen(String DiemDi, String DiemDen);
}
