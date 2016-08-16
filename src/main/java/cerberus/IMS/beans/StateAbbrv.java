package cerberus.IMS.beans;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="STATE_ABBRV")
public class StateAbbrv 
{
	//----------------------------------
	// Attributes
	@Id
	@Column(name="STATE_ABBRV_ID")
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="stateAbbrvSequence")
	@SequenceGenerator(name="stateAbbrvSequence",sequenceName="STATE_ABBRV_SEQUENCE",initialValue=1,allocationSize=1)
	private int abbrvId;
	
	@Column(name="STATE_NAME")
	private String stateName;
	
	@Column(name="STATE_ABBRV")
	private String stateAbbrv;
	
	//----------------------------------
	// Accessors
	public int getAbbrvId() {
		return abbrvId;
	}
	public void setAbbrvId(int abbrvId) {
		this.abbrvId = abbrvId;
	}
	public String getStateName() {
		return stateName;
	}
	public void setStateName(String stateName) {
		this.stateName = stateName;
	}
	public String getStateAbbrv() {
		return stateAbbrv;
	}
	public void setStateAbbrv(String stateAbbrv) {
		this.stateAbbrv = stateAbbrv;
	}
	
	//----------------------------------
	// Constructors
	public StateAbbrv() {
		super();
	}
	public StateAbbrv(String stateName, String stateAbbrv) {
		this();
		this.stateName = stateName;
		this.stateAbbrv = stateAbbrv;
	}
}

