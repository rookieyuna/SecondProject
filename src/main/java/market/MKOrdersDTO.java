package market;

import java.text.DecimalFormat;

public class MKOrdersDTO {

	private int order_no;
	private String product_no;
	private String cart_no;
	private String id;
	private String addr;
	private String credit;
	private String order_state;
	private int total_price;
	private int total_count;
	
	
	
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public String getProduct_no()
	{
		return product_no;
	}
	public void setProduct_no(String product_no)
	{
		this.product_no = product_no;
	}
	public String getCart_no()
	{
		return cart_no;
	}
	public void setCart_no(String cart_no)
	{
		this.cart_no = cart_no;
	}
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getAddr()
	{
		return addr;
	}
	public void setAddr(String addr)
	{
		this.addr = addr;
	}
	public String getCredit()
	{
		return credit;
	}
	public void setCredit(String credit)
	{
		this.credit = credit;
	}
	public String getOrder_state()
	{
		return order_state;
	}
	public void setOrder_state(String order_state)
	{
		this.order_state = order_state;
	}
	public int getTotal_price()
	{
		return total_price;
	}
	public void setTotal_price(int total_price)
	{
		this.total_price = total_price;
	}
	public int getTotal_count()
	{
		return total_count;
	}
	public void setTotal_count(int total_count)
	{
		this.total_count = total_count;
	}
}
