package cerberus.ims.data;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;

import cerberus.ims.beans.Client;
import cerberus.ims.beans.ClientType;
import cerberus.ims.beans.Product;
import cerberus.ims.beans.PurchaseOrder;
import cerberus.ims.beans.StateAbbrv;

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
	@SuppressWarnings("unchecked")
	public List<Product> getProducts(){
	
		Criteria criteria = session.createCriteria(Product.class);
	
		return (List<Product>)criteria.list();
	}
	@SuppressWarnings("unchecked")
	public List<StateAbbrv> getStates(){
	
		Criteria criteria = session.createCriteria(StateAbbrv.class);
	
		return (List<StateAbbrv>)criteria.list();
	}
	@SuppressWarnings("unchecked")
	public List<ClientType> getTypes(){
	
		Criteria criteria = session.createCriteria(ClientType.class);
	
		return (List<ClientType>)criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<PurchaseOrder> getOrders() {
		// TODO Auto-generated method stub
		Criteria criteria = session.createCriteria(PurchaseOrder.class);
		return (List<PurchaseOrder>)criteria.list();
	}
	
}
