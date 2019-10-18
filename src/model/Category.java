package model;

import org.hibernate.validator.constraints.NotEmpty;

public class Category {
	private int cid;
	
	@NotEmpty(message = "Tên danh mục không được trống")
	private String cname;
	private int parrent_id;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getParrent_id() {
		return parrent_id;
	}
	public void setParrent_id(int parrent_id) {
		this.parrent_id = parrent_id;
	}
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Category(int cid, String cname, int parrent_id) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.parrent_id = parrent_id;
	}
	@Override
	public String toString() {
		return "Category [cid=" + cid + ", cname=" + cname + ", parrent_id=" + parrent_id + "]";
	}
	
}
