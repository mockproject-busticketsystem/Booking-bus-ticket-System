package model;

import java.math.BigDecimal;

public class VeXe {
	private String cMND;
	private int iDChuyen;
	private String maTuyen;
	private boolean status;
	
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
	public VeXe(String cMND, int iDChuyen, String maTuyen, boolean status) {
		super();
		this.cMND = cMND;
		this.iDChuyen = iDChuyen;
		this.maTuyen = maTuyen;
		this.status = status;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	
	

}
