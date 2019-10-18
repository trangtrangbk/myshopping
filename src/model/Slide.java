package model;

public class Slide {
	private int id;
	private String picture;
	private int status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Slide() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Slide(int id, String picture, int status) {
		super();
		this.id = id;
		this.picture = picture;
		this.status = status;
	}
	@Override
	public String toString() {
		return "Slide [id=" + id + ", picture=" + picture + ", status=" + status + "]";
	}
	
	
	
}
