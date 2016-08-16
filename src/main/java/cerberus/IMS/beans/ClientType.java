package cerberus.IMS.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="IMS_CLIENT_TYPE")
public class ClientType {
	
	//----------------------------------
	// Attributes
	@Id
	@Column(name="CLIENT_TYPE_ID")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="clientIdSeq")
	@SequenceGenerator(name="clientIdSeq", sequenceName="CLIENT_ID_SEQ", initialValue=1, allocationSize=1)
	private int clientTypeId;
	
	@Column(name="CLIENT_TYPE", nullable=false)
	private int clientType;
		
	//----------------------------------
	// Accessors
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
	
	//----------------------------------
	// Constructors
	public ClientType(){
		super();
	}
	public ClientType(int clientTypeId, int clientType) {
		this();
		this.clientTypeId = clientTypeId;
		this.clientType = clientType;
	}
}
