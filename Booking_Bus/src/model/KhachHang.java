package model;

import java.time.LocalDate;

public class KhachHang {
	private String cMND;
	private String hoTen;
	private LocalDate ngaySinh;
	private String sDT;
	private String email;
	public KhachHang()
	{
		
	}
	public KhachHang(String cMND, String hoTen, LocalDate ngaySinh, String sDT, String emai) {
		super();
		this.cMND = cMND;
		this.hoTen = hoTen;
		this.ngaySinh = ngaySinh;
		this.sDT = sDT;
		this.email = emai;
	}
	public String getcMND() {
		return cMND;
	}
	public void setcMND(String cMND) {
		this.cMND = cMND;
	}
	public String getHoTen() {
		return hoTen;
	}
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	public LocalDate getNgaySinh() {
		return ngaySinh;
	}
	public void setNgaySinh(LocalDate ngaySinh) {
		this.ngaySinh = ngaySinh;
	}
	public String getsDT() {
		return sDT;
	}
	public void setsDT(String sDT) {
		this.sDT = sDT;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String emai) {
		this.email = emai;
	}
	
}
