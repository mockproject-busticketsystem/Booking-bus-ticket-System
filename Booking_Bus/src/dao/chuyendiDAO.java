package dao;

import java.math.BigDecimal;
import java.time.LocalTime;
import java.util.ArrayList;

import models.ChuyenDi;

public interface ChuyenDiDAO {
	public BigDecimal getDongia(String tuyendi);
	public Integer getIdChuyen(String idTuyen, String gio);
	public ArrayList<ChuyenDi> loadGioDi(String tuyenDi);
	public LocalTime getGioDen(String tuyenDi, LocalTime gioDi);
	public ChuyenDi findChuyenDi(String idTuyen, LocalTime gioDi);
}
