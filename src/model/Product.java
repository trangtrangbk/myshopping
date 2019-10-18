package model;

import java.sql.Timestamp;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class Product {
	private int id;
	
	 @NotEmpty(message = "Tên không được trống")
	 @Size(min = 10,max = 50,message="Tên sản phẩm từ 10-50 kí tự ")
	private String name;
	 
	private int price;
	 @NotEmpty(message = "Vui lòng nhập mô tả")
	private String description;
	private String detail;
	private String picture;
	private int view;
	private Timestamp date;
	private Category cat;
	private int status;
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", price=" + price + ", description=" + description
				+ ", detail=" + detail + ", picture=" + picture + ", view=" + view + ", date=" + date + ", cat=" + cat
				+ ", status=" + status + "]";
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(int id, String name, int price, String description, String detail, String picture, int view,
			Timestamp date, Category cat, int status) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.description = description;
		this.detail = detail;
		this.picture = picture;
		this.view = view;
		this.date = date;
		this.cat = cat;
		this.status = status;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public Category getCat() {
		return cat;
	}
	public void setCat(Category cat) {
		this.cat = cat;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
}
	