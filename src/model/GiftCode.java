package model;

import org.hibernate.validator.constraints.NotEmpty;

public class GiftCode {
	private int gid;
	
	 @NotEmpty(message = "Vui lòng nhập mã code")
	private String gname;
	 
	 @NotEmpty(message = "Vui lòng nhập số lượng")
	private int amount;
	 
	 @NotEmpty(message = "Vui lòng nhập giá trị giftcode")
	private int value;
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	public GiftCode() {
		super();
	}
	public GiftCode(int gid, String gname, int amount, int value) {
		super();
		this.gid = gid;
		this.gname = gname;
		this.amount = amount;
		this.value = value;
	}
	
	
}
