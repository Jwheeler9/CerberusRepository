package cerberus.ims.data;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;

import cerberus.ims.beans.Client;

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
	// Methods (Push)
	public void createRecord(Object _obj){
		
		session.save(_obj);
	}
	public void updateRecord(Object _obj){
		
		session.update(_obj);
	}
	//----------------------------------
	// Queries (Pull)
	@SuppressWarnings("unchecked")
	public List<Client> getClients(){
	
		Criteria criteria = session.createCriteria(Client.class);
	
		return (List<Client>)criteria.list();
	}
}
