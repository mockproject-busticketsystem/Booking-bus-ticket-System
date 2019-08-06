package model;
import java.math.BigDecimal;
import java.time.LocalTime;

public class ChuyenDi {
	private int iD;
	private String maTuyen;
	private LocalTime gio;
	private BigDecimal donGia;
	
	public int getiD() {
		return iD;
	}
	public void setiD(int iD) {
		this.iD = iD;
	}
	public String getMaTuyen() {
		return maTuyen;
	}
	public void setMaTuyen(String maTuyen) {
		this.maTuyen = maTuyen;
	}
	public BigDecimal getDonGia() {
		return donGia;
	}
	public void setDonGia(BigDecimal donGia) {
		this.donGia = donGia;
	}
	public LocalTime getGio() {
		return gio;
	}
	public void setGio(LocalTime gio) {
		this.gio = gio;
	}
	public ChuyenDi(int iD, String maTuyen, LocalTime gio, BigDecimal donGia) {
		super();
		this.iD = iD;
		this.maTuyen = maTuyen;
		this.gio = gio;
		this.donGia = donGia;
	}
	public ChuyenDi()
	{
		
	}


}
