package cerberus.IMS.beans;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@SuppressWarnings("serial")
@Embeddable
public class CompositeKey implements Serializable{

	//----------------------------------
	// Attributes
	@Column(name="LINE_NUMBER", nullable=false)
	private int lineNumber;

	//----------------------------------
	// Relationship Mapping
	@ManyToOne
	@JoinColumn(name="ORDER_NUMBER", nullable=false)
	private PurchaseOrder purchaseOrder;
	
	//----------------------------------
	// Accessors
	public int getLineNumber() {
		return lineNumber;
	}

	public void setLineNumber(int lineNumber) {
		this.lineNumber = lineNumber;
	}

	//----------------------------------
	// Constructors
	public CompositeKey(){
		super();
	}
	public CompositeKey(int lineNumber, PurchaseOrder purchaseOrder) {
		this();
		this.lineNumber = lineNumber;
		this.purchaseOrder = purchaseOrder;
	}
}
