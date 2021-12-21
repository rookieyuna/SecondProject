package market;

import java.text.DecimalFormat;

public class MKProductDTO {

	private String product_no;
	private String product_name;
	private int price;
	private int milage;
	private String product_info;
	private String product_ofile;
	private String product_sfile;
	DecimalFormat formatter = new DecimalFormat("###,###");
	
	public String getProduct_no() {
		return product_no;
	}
	public void setProduct_no(String product_no) {
		this.product_no = product_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getMilage() {
		return milage;
	}
	public void setMilage(int milage) {
		this.milage = milage;
	}
	public String getProduct_info() {
		return product_info;
	}
	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}
	public String getProduct_ofile() {
		return product_ofile;
	}
	public void setProduct_ofile(String product_ofile) {
		this.product_ofile = product_ofile;
	}
	public String getProduct_sfile() {
		return product_sfile;
	}
	public void setProduct_sfile(String product_sfile) {
		this.product_sfile = product_sfile;
	}
}
