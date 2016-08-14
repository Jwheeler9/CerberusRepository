package cerberus.IMS.beans;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@SuppressWarnings("serial")
@Embeddable
public class CompositeKey implements Serializable{

	//----------------------------------
	// Attributes
	@Column(name="ORDER_NUMBER", nullable=false)
	private int orderNumber;
	
	@Column(name="LINE_NUMBER", nullable=false)
	private int lineNumber;

	//----------------------------------
	// Accessors
	public int getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}

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
	public CompositeKey(int orderNumber, int lineNumber) {
		this();
		this.orderNumber = orderNumber;
		this.lineNumber = lineNumber;
	}
}
