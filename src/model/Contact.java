package model;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class Contact {
	 private int id;
	 
	 @NotEmpty(message = "Vui lòng nhập tên liên hệ")
	 private String name;
	 @NotEmpty(message = "Vui lòng nhập số điện thoại")
	 private String phone;
	 @NotEmpty(message = "Email không được trống")
	 @Email(message="Vui lòng nhập đúng định dạng email")
	 private String email;
	 @NotEmpty(message = "Vui lòng nhập chủ đề")
	 private String subject;
	 @NotEmpty(message = "Vui lòng nhập nội dung")
	 private String message;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Contact() {
		super();
	}
	public Contact(int id, String name, String phone, String email, String subject, String message) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.subject = subject;
		this.message = message;
	}
	 
	 
}
