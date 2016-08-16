package cerberus.IMS.beans;

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
	private int unitPrice;
	
	@Column(name="QUANTITY_ORDERED", nullable=false)
	private int quantityOrdered;
	
	//----------------------------------
	// Relationship Mapping
	@ManyToOne
	@JoinColumn(name="PRODUCT_UPC")
	private Product product;
	
	//----------------------------------
	// Accessors
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

	//----------------------------------
	// Constructors
	public PoLine() {
		super();
	}
	public PoLine(int unitPrice, int quantityOrdered, int productUpc) {
		this();
		this.unitPrice = unitPrice;
		this.quantityOrdered = quantityOrdered;
	}
}

