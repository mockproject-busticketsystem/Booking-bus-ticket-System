package models;

import java.util.Date;

public class khachhang {
private String CMND;
private String HoTen;
private Date NgaySinh;
private String SDT;
private String Email;
public khachhang(String CMND, String HoTen, Date NgaySinh, String SDT, String Email) {
	this.CMND = CMND;
	this.HoTen = HoTen;
	this.NgaySinh = NgaySinh;
	this.SDT = SDT;
	this.Email = Email;
}
public khachhang() {
	super();
	// TODO Auto-generated constructor stub
}
public String getCMND() {
	return CMND;
}
public void setCMND(String cMND) {
	CMND = cMND;
}
public String getHoTen() {
	return HoTen;
}
public void setHoTen(String hoTen) {
	HoTen = hoTen;
}
public Date getNgaySinh() {
	return NgaySinh;
}
public void setNgaySinh(Date ngaySinh) {
	NgaySinh = ngaySinh;
}
public String getSDT() {
	return SDT;
}
public void setSDT(String sDT) {
	SDT = sDT;
}
public String getEmail() {
	return Email;
}
public void setEmail(String email) {
	Email = email;
}
}
