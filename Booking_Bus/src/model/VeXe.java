package model;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;

public class VeXe {
	private String cMND;
	private int iDChuyen;
	private String maTuyen;
	private boolean status;
	private LocalDate ngayDi;
	private LocalTime gioDi;
	private BigDecimal donGia;
	public VeXe(String cMND, int iDChuyen, String maTuyen, boolean status, LocalDate ngayDi, LocalTime gioDi,
			BigDecimal donGia) {
		super();
		this.cMND = cMND;
		this.iDChuyen = iDChuyen;
		this.maTuyen = maTuyen;
		this.status = status;
		this.ngayDi = ngayDi;
		this.gioDi = gioDi;
		this.donGia = donGia;
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
	public String getMaTuyen() {
		return maTuyen;
	}
	public void setMaTuyen(String maTuyen) {
		this.maTuyen = maTuyen;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
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
	public BigDecimal getDonGia() {
		return donGia;
	}
	public void setDonGia(BigDecimal donGia) {
		this.donGia = donGia;
	}
	
	
	
	

}
