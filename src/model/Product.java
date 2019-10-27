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
	private String color;
	private String lcd;
	private String ram;
	private String hdd;
	private String ssd;
	private String vga;
	private String pin;
	private String os;
	private String cpu;
	private String weight;
	private String other;
	private int view;
	private Timestamp date;
	private Category cat;
	private int status;
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(int id, String name, int price, String description, String detail, String picture, String color,
			String lcd, String ram, String hdd, String ssd, String vga, String pin, String os, String cpu,
			String weight, String other, int view, Timestamp date, Category cat, int status) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.description = description;
		this.detail = detail;
		this.picture = picture;
		this.color = color;
		this.lcd = lcd;
		this.ram = ram;
		this.hdd = hdd;
		this.ssd = ssd;
		this.vga = vga;
		this.pin = pin;
		this.os = os;
		this.cpu = cpu;
		this.weight = weight;
		this.other = other;
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
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getLcd() {
		return lcd;
	}
	public void setLcd(String lcd) {
		this.lcd = lcd;
	}
	public String getRam() {
		return ram;
	}
	public void setRam(String ram) {
		this.ram = ram;
	}
	public String getHdd() {
		return hdd;
	}
	public void setHdd(String hdd) {
		this.hdd = hdd;
	}
	public String getSsd() {
		return ssd;
	}
	public void setSsd(String ssd) {
		this.ssd = ssd;
	}
	public String getVga() {
		return vga;
	}
	public void setVga(String vga) {
		this.vga = vga;
	}
	public String getPin() {
		return pin;
	}
	public void setPin(String pin) {
		this.pin = pin;
	}
	public String getOs() {
		return os;
	}
	public void setOs(String os) {
		this.os = os;
	}
	public String getCpu() {
		return cpu;
	}
	public void setCpu(String cpu) {
		this.cpu = cpu;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
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
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", price=" + price + ", description=" + description
				+ ", detail=" + detail + ", picture=" + picture + ", color=" + color + ", lcd=" + lcd + ", ram=" + ram
				+ ", hdd=" + hdd + ", ssd=" + ssd + ", vga=" + vga + ", pin=" + pin + ", os=" + os + ", cpu=" + cpu
				+ ", weight=" + weight + ", other=" + other + ", view=" + view + ", date=" + date + ", cat=" + cat
				+ ", status=" + status + "]";
	}
	
		
}
	