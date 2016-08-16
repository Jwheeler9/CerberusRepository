package cerberus.IMS;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class DataLayer {

	private Session session; // Session-per-request (best practice)
	private DAO dao;
	
	public DataLayer(){
		
		session = SessionFactoryManager.getInstance().openSession();
		dao = new DAO(session);
	}
	
	public void close(){
		if(session != null) session.close();
	}
	
	public void createRecord(Object _obj){
		
		Transaction tx = session.beginTransaction();
		
		dao.insert(_obj);
		
		tx.commit();
	}
}
