package model;

import java.time.LocalDate;
public class NhanVien {
	private int iD;
	private String hoTen;
	private LocalDate ngaySinh;
	private String sDT;
	private String email;
	private String chucVu;
	public int getiD() {
		return iD;
	}
	public void setiD(int iD) {
		this.iD = iD;
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
	public void setEmail(String email) {
		this.email = email;
	}
	public String getChucVu() {
		return chucVu;
	}
	public void setChucVu(String chucVu) {
		this.chucVu = chucVu;
	}
	public NhanVien(int iD, String hoTen, LocalDate ngaySinh, String sDT, String email, String chucVu) {
		super();
		this.iD = iD;
		this.hoTen = hoTen;
		this.ngaySinh = ngaySinh;
		this.sDT = sDT;
		this.email = email;
		this.chucVu = chucVu;
	}
	
}
