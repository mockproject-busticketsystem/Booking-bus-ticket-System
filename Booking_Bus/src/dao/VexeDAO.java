package dao;

import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

import models.NhanVien;
import models.TaiKhoan;
import models.VeXe;;
public interface VexeDAO {
	public ArrayList<VeXe> getMaghe(Integer idChuyen, LocalDate ngayDi);
//	public void Booking_Ve(VeXe veXe, String ghe[]);
	public ArrayList<VeXe> viewAllTicketCusTom(String cMND);
	public ArrayList<VeXe> viewAllTicketCusTomNotChanage(String cMND);
	public ArrayList<VeXe> viewAllTicketCusTomChanage(String cMND);
	public Boolean deleteTickeNotPay(VeXe veXe);
	
	public ArrayList<VeXe> getAllInformationVeXe(String value,String count,String value2,String count2);
	public ArrayList<VeXe> filterDistinct(String value,String count);
	public ArrayList<VeXe> filterDistinct2(String value,String count,String value2,String count2);
	public ArrayList<VeXe> getAllVeXe(String IdChuyen,String Ngay);
	public int UpdateStatus(String CMND,String IdChuyen,String Ngay,String MaGhe);
	public int DeleteVe(String CMND,String IdChuyen,String Ngay,String MaGhe);
	
	public boolean Booking_Ve(VeXe veXe);
	public Integer CountGheKhach(String CMND, LocalDate ngayDi, Integer idChuyen);
}
