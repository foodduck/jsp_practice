package com.shop.model;

public class BasketVO {
		private int basketid;
		private String userid;
		private int proid;
		private int cnt;
		private int validity;
		public int getBasketid() {
			return basketid;
		}
		public void setBasketid(int basketid) {
			this.basketid = basketid;
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
		public int getValidity() {
			return validity;
		}
		public void setValidity(int validity) {
			this.validity = validity;
		}
}