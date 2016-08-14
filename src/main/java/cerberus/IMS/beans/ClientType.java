package cerberus.IMS.beans;

public class ClientType {
	
	private int clientTypeId;
	private int clientType;
	
	public int getClientTypeId() {
		return clientTypeId;
	}
	public void setClientTypeId(int clientTypeId) {
		this.clientTypeId = clientTypeId;
	}
	public int getClientType() {
		return clientType;
	}
	public void setClientType(int clientType) {
		this.clientType = clientType;
	}
	
	public ClientType(){
		super();
	}
	public ClientType(int clientTypeId, int clientType) {
		this();
		this.clientTypeId = clientTypeId;
		this.clientType = clientType;
	}
}
