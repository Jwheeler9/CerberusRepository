package cerberus.IMS.beans;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name="STATE_ABBRV")
public class StateAbbrv 
{

	@Id
	@Column(name="STATE_ABBRV_ID")
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="stateAbbrvSequence")
	@SequenceGenerator(name="stateAbbrvSequence",sequenceName="STATE_ABBRV_SEQUENCE",initialValue=1,allocationSize=1)
	private int abbrvId;
	@Column(name="STATE_NAME")
	private String stateName;
	@Column(name="STATE_ABBRV")
	private String stateAbbrv;
	
	@OneToMany(mappedBy="stateId")
	private Set<Address> address;
	
	public int getAbbrvId() {
		return abbrvId;
	}
	public void setAbbrvId(int abbrvId) {
		this.abbrvId = abbrvId;
	}
	public String getState_name() {
		return stateName;
	}
	public void setState_name(String state_name) {
		this.stateName = stateName;
	}
	public String getState_abbrv() {
		return stateAbbrv;
	}
	public void setState_abbrv(String state_abbrv) {
		this.stateAbbrv = state_abbrv;
	}
	public StateAbbrv(int abbrvId, String state_name, String state_abbrv) {
		super();
		this.abbrvId = abbrvId;
		this.stateName = state_name;
		this.stateAbbrv = state_abbrv;
	}
	public StateAbbrv() {
		super();
	}
}

