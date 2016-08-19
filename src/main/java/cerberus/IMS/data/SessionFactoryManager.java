package cerberus.ims.data;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class SessionFactoryManager {
	
	private static SessionFactory sf = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
	
	private SessionFactoryManager(){}
	
	public static SessionFactory getInstance(){
		
		return sf;
	}
}
