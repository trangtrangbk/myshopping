package model;

public class CartOrder {
	private int cart_id;
	private int pro_id;
	private int quatity;
	private int order_id;
	private int customer_id;
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public int getQuatity() {
		return quatity;
	}
	public void setQuatity(int quatity) {
		this.quatity = quatity;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public CartOrder(int cart_id, int pro_id, int quatity, int order_id, int customer_id) {
		super();
		this.cart_id = cart_id;
		this.pro_id = pro_id;
		this.quatity = quatity;
		this.order_id = order_id;
		this.customer_id = customer_id;
	}
	public CartOrder() {
		super();
	}
	@Override
	public String toString() {
		return "CartOrder [cart_id=" + cart_id + ", pro_id=" + pro_id + ", quatity=" + quatity + ", order_id="
				+ order_id + ", customer_id=" + customer_id + "]";
	}
	
}
