package models;

import java.math.BigDecimal;

public class VeXe {
	private String cMND;
	private int iDChuyen;
	private String maTuyen;
	private BigDecimal donGia;
	public VeXe(String cMND, int iDChuyen, String maTuyen, BigDecimal donGia) {
		super();
		this.cMND = cMND;
		this.iDChuyen = iDChuyen;
		this.maTuyen = maTuyen;
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
	public BigDecimal getDonGia() {
		return donGia;
	}
	public void setDonGia(BigDecimal donGia) {
		this.donGia = donGia;
	}
	

}
