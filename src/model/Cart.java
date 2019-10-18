package model;

public class Cart {
	private Product product;
	private int quatity;
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getQuatity() {
		return quatity;
	}
	public void setQuatity(int quatity) {
		this.quatity = quatity;
	}
	public Cart() {
		super();
	}
	public Cart(Product product, int quatity) {
		super();
		this.product = product;
		this.quatity = quatity;
	}
	@Override
	public String toString() {
		return "Cart [product=" + product + ", quatity=" + quatity + "]";
	}
	
}
