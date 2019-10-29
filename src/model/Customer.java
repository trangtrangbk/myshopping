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
	 @NotEmpty(message = "Số điện thoại không được trống")
	private String phone;
	 @NotEmpty(message = "Địa chỉ không được trống")
	private String address;
	private int active;
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Customer(int id, String name, String username, String password, String email, String phone, String address,
			int active) {
		super();
		this.id = id;
		this.name = name;
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.active = active;
	}
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	@Override
	public String toString() {
		return "Customer [id=" + id + ", name=" + name + ", username=" + username + ", password=" + password
				+ ", email=" + email + ", phone=" + phone + ", address=" + address + ", active=" + active + "]";
	}
	
	
	
	
}
