package model;

import java.sql.Timestamp;

import org.hibernate.validator.constraints.NotEmpty;

public class Order {
	private int order_id;
	
	@NotEmpty(message = "vui lòng điền tên")
	private String name;
	@NotEmpty(message = "vui lòng điền số điện thoại")
	private String phone;
	private Timestamp date;
	@NotEmpty(message = "vui lòng điền địa chỉ")
	private String address;
	private String payments;
	private String status;
	private String paid;
	private int giftcode;
	private String checked;
	private long bill;
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
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
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPayments() {
		return payments;
	}
	public void setPayments(String payments) {
		this.payments = payments;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPaid() {
		return paid;
	}
	public void setPaid(String paid) {
		this.paid = paid;
	}
	public int getGiftcode() {
		return giftcode;
	}
	public void setGiftcode(int giftcode) {
		this.giftcode = giftcode;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public long getBill() {
		return bill;
	}
	public void setBill(long bill) {
		this.bill = bill;
	}
	public Order(int order_id, String name, String phone, Timestamp date, String address, String payments,
			String status, String paid, int giftcode, String checked, long bill) {
		super();
		this.order_id = order_id;
		this.name = name;
		this.phone = phone;
		this.date = date;
		this.address = address;
		this.payments = payments;
		this.status = status;
		this.paid = paid;
		this.giftcode = giftcode;
		this.checked = checked;
		this.bill = bill;
	}
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
