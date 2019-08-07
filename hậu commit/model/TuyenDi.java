package model;

import java.math.BigDecimal;

public class TuyenDi {
	private String maTuyen;
	private String diaDiemDi;
	private String diaDiemDen;
	private BigDecimal donGia;
	public BigDecimal getDonGia() {
		return donGia;
	}
	public void setDonGia(BigDecimal donGia) {
		this.donGia = donGia;
	}
	public String getMaTuyen() {
		return maTuyen;
	}
	public void setMaTuyen(String maTuyen) {
		this.maTuyen = maTuyen;
	}
	public String getDiaDiemDi() {
		return diaDiemDi;
	}
	public void setDiaDiemDi(String diaDiemDi) {
		this.diaDiemDi = diaDiemDi;
	}
	public String getDiaDiemDen() {
		return diaDiemDen;
	}
	public void setDiaDiemDen(String diaDiemDen) {
		this.diaDiemDen = diaDiemDen;
	}
	public TuyenDi(String maTuyen, String diaDiemDi, String diaDiemDen, BigDecimal donGia) {
		super();
		this.maTuyen = maTuyen;
		this.diaDiemDi = diaDiemDi;
		this.diaDiemDen = diaDiemDen;
		this.donGia = donGia;
	}
	public TuyenDi() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
