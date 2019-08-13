package models;

public class TaiKhoan {
	public TaiKhoan() {
		super();
		// TODO Auto-generated constructor stub
	}
	private String email;
	private String pass;
	private String role;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public TaiKhoan(String email, String pass, String role) {
		super();
		this.email = email;
		this.pass = pass;
		this.role = role;
	}
	
	
}
