package cerberus.IMS;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cerberus.IMS.beans.*;

public class App 
{
    public static void main( String[] args )
    {
    	// TODO Auto-generated method stub
		AbstractApplicationContext context=new ClassPathXmlApplicationContext("IMS.xml");
		System.out.println("IoC Container started up!!");
		Address address=(Address)context.getBean("Address");
		System.out.println("State abbrreviation for "+address.getState().getStateName()+" is "+address.getState().getStateAbbrv());
    	
    }
}
