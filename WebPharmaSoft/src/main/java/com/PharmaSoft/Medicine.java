package com.PharmaSoft;
import java.util.Date;
public class Medicine 
{
	private String medName, cust_name;
	private Date sold_date;
	private int id,medPrice,medQty,sellQty;
	public Date getSoldDate() {
		return sold_date;
	}	
	public void setSoldDate(Date sold_date) {
		this.sold_date = sold_date;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public int getSellQty() {
		return sellQty;
	}
	public void setSellQty(int sellQty) {
		this.sellQty = sellQty;
	}
	public String getMedName() {
		return medName;
	}
	public void setMedName(String medName) {
		this.medName = medName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMedPrice() {
		return medPrice;
	}
	public void setMedPrice(int medPrice) {
		this.medPrice = medPrice;
	}
	public int getMedQty() {
		return medQty;
	}
	public void setMedQty(int medQty) {
		this.medQty = medQty;
	}
	
}
