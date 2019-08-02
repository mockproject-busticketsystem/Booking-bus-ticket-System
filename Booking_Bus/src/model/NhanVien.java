package model;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class NhanVien {
	private int id;
	private String HoTen;
	private Date NgaySinh;
	private String SDT;
	private String Email;
	private String Chucvu;
	public static final DateFormat df=new SimpleDateFormat("MM/dd/yyyy");
	public NhanVien(int id, String hoTen, Date ngaySinh, String sDT, String email, String chucvu) {
		super();
		this.id = id;
		HoTen = hoTen;
		NgaySinh = ngaySinh;
		SDT = sDT;
		Email = email;
		Chucvu = chucvu;
	}
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
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
	 * @return the email
	 */
	public String getEmail() {
		return Email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		Email = email;
	}
	/**
	 * @return the chucvu
	 */
	public String getChucvu() {
		return Chucvu;
	}
	/**
	 * @param chucvu the chucvu to set
	 */
	public void setChucvu(String chucvu) {
		Chucvu = chucvu;
	}
	/**
	 * @return the df
	 */
	public static DateFormat getDf() {
		return df;
	}
	

}
