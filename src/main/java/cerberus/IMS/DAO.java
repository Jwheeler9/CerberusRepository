package cerberus.IMS;

import org.hibernate.Session;

public class DAO {
	
private Session session;

	public DAO(){
		super();
	}

	public DAO(Session _session){
		this();
		this.session = _session;
	}
	
	public void insert(Object _obj){
		
		session.save(_obj);
	}
}
