package models;

import java.time.LocalDate;
public class NhanVien {
	public NhanVien() {
		super();
		// TODO Auto-generated constructor stub
	}
	private String cMND;
	private String hoTen;
	private String sDT;
	private String email;
	private String chucVu;
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
	public String getsDT() {
		return sDT;
	}
	public void setsDT(String sDT) {
		this.sDT = sDT;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getChucVu() {
		return chucVu;
	}
	public void setChucVu(String chucVu) {
		this.chucVu = chucVu;
	}
	public NhanVien(String cMND, String hoTen,String sDT, String email, String chucVu) {
		super();
		this.cMND = cMND;
		this.hoTen = hoTen;
		this.sDT = sDT;
		this.email = email;
		this.chucVu = chucVu;
	}
	
}
