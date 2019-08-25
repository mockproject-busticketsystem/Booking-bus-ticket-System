package dao;


import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalTime;
import java.util.ArrayList;

import models.ChuyenDi;
import models.TuyenDi;

public interface TuyenDiDAO {
	public ArrayList<String> getDiaDiemDi();
//	public ArrayList<TuyenDi> getDiaDiemDen(String diaDiemDi);
	public ArrayList<String> getDiaDiemDen();
	public ArrayList<TuyenDi> getDiaDiemDenFill(String DiemDi);
	public BigDecimal getDonGia(String idTuyen,String giodi);
	public String getIdTuyen(String DiemDi, String DiemDen);
	public ArrayList<String> getDiaDiemDenTheoDDD(String diaDiemDi);
	public String getHangdoi(String DiemDi, String DiemDen);
	public TuyenDi getTuyenDi(String maTuyen);
	public ChuyenDi getChuyenDi(Integer IdChuyen);
}
