package model;

import org.hibernate.validator.constraints.NotEmpty;

public class User {
	private int id;
	@NotEmpty(message="Tên đăng nhập không được trống")
	private String username;
	@NotEmpty(message="tên không được trống")
	private String fullname;
	@NotEmpty(message="mật khẩu không được trống")
	private String password;
	private int roleid;
	private int active;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(int id, String username, String fullname, String password, int roleid, int active) {
		super();
		this.id = id;
		this.username = username;
		this.fullname = fullname;
		this.password = password;
		this.roleid = roleid;
		this.active = active;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getRoleid() {
		return roleid;
	}
	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}

	
}
