package cerberus.web.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cerberus.ims.beans.Address;
import cerberus.ims.beans.Client;
import cerberus.ims.beans.ClientType;
import cerberus.ims.beans.Product;
import cerberus.ims.beans.StateAbbrv;
import cerberus.ims.data.DataLayer;

@Controller
public class SpringMVC {

	//----------------------------------
	// Background Processes (No Redirection)
	@RequestMapping(value="pullData.do", method=RequestMethod.GET)
	public void getData(HttpServletRequest req, HttpServletResponse resp){
			
		DataLayer layer = new DataLayer();
		
		// Grab Clients
		List<Client> clients = layer.grabClients();
		req.getSession().setAttribute("clients", clients);
		
		// Grab Products
		List<Product> products = layer.grabProducts();
		req.getSession().setAttribute("products", products);
		
		// Grab Products
		List<StateAbbrv> states = layer.grabStates();
		req.getSession().setAttribute("states", states);
		
		// Grab Products
		List<ClientType> types = layer.grabTypes();
		req.getSession().setAttribute("types", types);
		
		// Lock Data
		req.getSession().setAttribute("gotData", true);
		
		try {resp.sendRedirect("index.jsp");} catch (IOException e) {e.printStackTrace();}
	}
	
	@RequestMapping(value="addClient.do", method=RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public void persistClient(HttpServletRequest req, HttpServletResponse resp, @RequestBody Client client){
		
		
		DataLayer layer = new DataLayer();
		Session session = (Session)layer.getSession();
		
		Criteria criteria1 = session.createCriteria(StateAbbrv.class).add(Restrictions.eq("stateName", client.getPassedStateName()));
		StateAbbrv state = (StateAbbrv)criteria1.uniqueResult();
		
		Criteria criteria2 = session.createCriteria(ClientType.class).add(Restrictions.eq("clientType", client.getPassedClientType()));
		ClientType clientType = (ClientType)criteria2.uniqueResult();
		
		Address clientsAddress = new Address(client.getPassedAddressStreet1(), 
											 client.getPassedAddressStreet2(), 
											 client.getPassedAddressCity(), 
											 client.getPassedAddressZip(), 
											 state);

		layer.makeRecord(clientsAddress);
		
		Client myClient = new Client(client.getClientName(), 
								   client.getClientEmail(), 
								   client.getPointOfContactName(), 
								   client.getClientPhone(), 
								   client.getClientFax(), 
								   clientsAddress, 
								   clientType);
		
		layer.makeRecord(myClient);
		
		// Unlock Data (The database was altered)
		req.getSession().setAttribute("gotData", false);
	}
	
	//----------------------------------
	// Redirection Mapping
	@RequestMapping(value="viewInvoice.do", method=RequestMethod.GET)
	public ModelAndView getInvoices(){
		
		/*
		 *  Get Invoices (Product Orders) from Database
		 */
		
		
		ModelAndView mv = new ModelAndView("viewInvoice");
		return mv;
	}
	
	@RequestMapping(value="viewClients.do", method=RequestMethod.GET)
	public ModelAndView getClients(){
		
		ModelAndView mv = new ModelAndView("viewClients"); // --> /JSP/viewClients.jsp
		return mv;
	}
	
	@RequestMapping(value="viewProducts.do", method=RequestMethod.GET)
	public ModelAndView getProducts(){
		
		/*
		 *  Get Products from Database
		 */
		
		
		ModelAndView mv = new ModelAndView("viewProducts");
		return mv;
	}
	
	@RequestMapping(value="viewReports.do", method=RequestMethod.GET)
	public ModelAndView getReports(){
		
		/*
		 *  Get Report Options from Prepopulated List?
		 */
		
		ModelAndView mv = new ModelAndView("viewReports");
		return mv;
	}
}
