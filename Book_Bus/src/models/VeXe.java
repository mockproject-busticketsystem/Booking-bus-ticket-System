package models;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class VeXe {
	private String cMND;
	private int iDChuyen;
	private LocalDate ngayDi;
	private String hangDoi;
	private String maGhe;
	private BigDecimal donGia;
	private Boolean status;
	private ChuyenDi chuyenDi;
	private LocalDateTime ngayGioDat;
	public VeXe(String cMND, int iDChuyen, LocalDate ngayDi, String hangDoi, String maGhe, BigDecimal donGia,
			Boolean status, LocalDateTime ngayGioDat) {
		super();
		this.cMND = cMND;
		this.iDChuyen = iDChuyen;
		this.ngayDi = ngayDi;
		this.hangDoi = hangDoi;
		this.maGhe = maGhe;
		this.donGia = donGia;
		this.status = status;
		this.ngayGioDat = ngayGioDat;
	}
	public VeXe(String cMND, LocalDate ngayDi, String hangDoi, String maGhe, BigDecimal donGia, Boolean status,
			ChuyenDi chuyenDi, LocalDateTime ngayGioDat) {
		super();
		this.cMND = cMND;
		this.ngayDi = ngayDi;
		this.hangDoi = hangDoi;
		this.maGhe = maGhe;
		this.donGia = donGia;
		this.status = status;
		this.chuyenDi = chuyenDi;
		this.ngayGioDat = ngayGioDat;
	}
	public VeXe(String cMND, int iDChuyen, LocalDate ngayDi, String hangDoi, String maGhe,Boolean status) {
		super();
		this.cMND = cMND;
		this.iDChuyen = iDChuyen;
		this.ngayDi = ngayDi;
		this.hangDoi = hangDoi;
		this.maGhe = maGhe;
		this.status = status;
	}
	public LocalDateTime getNgayGioDat() {
		return ngayGioDat;
	}
	public void setNgayGioDat(LocalDateTime ngayGioDat) {
		this.ngayGioDat = ngayGioDat;
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
	public LocalDate getNgayDi() {
		return ngayDi;
	}
	public void setNgayDi(LocalDate ngayDi) {
		this.ngayDi = ngayDi;
	}
	public String getHangDoi() {
		return hangDoi;
	}
	public void setHangDoi(String hangDoi) {
		this.hangDoi = hangDoi;
	}
	public String getMaGhe() {
		return maGhe;
	}
	public void setMaGhe(String maGhe) {
		this.maGhe = maGhe;
	}
	public BigDecimal getDonGia() {
		return donGia;
	}
	public void setDonGia(BigDecimal donGia) {
		this.donGia = donGia;
	}
	public Boolean getStatus() {
		return status;
	}
	public ChuyenDi getChuyenDi() {
		return chuyenDi;
	}
	public void setChuyenDi(ChuyenDi chuyenDi) {
		this.chuyenDi = chuyenDi;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}
	
}
