package models;
import java.math.BigDecimal;
import java.time.LocalTime;

public class ChuyenDi {
	private int iD;
	private String maTuyen;
	private LocalTime gioiDi;
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
	public LocalTime getGioiDi() {
		return gioiDi;
	}
	public void setGioiDi(LocalTime gioiDi) {
		this.gioiDi = gioiDi;
	}
	public BigDecimal getDonGia() {
		return donGia;
	}
	public void setDonGia(BigDecimal donGia) {
		this.donGia = donGia;
	}
	public ChuyenDi(int iD, String maTuyen, LocalTime gioiDi, BigDecimal donGia) {
		super();
		this.iD = iD;
		this.maTuyen = maTuyen;
		this.gioiDi = gioiDi;
		this.donGia = donGia;
	}
	


}
