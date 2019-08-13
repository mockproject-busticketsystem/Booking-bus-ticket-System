package models;

import java.time.LocalDate;
import java.time.LocalTime;

public class PhieuDatCho {
	public PhieuDatCho(String cMND, String maTuyen, LocalDate ngayDi, LocalTime gioi, String maGhe) {
		super();
		this.cMND = cMND;
		this.maTuyen = maTuyen;
		this.ngayDi = ngayDi;
		this.gioi = gioi;
		this.maGhe = maGhe;
	}
	public String getcMND() {
		return cMND;
	}
	public void setcMND(String cMND) {
		this.cMND = cMND;
	}
	public String getMaTuyen() {
		return maTuyen;
	}
	public void setMaTuyen(String maTuyen) {
		this.maTuyen = maTuyen;
	}
	public LocalDate getNgayDi() {
		return ngayDi;
	}
	public void setNgayDi(LocalDate ngayDi) {
		this.ngayDi = ngayDi;
	}
	public LocalTime getGioi() {
		return gioi;
	}
	public void setGioi(LocalTime gioi) {
		this.gioi = gioi;
	}
	public String getMaGhe() {
		return maGhe;
	}
	public void setMaGhe(String maGhe) {
		this.maGhe = maGhe;
	}
	private String cMND;
	private String maTuyen;
	private LocalDate ngayDi;
	private LocalTime gioi;
	private String maGhe;
	
}
