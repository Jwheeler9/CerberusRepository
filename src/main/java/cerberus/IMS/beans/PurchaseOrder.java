package cerberus.IMS.beans;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="IMS_PURCHASE_ORDER")
public class PurchaseOrder {
	
	//----------------------------------
	// Attributes
	@Id
	@Column(name="ORDER_NUMBER", nullable=false, unique=true)
	private int orderNumber;

	@Column(name="SUBTOTAL", nullable=false)
	private int subtotal;

	@Column(name="PURCHASE_DATE", nullable=false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date purchaseDate;
	
	@Column(name="TAX_AMOUNT", nullable=false)
	private int taxAmount;

	@Column(name="PO_TOTAL", nullable=false)
	private int poTotal;
	
	@Column(name="CLIENT_ID", nullable=false)
	private int clientId;
	
	//----------------------------------
	// Relationship Mapping
	@ManyToOne
	@JoinColumn(name="CLIENTS")
	private Set<Client> clients;
	
	@OneToMany(mappedBy="orderNumber")
	private Set<PoLine> poLines;
	
	//----------------------------------
	// Accessors
	public int getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}
	public int getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(int subtotal) {
		this.subtotal = subtotal;
	}
	public Date getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public int getTaxAmount() {
		return taxAmount;
	}
	public void setTaxAmount(int taxAmount) {
		this.taxAmount = taxAmount;
	}
	public int getPoTotal() {
		return poTotal;
	}
	public void setPoTotal(int poTotal) {
		this.poTotal = poTotal;
	}
	public int getClientId() {
		return clientId;
	}
	public void setClientId(int clientId) {
		this.clientId = clientId;
	}
	
	//----------------------------------
	// Constructors
	public PurchaseOrder(){
		super();
	}
	public PurchaseOrder(int orderNumber, int subtotal, Date purchaseDate, int taxAmount, int poTotal, int clientId) {
		this();
		this.orderNumber = orderNumber;
		this.subtotal = subtotal;
		this.purchaseDate = purchaseDate;
		this.taxAmount = taxAmount;
		this.poTotal = poTotal;
		this.clientId = clientId;
	}
}
