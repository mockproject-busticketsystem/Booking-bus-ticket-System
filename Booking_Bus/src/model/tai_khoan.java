package model;

public class tai_khoan {
	private String Email;
	private String Pass;
	private String Role;
	public tai_khoan(String email, String pass, String role) {
		super();
		Email = email;
		Pass = pass;
		Role = role;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPass() {
		return Pass;
	}
	public void setPass(String pass) {
		Pass = pass;
	}
	public String getRole() {
		return Role;
	}
	public void setRole(String role) {
		Role = role;
	}
	
	
}
