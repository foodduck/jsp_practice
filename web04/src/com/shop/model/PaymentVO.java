package com.shop.model;

public class PaymentVO {
	private String payid;
	private String userid;
	private int proid;
	private int cnt;
	private String addr1;
	private String contact;
	private int paytype;
	private String creditnum;
	private String credipw;
	public String getPayid() {
		return payid;
	}
	public void setPayid(String payid) {
		this.payid = payid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getProid() {
		return proid;
	}
	public void setProid(int proid) {
		this.proid = proid;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public int getPaytype() {
		return paytype;
	}
	public void setPaytype(int paytype) {
		this.paytype = paytype;
	}
	public String getCreditnum() {
		return creditnum;
	}
	public void setCreditnum(String creditnum) {
		this.creditnum = creditnum;
	}
	public String getCredipw() {
		return credipw;
	}
	public void setCredipw(String credipw) {
		this.credipw = credipw;
	}
}