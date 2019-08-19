package models;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

public class VeXe {
	private String cMND;
	private int iDChuyen;
	private LocalDate ngayDi;
	public int soLuong;
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	private LocalTime gioDi;
	private String diaDiemDi;
	private String diaDiemDen;
	private String hangDoi;
	private String maGhe;
	private BigDecimal donGia;
	private Boolean status;
	private int statuscount;
	public int getStatuscount() {
		return statuscount;
	}
	public void setStatuscount(int statuscount) {
		this.statuscount = statuscount;
	}
	private ChuyenDi chuyenDi;
	private String ngayGioDat;
	private String hoTen;
	private String sDT;
	
	public VeXe() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getNgayGioDat() {
		return ngayGioDat;
	}
	public void setNgayGioDat(String ngayGioDat) {
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
	public String getDiaDiemDen() {
		return diaDiemDen;
	}
	public void setDiaDiemDen(String diaDiemDen) {
		this.diaDiemDen = diaDiemDen;
	}
	public String getDiaDiemDi() {
		return diaDiemDi;
	}
	public void setDiaDiemDi(String diaDiemDi) {
		this.diaDiemDi = diaDiemDi;
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
	public LocalTime getGioDi() {
		return gioDi;
	}
	public void setGioDi(LocalTime gioDi) {
		this.gioDi = gioDi;
	}
	public VeXe(String cMND, int iDChuyen, LocalDate ngayDi, String hangDoi, String maGhe, BigDecimal donGia,
			Boolean status, String ngayGioDat) {
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
	public VeXe(String cMND, LocalDate ngayDi, String maGhe, BigDecimal donGia, Boolean status,
			ChuyenDi chuyenDi,String ngayGioDat) {
		super();
		this.cMND = cMND;
		this.ngayDi = ngayDi;
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
	public VeXe(String cMND, int iDChuyen, Boolean status, String hangDoi, String maGhe, int soLuong, LocalDate ngayDi,
			LocalTime gioDi, String diaDiemDi, String diaDiemDen, BigDecimal donGia, String ngayGioDat,
			String hoTen, String sDT) {
		super();
		this.cMND = cMND;
		this.iDChuyen = iDChuyen;
		this.status = status;
		this.hangDoi = hangDoi;
		this.maGhe = maGhe;
		this.soLuong = soLuong;
		this.ngayDi = ngayDi;
		this.gioDi = gioDi;
		this.diaDiemDi = diaDiemDi;
		this.diaDiemDen = diaDiemDen;
		this.donGia = donGia;
		this.ngayGioDat = ngayGioDat;
		this.hoTen = hoTen;
		this.sDT = sDT;
	}
}
