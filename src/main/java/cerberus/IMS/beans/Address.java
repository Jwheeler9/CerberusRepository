package cerberus.IMS.beans;
import javax.persistence.*;

@Entity
@Table(name="IMS_ADDRESS")
public class Address {

	//----------------------------------
	// Attributes
	@Id
	@Column(name="IMS_ADDRESS_ID", nullable=false, unique=true)
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="addressSequence")
	@SequenceGenerator(name="addressSequence",sequenceName="ADDRESS_SEQUENCE",initialValue=1,allocationSize=1)
	private int imsAddressId;
	
	@Column(name="STREET_ADDRESS_1", length=250, nullable=false)
	private String streetAddress1;
	
	@Column(name="STREET_ADDRESS_2", length=50, nullable=false)
	private String streetAddress2;
	
	@Column(name="ADDRESS_CITY", length=35, nullable=false)
	private String addressCity;

	@Column(name="STATE_ID", nullable=false)
	private int stateId;
	
	@Column(name="ADDRESS_ZIP", length=10, nullable=false)
	private String addressZip;
	
	//----------------------------------
	// Realationship Mapping
	@ManyToOne
	@JoinColumn(name="ABBRV_ID")
	private StateAbbrv state;
	
	//----------------------------------
	// Accessors
	public int getImsAddressId() {
		return imsAddressId;
	}
	public void setImsAddressId(int imsAddressId) {
		this.imsAddressId = imsAddressId;
	}
	public String getStreetAddress1() {
		return streetAddress1;
	}
	public void setStreetAddress1(String streetAddress1) {
		this.streetAddress1 = streetAddress1;
	}
	public String getStreetAddress2() {
		return streetAddress2;
	}
	public void setStreetAddress2(String streetAddress2) {
		this.streetAddress2 = streetAddress2;
	}
	public String getAddressCity() {
		return addressCity;
	}
	public void setAddressCity(String addressCity) {
		this.addressCity = addressCity;
	}
	public int getStateId() {
		return stateId;
	}
	public void setStateId(int stateId) {
		this.stateId = stateId;
	}
	public String getAddressZip() {
		return addressZip;
	}
	public void setAddressZip(String addressZip) {
		this.addressZip = addressZip;
	}
	
	//----------------------------------
	// Constructors
	public Address() {
		super();
	}
	public Address(int imsAddressId, String streetAddress1, String streetAddress2, String addressCity, int stateId,
			String addressZip) {
		this();
		this.imsAddressId = imsAddressId;
		this.streetAddress1 = streetAddress1;
		this.streetAddress2 = streetAddress2;
		this.addressCity = addressCity;
		this.stateId = stateId;
		this.addressZip = addressZip;
	}
}
