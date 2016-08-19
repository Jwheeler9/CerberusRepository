package cerberus.ims.beans;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="IMS_PO_LINE")
public class PoLine 
{
	//----------------------------------
	// Attributes
	@EmbeddedId
	private CompositeKey compKey;
	
	@Column(name="UNIT_PRICE", nullable=false)
	private double unitPrice;
	
	@Column(name="QUANTITY_ORDERED", nullable=false)
	private int quantityOrdered;
	
	//----------------------------------
	// Relationship Mapping
	@ManyToOne
	@JoinColumn(name="PRODUCT_UPC", nullable=false)
	private Product product;
	
	//----------------------------------
	// Accessors
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public int getQuantityOrdered() {
		return quantityOrdered;
	}
	public void setQuantityOrdered(int quantityOrdered) {
		this.quantityOrdered = quantityOrdered;
	}
	public CompositeKey getCompKey() {
		return compKey;
	}
	public void setCompKey(CompositeKey compKey) {
		this.compKey = compKey;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	//----------------------------------
	// Constructors
	public PoLine() {
		super();
	}
	public PoLine(CompositeKey compKey, double unitPrice, int quantityOrdered, Product product) {
		this();
		this.compKey = compKey;
		this.unitPrice = unitPrice;
		this.quantityOrdered = quantityOrdered;
		this.product = product;
	}
}

