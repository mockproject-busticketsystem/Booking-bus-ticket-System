package model;

public class chuyen_di {
	private int id;
	private String MaTuyen;
	private String NgayDi;
	private String Gio;
	private float DonGia;
	private String BienSoXe;
	private int SoGheTrong;
	private int SoGheDat;
	public chuyen_di(int id, String maTuyen, String ngayDi, String gio, float donGia, String bienSoXe, int soGheTrong,
			int soGheDat) {
		super();
		this.id = id;
		MaTuyen = maTuyen;
		NgayDi = ngayDi;
		Gio = gio;
		DonGia = donGia;
		BienSoXe = bienSoXe;
		SoGheTrong = soGheTrong;
		SoGheDat = soGheDat;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMaTuyen() {
		return MaTuyen;
	}
	public void setMaTuyen(String maTuyen) {
		MaTuyen = maTuyen;
	}
	public String getNgayDi() {
		return NgayDi;
	}
	public void setNgayDi(String ngayDi) {
		NgayDi = ngayDi;
	}
	public String getGio() {
		return Gio;
	}
	public void setGio(String gio) {
		Gio = gio;
	}
	public float getDonGia() {
		return DonGia;
	}
	public void setDonGia(float donGia) {
		DonGia = donGia;
	}
	public String getBienSoXe() {
		return BienSoXe;
	}
	public void setBienSoXe(String bienSoXe) {
		BienSoXe = bienSoXe;
	}
	public int getSoGheTrong() {
		return SoGheTrong;
	}
	public void setSoGheTrong(int soGheTrong) {
		SoGheTrong = soGheTrong;
	}
	public int getSoGheDat() {
		return SoGheDat;
	}
	public void setSoGheDat(int soGheDat) {
		SoGheDat = soGheDat;
	}

}
