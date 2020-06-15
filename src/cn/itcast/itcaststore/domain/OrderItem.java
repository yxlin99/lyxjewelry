package cn.itcast.itcaststore.domain;

public class OrderItem {

	private Order order;//MySQL中通过order_id跟Order类联系起来
	private Product p;//MySQL中通过product_id跟Product类联系起来
	private int buynum;//购买数量
    private String category;//商品类别
    private int userid;//用户id
    
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	
	public String getcategory()
	{
		return category;
	}
	
	public void setcategory(String category)
	{
		this.category=category;
	}
	
	public int getuserid()
	{
		return userid;
	}
	
	public void setuserid(int userid)
	{
		this.userid=userid;
	}
	
	public Product getP() {
		return p;
	}

	public void setP(Product p) {
		this.p = p;
	}

	public int getBuynum() {
		return buynum;
	}

	public void setBuynum(int buynum) {
		this.buynum = buynum;
	}

}
