package dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

import connect.DBConnect;
import models.ChuyenDi;
import models.VeXe;

public interface ChuyenDiDAO {
	public BigDecimal getDongia(String tuyendi);
	public Integer getIdChuyen(String idTuyen, String gio);
	public ArrayList<ChuyenDi> loadGioDi(String tuyenDi);
	public LocalTime getGioDen(String tuyenDi, LocalTime gioDi);
	public ChuyenDi findChuyenDi(String idTuyen, LocalTime gioDi);
	public ChuyenDi findChuyenDi(int id);
	
	public ArrayList<VeXe> filterDistinct();
	public ArrayList<VeXe> filterDistinct2(String value);
	public ArrayList<VeXe> getAllChuyen(String diemdi,String diemden,String search);
}
