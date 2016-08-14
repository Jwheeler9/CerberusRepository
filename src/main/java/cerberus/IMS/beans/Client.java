package cerberus.IMS.beans;



public class Client {
	
	private int imsClientId;
	private String clientName;
	private String clientEmail;
	private String pointOfContactName;
	private String clientPhone;
	private String clientFax;
	private int addressId;
	private int clientTypeId;
	
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
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
	public int getClientTypeId() {
		return clientTypeId;
	}
	public void setClientTypeId(int clientTypeId) {
		this.clientTypeId = clientTypeId;
	}
	
	public Client(){
		super();
	}
	public Client(int imsClientId, String clientName, String clientEmail, String pointOfContactName, String clientPhone,
			String clientFax, int addressId, int clientTypeId) {
		this();
		this.imsClientId = imsClientId;
		this.clientName = clientName;
		this.clientEmail = clientEmail;
		this.pointOfContactName = pointOfContactName;
		this.clientPhone = clientPhone;
		this.clientFax = clientFax;
		this.addressId = addressId;
		this.clientTypeId = clientTypeId;
	}
}
