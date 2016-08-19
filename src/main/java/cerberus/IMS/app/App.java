package cerberus.ims.app;

import java.util.List;

import cerberus.ims.beans.Client;
import cerberus.ims.data.DataLayer;

public class App {
	
    public static void main( String[] args ) {
    	
    	DataLayer layer = new DataLayer();
    	
    	List<Client> clients = layer.grabClients();
    	
    	for(Client c : clients){
    		
    		System.out.println(c.getClientName());
    	}
    	
    }
}
