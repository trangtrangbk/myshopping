package model;

public class Revenue {
	private String product_name;
	private int quatity;
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getQuatity() {
		return quatity;
	}
	public void setQuatity(int quatity) {
		this.quatity = quatity;
	}
	public Revenue() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Revenue(String product_name, int quatity) {
		super();
		this.product_name = product_name;
		this.quatity = quatity;
	}
	
}
