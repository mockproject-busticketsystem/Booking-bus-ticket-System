package models;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;

public class ChuyenDi {
	private int iD;
	private String maTuyen;
	private LocalDate ngayDi;
	private LocalTime gio;
	private BigDecimal donGia;
	private String bienSoXe;
	private int soGheTrong;
	private int soGheDat;
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
	public LocalDate getNgayDi() {
		return ngayDi;
	}
	public void setNgayDi(LocalDate ngayDi) {
		this.ngayDi = ngayDi;
	}
	public LocalTime getGio() {
		return gio;
	}
	public void setGio(LocalTime gio) {
		this.gio = gio;
	}
	public BigDecimal getDonGia() {
		return donGia;
	}
	public void setDonGia(BigDecimal donGia) {
		this.donGia = donGia;
	}
	public String getBienSoXe() {
		return bienSoXe;
	}
	public void setBienSoXe(String bienSoXe) {
		this.bienSoXe = bienSoXe;
	}
	public int getSoGheTrong() {
		return soGheTrong;
	}
	public void setSoGheTrong(int soGheTrong) {
		this.soGheTrong = soGheTrong;
	}
	public int getSoGheDat() {
		return soGheDat;
	}
	public void setSoGheDat(int soGheDat) {
		this.soGheDat = soGheDat;
	}
	public ChuyenDi(int iD, String maTuyen, LocalDate ngayDi, LocalTime gio, BigDecimal donGia, String bienSoXe,
			int soGheTrong, int soGheDat) {
		super();
		this.iD = iD;
		this.maTuyen = maTuyen;
		this.ngayDi = ngayDi;
		this.gio = gio;
		this.donGia = donGia;
		this.bienSoXe = bienSoXe;
		this.soGheTrong = soGheTrong;
		this.soGheDat = soGheDat;
	}


}
