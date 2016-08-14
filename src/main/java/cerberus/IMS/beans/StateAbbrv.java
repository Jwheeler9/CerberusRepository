package cerberus.IMS.beans;

public class StateAbbrv 
{
	private int abbrvId;
	private String state_name;
	private String state_abbrv;
	public int getAbbrvId() {
		return abbrvId;
	}
	public void setAbbrvId(int abbrvId) {
		this.abbrvId = abbrvId;
	}
	public String getState_name() {
		return state_name;
	}
	public void setState_name(String state_name) {
		this.state_name = state_name;
	}
	public String getState_abbrv() {
		return state_abbrv;
	}
	public void setState_abbrv(String state_abbrv) {
		this.state_abbrv = state_abbrv;
	}
	public StateAbbrv(int abbrvId, String state_name, String state_abbrv) {
		super();
		this.abbrvId = abbrvId;
		this.state_name = state_name;
		this.state_abbrv = state_abbrv;
	}
	public StateAbbrv() {
		super();
	}
}

