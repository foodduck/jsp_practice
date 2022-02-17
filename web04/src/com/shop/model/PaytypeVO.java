package com.shop.model;

public class PaytypeVO {
	private int paymethod;
	private String paytype; 
	private String acccomp;
	private String accnum;
	public int getPaymethod() {
		return paymethod;
	}
	public void setPaymethod(int paymethod) {
		this.paymethod = paymethod;
	}
	public String getPaytype() {
		return paytype;
	}
	public void setPaytype(String paytype) {
		this.paytype = paytype;
	}
	public String getAcccomp() {
		return acccomp;
	}
	public void setAcccomp(String acccomp) {
		this.acccomp = acccomp;
	}
	public String getAccnum() {
		return accnum;
	}
	public void setAccnum(String accnum) {
		this.accnum = accnum;
	}
}