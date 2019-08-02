package model;

public class Xe {
	private String BenSo;
	private String TaiXe1;
	private String TaiXe2;
	private int SoGhe;
	public Xe(String benSo, String taiXe1, String taiXe2, int soGhe) {
		super();
		BenSo = benSo;
		TaiXe1 = taiXe1;
		TaiXe2 = taiXe2;
		SoGhe = soGhe;
	}
	public String getBenSo() {
		return BenSo;
	}
	public void setBenSo(String benSo) {
		BenSo = benSo;
	}
	public String getTaiXe1() {
		return TaiXe1;
	}
	public void setTaiXe1(String taiXe1) {
		TaiXe1 = taiXe1;
	}
	public String getTaiXe2() {
		return TaiXe2;
	}
	public void setTaiXe2(String taiXe2) {
		TaiXe2 = taiXe2;
	}
	public int getSoGhe() {
		return SoGhe;
	}
	public void setSoGhe(int soGhe) {
		SoGhe = soGhe;
	}
	

}
