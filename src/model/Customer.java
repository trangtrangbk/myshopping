package model;

import org.hibernate.validator.constraints.NotEmpty;

public class Customer {
	private int id;
	
	 @NotEmpty(message = "Tên không được trống")
	private String name;
	 @NotEmpty(message = "Tên đăng nhập không được trống")
	private String username;
	 @NotEmpty(message = "Mật khẩu không được trống")
	private String password;
	 @NotEmpty(message = "Email không được trống")
	private String email;
	private int active;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public Customer(int id, String name, String username, String password, String email, int active) {
		super();
		this.id = id;
		this.name = name;
		this.username = username;
		this.password = password;
		this.email = email;
		this.active = active;
	}
	public Customer() {
		super();
	}
	
	
}
