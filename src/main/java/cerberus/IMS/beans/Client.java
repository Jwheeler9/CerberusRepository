package cerberus.ims.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="IMS_CLIENT")
public class Client {
	
	//----------------------------------
	// Attributes
	@Id
	@Column(name="IMS_CLIENT_ID")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="clientSeq")
	@SequenceGenerator(name="clientSeq", sequenceName="IMS_CLIENT_SEQ", initialValue=1, allocationSize=1)
	private int imsClientId;
	
	@Column(name="CLIENT_NAME", length=100, nullable=false)
	private String clientName;
	
	@Column(name="CLIENT_EMAIL", length=250, nullable=false)
	private String clientEmail;
	
	@Column(name="POINT_OF_CONTACT_NAME", length=250, nullable=false)
	private String pointOfContactName;
	
	@Column(name="CLIENT_PHONE", length=15, nullable=false)
	private String clientPhone;
	
	@Column(name="CLIENT_FAX", length=15, nullable=false)
	private String clientFax;
	
	
	//----------------------------------
	// Ajax Front-End Mapping
	private String passedStateName;
	private String passedClientType;
	private String passedAddressStreet1;
	private String passedAddressStreet2;
	private String passedAddressCity;
	private String passedAddressZip;

	//----------------------------------
	// Realationship Mapping
	@OneToOne
	@JoinColumn(name="ADDRESS_ID", nullable=false, unique=true)
	private Address clientAddress;
	
	@ManyToOne
	@JoinColumn(name="CLIENT_TYPE_ID", nullable=false)
	private ClientType clientType;

	//----------------------------------
	// Accessors
	public int getImsClientId() {
		return imsClientId;
	}
	public void setImsClientId(int imsClientId) {
		this.imsClientId = imsClientId;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public String getClientEmail() {
		return clientEmail;
	}
	public void setClientEmail(String clientEmail) {
		this.clientEmail = clientEmail;
	}
	public String getPointOfContactName() {
		return pointOfContactName;
	}
	public void setPointOfContactName(String pointOfContactName) {
		this.pointOfContactName = pointOfContactName;
	}
	public String getClientPhone() {
		return clientPhone;
	}
	public void setClientPhone(String clientPhone) {
		this.clientPhone = clientPhone;
	}
	public String getClientFax() {
		return clientFax;
	}
	public void setClientFax(String clientFax) {
		this.clientFax = clientFax;
	}
	public Address getClientAddress() {
		return clientAddress;
	}
	public void setClientAddress(Address clientAddress) {
		this.clientAddress = clientAddress;
	}
	public ClientType getClientType() {
		return clientType;
	}
	public void setClientType(ClientType clientType) {
		this.clientType = clientType;
	}
	
	// Ajax Front-End Mapping (Accessors)
	public String getPassedStateName() {
		return passedStateName;
	}
	public void setPassedStateName(String passedStateName) {
		this.passedStateName = passedStateName;
	}
	public String getPassedClientType() {
		return passedClientType;
	}
	public void setPassedClientType(String passedClientType) {
		this.passedClientType = passedClientType;
	}
	public String getPassedAddressStreet1() {
		return passedAddressStreet1;
	}
	public void setPassedAddressStreet1(String passedAddressStreet1) {
		this.passedAddressStreet1 = passedAddressStreet1;
	}
	public String getPassedAddressStreet2() {
		return passedAddressStreet2;
	}
	public void setPassedAddressStreet2(String passedAddressStreet2) {
		this.passedAddressStreet2 = passedAddressStreet2;
	}
	public String getPassedAddressCity() {
		return passedAddressCity;
	}
	public void setPassedAddressCity(String passedAddressCity) {
		this.passedAddressCity = passedAddressCity;
	}
	public String getPassedAddressZip() {
		return passedAddressZip;
	}
	public void setPassedAddressZip(String passedAddressZip) {
		this.passedAddressZip = passedAddressZip;
	}
	
	//----------------------------------
	// Constructors
	public Client(){
		super();
	}
	public Client(String clientName, String clientEmail, String pointOfContactName, String clientPhone, String clientFax, 
				  Address clientAddress, ClientType clientType) {
		this();
		this.clientName = clientName;
		this.clientEmail = clientEmail;
		this.pointOfContactName = pointOfContactName;
		this.clientPhone = clientPhone;
		this.clientFax = clientFax;
		this.clientAddress = clientAddress;
		this.clientType = clientType;
	}
	
	// Ajax Front-End Mapping (Constructor)
	public Client(String clientName, String clientEmail, String pointOfContactName, String clientPhone,
			String clientFax, String passedStateName, String passedClientType, String passedAddressStreet1,
			String passedAddressStreet2, String passedAddressCity, String passedAddressZip) {
		
		this();
		this.clientName = clientName;
		this.clientEmail = clientEmail;
		this.pointOfContactName = pointOfContactName;
		this.clientPhone = clientPhone;
		this.clientFax = clientFax;
		this.passedStateName = passedStateName;
		this.passedClientType = passedClientType;
		this.passedAddressStreet1 = passedAddressStreet1;
		this.passedAddressStreet2 = passedAddressStreet2;
		this.passedAddressCity = passedAddressCity;
		this.passedAddressZip = passedAddressZip;
	}
}
