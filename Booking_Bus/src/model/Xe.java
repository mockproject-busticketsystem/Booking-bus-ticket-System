package model;

public class Xe {
	private String bienSo;
	private String taiXe1;
	private String taiXe2;
	private int soGhe;
	public String getBienSo() {
		return bienSo;
	}
	public void setBienSo(String bienSo) {
		this.bienSo = bienSo;
	}
	public String getTaiXe1() {
		return taiXe1;
	}
	public void setTaiXe1(String taiXe1) {
		this.taiXe1 = taiXe1;
	}
	public String getTaiXe2() {
		return taiXe2;
	}
	public void setTaiXe2(String taiXe2) {
		this.taiXe2 = taiXe2;
	}
	public int getSoGhe() {
		return soGhe;
	}
	public void setSoGhe(int soGhe) {
		this.soGhe = soGhe;
	}
	public Xe(String bienSo, String taiXe1, String taiXe2, int soGhe) {
		super();
		this.bienSo = bienSo;
		this.taiXe1 = taiXe1;
		this.taiXe2 = taiXe2;
		this.soGhe = soGhe;
	}
	
}
