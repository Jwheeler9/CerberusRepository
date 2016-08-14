package cerberus.IMS.beans;

public class PoLine 
{
	private int order_number;
	private int line_number;
	private int unitPrice;
	private int quantityOrdered;
	private int product_upc;
	
	public PoLine() {
		super();
	}

	public PoLine(int order_number, int line_number, int unitPrice, int quantityOrdered, int product_upc) {
		super();
		this.order_number = order_number;
		this.line_number = line_number;
		this.unitPrice = unitPrice;
		this.quantityOrdered = quantityOrdered;
		this.product_upc = product_upc;
	}

	public int getOrder_number() {
		return order_number;
	}

	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}

	public int getLine_number() {
		return line_number;
	}

	public void setLine_number(int line_number) {
		this.line_number = line_number;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public int getQuantityOrdered() {
		return quantityOrdered;
	}

	public void setQuantityOrdered(int quantityOrdered) {
		this.quantityOrdered = quantityOrdered;
	}

	public int getProduct_upc() {
		return product_upc;
	}

	public void setProduct_upc(int product_upc) {
		this.product_upc = product_upc;
	}
}
