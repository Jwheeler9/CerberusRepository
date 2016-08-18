package cerberus.IMS;

import org.hibernate.Session;

public class DAO {
	
	//----------------------------------
	// Attributes
	private Session session;
	
	public Session getSession() {
		return session;
	}
	public void setSession(Session session) {
		this.session = session;
	}
	
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
	public void createRecord(Object _obj){
		
		session.save(_obj);
	}
	public void updateRecord(Object _obj){
		
		session.update(_obj); // <--- Session.update NOT WORKING
	}
}
