package models;
import java.math.BigDecimal;
import java.time.LocalTime;

public class ChuyenDi {
	private int iD;
	private String maTuyen;
	private LocalTime gioiDi;
	private LocalTime gioiDen;
	public LocalTime getGioiDen() {
		return gioiDen;
	}
	public void setGioiDen(LocalTime gioiDen) {
		this.gioiDen = gioiDen;
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
	public LocalTime getGioiDi() {
		return gioiDi;
	}
	public void setGioiDi(LocalTime gioiDi) {
		this.gioiDi = gioiDi;
	}
	public BigDecimal getDonGia() {
		return donGia;
	}
	public void setDonGia(BigDecimal donGia) {
		this.donGia = donGia;
	}
	public ChuyenDi(int iD, String maTuyen, LocalTime gioiDi, LocalTime gioiDen, BigDecimal donGia, TuyenDi tuyenDi) {
		super();
		this.iD = iD;
		this.maTuyen = maTuyen;
		this.gioiDi = gioiDi;
		this.gioiDen = gioiDen;
		this.donGia = donGia;
		this.tuyenDi = tuyenDi;
	}
	public ChuyenDi(int iD, String maTuyen, LocalTime gioiDi, LocalTime gioiDen, BigDecimal donGia) {
		super();
		this.iD = iD;
		this.maTuyen = maTuyen;
		this.gioiDi = gioiDi;
		this.gioiDen = gioiDen;
		this.donGia = donGia;
	}
	public ChuyenDi(int iD, LocalTime gioiDi, LocalTime gioiDen, BigDecimal donGia, TuyenDi tuyenDi) {
		super();
		this.iD = iD;
		this.gioiDi = gioiDi;
		this.gioiDen = gioiDen;
		this.donGia = donGia;
		this.tuyenDi = tuyenDi;
	}
	


}
