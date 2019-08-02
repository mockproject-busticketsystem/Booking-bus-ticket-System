package model;

import java.sql.Date;

public class KhachHang {
	private String CMND;
	private String HoTen;
	private Date NgaySinh;
	private String SDT;
	private String Emai;
	public KhachHang(String cMND, String hoTen, Date ngaySinh, String sDT, String emai) {
		super();
		CMND = cMND;
		HoTen = hoTen;
		NgaySinh = ngaySinh;
		SDT = sDT;
		Emai = emai;
	}
	/**
	 * @return the cMND
	 */
	public String getCMND() {
		return CMND;
	}
	/**
	 * @param cMND the cMND to set
	 */
	public void setCMND(String cMND) {
		CMND = cMND;
	}
	/**
	 * @return the hoTen
	 */
	public String getHoTen() {
		return HoTen;
	}
	/**
	 * @param hoTen the hoTen to set
	 */
	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}
	/**
	 * @return the ngaySinh
	 */
	public Date getNgaySinh() {
		return NgaySinh;
	}
	/**
	 * @param ngaySinh the ngaySinh to set
	 */
	public void setNgaySinh(Date ngaySinh) {
		NgaySinh = ngaySinh;
	}
	/**
	 * @return the sDT
	 */
	public String getSDT() {
		return SDT;
	}
	/**
	 * @param sDT the sDT to set
	 */
	public void setSDT(String sDT) {
		SDT = sDT;
	}
	/**
	 * @return the emai
	 */
	public String getEmai() {
		return Emai;
	}
	/**
	 * @param emai the emai to set
	 */
	public void setEmai(String emai) {
		Emai = emai;
	}
}
