package cerberus.IMS;

import org.hibernate.Session;

public class DAO {
	
	//----------------------------------
	// Attributes
	private Session session;

	//----------------------------------
	// Constructors
	public DAO(){
		super();
	}
	public DAO(Session _session){
		this();
		this.session = _session;
	}
	
	//----------------------------------
	// Methods
	public void insert(Object _obj){
		
		session.save(_obj);
	}
}
