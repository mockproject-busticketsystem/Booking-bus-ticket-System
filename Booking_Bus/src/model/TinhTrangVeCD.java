package model;

public class TinhTrangVeCD {
	private int iDChuyen;
	private int soGheDat;
	private int soGheTrong;
	public int getiDChuyen() {
		return iDChuyen;
	}
	public void setiDChuyen(int iDChuyen) {
		this.iDChuyen = iDChuyen;
	}
	public int getSoGheDat() {
		return soGheDat;
	}
	public void setSoGheDat(int soGheDat) {
		this.soGheDat = soGheDat;
	}
	public int getSoGheTrong() {
		return soGheTrong;
	}
	public void setSoGheTrong(int soGheTrong) {
		this.soGheTrong = soGheTrong;
	}
	public TinhTrangVeCD(int iDChuyen, int soGheDat, int soGheTrong) {
		super();
		this.iDChuyen = iDChuyen;
		this.soGheDat = soGheDat;
		this.soGheTrong = soGheTrong;
	}
	

}
