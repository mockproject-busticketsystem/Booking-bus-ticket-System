package dao;

import java.math.BigDecimal;
import java.util.ArrayList;

import models.ChuyenDi;

public interface ChuyenDiDAO {
	public BigDecimal getDongia(String tuyendi);
	public ArrayList<ChuyenDi> loadGioiDi(String tuyenDi);
}
