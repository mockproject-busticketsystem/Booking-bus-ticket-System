package dao;


import java.sql.SQLException;
import java.util.ArrayList;

import models.TuyenDi;

public interface TuyenDiDAO {
	public ArrayList<String> getDiaDiemDi();
	public ArrayList<String> getDiaDiemDen();
	public String getIdTuyen(String DiemDi, String DiemDen);
	public ArrayList<String> getDiaDiemDenTheoDDD(String diaDiemDi);
}
