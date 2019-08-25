package models;
import java.math.BigDecimal;
import java.time.LocalTime;

public class ChuyenDi {
	public ChuyenDi() {
		super();
		// TODO Auto-generated constructor stub
	}
	private int iD;
	private String maTuyen;
	private LocalTime gioDi;
	private LocalTime gioDen;
	public LocalTime getGioDen() {
		return gioDen;
	}
	public void setGioDen(LocalTime gioDen) {
		this.gioDen = gioDen;
	}
	private BigDecimal donGia;
	private TuyenDi tuyenDi;

	/*public ChuyenDi(int iD, LocalTime gioiDi, BigDecimal donGia, TuyenDi tuyenDi) {
		super();
		this.iD = iD;
		this.gioiDi = gioiDi;
		this.donGia = donGia;
		this.tuyenDi = tuyenDi;
	}*/
	public TuyenDi getTuyenDi() {
		return tuyenDi;
	}
	public void setTuyenDi(TuyenDi tuyenDi) {
		this.tuyenDi = tuyenDi;
	}
	public int getiD() {
		return iD;
	}
	public void setiD(int iD) {
		this.iD = iD;
	}
	public String getMaTuyen() {
		return maTuyen;
	}
	public void setMaTuyen(String maTuyen) {
		this.maTuyen = maTuyen;
	}
	public LocalTime getGioDi() {
		return gioDi;
	}
	public void setGioDi(LocalTime gioDi) {
		this.gioDi = gioDi;
	}
	public BigDecimal getDonGia() {
		return donGia;
	}
	public void setDonGia(BigDecimal donGia) {
		this.donGia = donGia;
	}
	public ChuyenDi(int iD, String maTuyen, LocalTime gioDi, LocalTime gioDen, BigDecimal donGia, TuyenDi tuyenDi) {
		super();
		this.iD = iD;
		this.maTuyen = maTuyen;
		this.gioDi = gioDi;
		this.gioDen = gioDen;
		this.donGia = donGia;
		this.tuyenDi = tuyenDi;
	}
	public ChuyenDi(int iD, String maTuyen, LocalTime gioDi, LocalTime gioDen, BigDecimal donGia) {
		super();
		this.iD = iD;
		this.maTuyen = maTuyen;
		this.gioDi = gioDi;
		this.gioDen = gioDen;
		this.donGia = donGia;
	}
	public ChuyenDi(int iD, LocalTime gioDi, LocalTime gioDen, BigDecimal donGia, TuyenDi tuyenDi) {
		super();
		this.iD = iD;
		this.gioDi = gioDi;
		this.gioDen = gioDen;
		this.donGia = donGia;
		this.tuyenDi = tuyenDi;
	}
	


}
