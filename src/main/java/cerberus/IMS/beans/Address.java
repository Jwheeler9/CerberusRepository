package cerberus.IMS.beans;

public class Address {

	private int imsAddressId;
	private String streetAddress1;
	private String streetAddress2;
	private String addressCity;
	private int stateId;
	private String addressZip;
	
	public Address() {
		super();
	}
	public Address(int imsAddressId, String streetAddress1, String streetAddress2, String addressCity, int stateId,
			String addressZip) {
		super();
		this.imsAddressId = imsAddressId;
		this.streetAddress1 = streetAddress1;
		this.streetAddress2 = streetAddress2;
		this.addressCity = addressCity;
		this.stateId = stateId;
		this.addressZip = addressZip;
	}
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
}
