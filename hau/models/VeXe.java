package models;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;

public class VeXe {
	private String cMND;
	private int iDChuyen;
	private LocalDate ngayDi;
	private LocalTime gioDi;
	private String hangDoi;
	private String maGhe;
	private BigDecimal donGia;
	private String staTus;
	public VeXe(String cMND, int iDChuyen, LocalDate ngayDi, LocalTime gioDi, String hangDoi, String maGhe,
			BigDecimal donGia, String staTus) {
		super();
		this.cMND = cMND;
		this.iDChuyen = iDChuyen;
		this.ngayDi = ngayDi;
		this.gioDi = gioDi;
		this.hangDoi = hangDoi;
		this.maGhe = maGhe;
		this.donGia = donGia;
		this.staTus = staTus;
	}
	public VeXe() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getcMND() {
		return cMND;
	}
	public void setcMND(String cMND) {
		this.cMND = cMND;
	}
	public int getiDChuyen() {
		return iDChuyen;
	}
	public void setiDChuyen(int iDChuyen) {
		this.iDChuyen = iDChuyen;
	}
	public LocalDate getNgayDi() {
		return ngayDi;
	}
	public void setNgayDi(LocalDate ngayDi) {
		this.ngayDi = ngayDi;
	}
	public LocalTime getGioDi() {
		return gioDi;
	}
	public void setGioDi(LocalTime gioDi) {
		this.gioDi = gioDi;
	}
	public String getHangDoi() {
		return hangDoi;
	}
	public void setHangDoi(String hangDoi) {
		this.hangDoi = hangDoi;
	}
	public String getMaGhe() {
		return maGhe;
	}
	public void setMaGhe(String maGhe) {
		this.maGhe = maGhe;
	}
	public BigDecimal getDonGia() {
		return donGia;
	}
	public void setDonGia(BigDecimal donGia) {
		this.donGia = donGia;
	}
	public String getStaTus() {
		return staTus;
	}
	public void setStaTus(String staTus) {
		this.staTus = staTus;
	}

	
	

}
