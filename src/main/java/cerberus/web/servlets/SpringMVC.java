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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cerberus.ims.beans.Address;
import cerberus.ims.beans.Client;
import cerberus.ims.beans.ClientType;
import cerberus.ims.beans.PoLine;
import cerberus.ims.beans.Product;
import cerberus.ims.beans.ProductCategory;
import cerberus.ims.beans.PurchaseOrder;
import cerberus.ims.beans.StateAbbrv;
import cerberus.ims.data.DataLayer;

@Controller
public class SpringMVC {

	//----------------------------------
	// Background Processes (No Redirection)
	@RequestMapping(value="pullData.do", method=RequestMethod.GET)
	public ModelAndView getData(HttpServletRequest req, HttpServletResponse resp){
		System.out.println("LOADING DATA");
		DataLayer layer = new DataLayer();
		
		// Set Current Path
		req.getSession().setAttribute("path", "index.jsp");
		
		// Grab Po Lines
		List<PoLine> lines = layer.grabLines();
		req.getSession().setAttribute("lines", lines);
		
		// Grab Purchase Orders
		List<PurchaseOrder> orders = layer.grabOrders();
		req.getSession().setAttribute("orders", orders);
		
		// Grab Clients
		List<Client> clients = layer.grabClients();
		req.getSession().setAttribute("clients", clients);
		
		// Grab Client Types
		List<ClientType> types = layer.grabTypes();
		req.getSession().setAttribute("types", types);
		
		// Grab Addresses
		List<Address> addresses = layer.grabAddresses();
		req.getSession().setAttribute("addresses", addresses);
		
		// Grab States
		List<StateAbbrv> states = layer.grabStates();
		req.getSession().setAttribute("states", states);
		
		// Grab Products
		List<Product> products = layer.grabProducts();
		req.getSession().setAttribute("products", products);
		
		// Grab Categories
		List<ProductCategory> categories = layer.grabCategories();
		req.getSession().setAttribute("categories", categories);
		
		// Lock Data
		req.getSession().setAttribute("gotData", true);
		
		ModelAndView mv = new ModelAndView("viewProducts");
		req.getSession().setAttribute("path", "/JSP/viewProducts.jsp");
		return mv;
		/*try {
				
			resp.sendRedirect((String)(req.getSession().getAttribute("path")));
		} catch (IOException e) {e.printStackTrace();}*/
	}
	
	@RequestMapping(value="grabType.do", method=RequestMethod.GET)
	@ResponseBody
	public String sendClientType(HttpServletRequest req, HttpServletResponse resp, @RequestParam("clientName") String clientName){
		
		@SuppressWarnings("unchecked")
		List<Client> myClients = (List<Client>) req.getSession().getAttribute("clients");
		
		for(Client c : myClients){
			if(c.getClientName().equals(clientName)){
				return c.getClientType().getClientType();
			}
		}
		
		return null;
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
		
		// Add Data to Altered Lists
		@SuppressWarnings("unchecked")
		List<Client> newClients = (List<Client>)req.getSession().getAttribute("clients");
		newClients.add(myClient);
		
		req.getSession().setAttribute("clients", newClients);
	}
	@RequestMapping(value="updateClient.do", method=RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public void updateClient(HttpServletRequest req, HttpServletResponse resp, @RequestBody Client client){
		
		DataLayer layer = new DataLayer();
		Session session = (Session)layer.getSession();
		
		// Pull Client
		Criteria critera = session.createCriteria(Client.class).add(Restrictions.eq("imsClientId", client.getImsClientId()));
		Client clientToChange = (Client)critera.uniqueResult();
		
		StateAbbrv newState = null;
		
		// if the client state does not match the one they passed, find it.
		if(!(clientToChange.getClientAddress().getState().getStateName().equals(client.getPassedStateName()))){
			
			@SuppressWarnings("unchecked")
			List<StateAbbrv> states = (List<StateAbbrv>)req.getSession().getAttribute("states");
			
			for(StateAbbrv s : states){
				
				if(s.getStateName().equals(client.getPassedStateName())){
					
					newState = s;
				}
			}
		} else {
			
			newState = clientToChange.getClientAddress().getState();
		}
		
		ClientType newType = null;
		
		// if the client type does not match the one they passed, find it.
		if(!(clientToChange.getClientType().getClientType().equals(client.getPassedClientType()))){
			
			@SuppressWarnings("unchecked")
			List<ClientType> types = (List<ClientType>)req.getSession().getAttribute("types");
			
			for(ClientType t : types){
				
				if(t.getClientType().equals(client.getPassedClientType())){
					
					newType = t;
				}
			}
		} else {
			
			newType = clientToChange.getClientType();
		}
		
		Address clientsAddress = clientToChange.getClientAddress();
		
		clientsAddress.setStreetAddress1(client.getPassedAddressStreet1());
		clientsAddress.setStreetAddress2(client.getPassedAddressStreet2());
		clientsAddress.setAddressCity(client.getPassedAddressCity());
		clientsAddress.setAddressZip(client.getPassedAddressZip());
		clientsAddress.setState(newState);

		layer.changeRecord(clientsAddress);
		
		clientToChange.setClientName(client.getClientName());
		clientToChange.setClientEmail(client.getClientEmail());
		clientToChange.setPointOfContactName(client.getPointOfContactName());
		clientToChange.setClientPhone(client.getClientPhone());
		clientToChange.setClientFax(client.getClientFax());
		clientToChange.setClientAddress(clientsAddress);
		clientToChange.setClientType(newType);
		
		layer.changeRecord(clientToChange);
		
		// Unlock Data to Update Records 
		req.getSession().setAttribute("gotData", false);
	}
	
	//----------------------------------
	// Redirection Mapping
	@RequestMapping(value="home.do", method=RequestMethod.GET)
	public void goHome(HttpServletRequest req, HttpServletResponse resp) {
		
		req.getSession().setAttribute("path", "index.jsp");
		req.getSession().setAttribute("isReports", false);
		
		try {
			
			resp.sendRedirect("index.jsp");
			
		} catch (IOException e) {e.printStackTrace();}
	}
	
	@RequestMapping(value="viewInvoice.do", method=RequestMethod.GET)
	public ModelAndView getInvoices(HttpServletRequest req) {
		
		ModelAndView mv = new ModelAndView("viewInvoice");
		req.getSession().setAttribute("path", "/JSP/viewInvoice.jsp");
		return mv;
	}
	
	@RequestMapping(value="viewClients.do", method=RequestMethod.GET)

	public ModelAndView getClients(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView("viewClients");
		req.getSession().setAttribute("path", "/JSP/viewClients.jsp");
		return mv;
	}
	
	@RequestMapping(value="viewProducts.do", method=RequestMethod.GET)
	public ModelAndView getProducts(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView("viewProducts");
		req.getSession().setAttribute("path", "/JSP/viewProducts.jsp");
		return mv;
	}
	
	@RequestMapping(value="addProducts.do", method=RequestMethod.GET)
	public ModelAndView addProducts(HttpServletRequest req)
	{
		
		ModelAndView mv = new ModelAndView("viewProducts");
		req.getSession().setAttribute("path", "/JSP/viewProducts.jsp");
		return mv;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="addProducts.do", method=RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public List<Product> addProducts(HttpServletRequest req, HttpServletResponse resp, @RequestBody Product product)
	{
		DataLayer layer = new DataLayer();
		layer.makeRecord(product);
		System.out.println("product saved");
		List<Product> products = layer.grabProducts();
		req.getSession().setAttribute("products", products);
		return (List<Product>)req.getSession().getAttribute("products");
	/*	req.getSession().setAttribute("NewProduct", product);
		ModelAndView mv = new ModelAndView("viewProducts");
		req.getSession().setAttribute("path", "/JSP/viewProducts.jsp");
		return mv;*/
	}
	
	@RequestMapping(value="viewReports.do", method=RequestMethod.GET)
	public ModelAndView getReports(HttpServletRequest req) {
		
		ModelAndView mv = new ModelAndView("viewReports");
		req.getSession().setAttribute("path", "/JSP/viewReports.jsp");
		req.getSession().setAttribute("isReports", true);
		return mv;
	}
	
	@RequestMapping(value="historyReport.do", method=RequestMethod.GET)
	public ModelAndView getPastInvoices(HttpServletRequest req) {
		
		ModelAndView mv = new ModelAndView("historyReport");
		req.getSession().setAttribute("path", "/JSP/historyReport.jsp");
		req.getSession().setAttribute("isReports", true);
		return mv;
	}
	
	@RequestMapping(value="profitReport.do", method=RequestMethod.GET)
	public ModelAndView getProfitReport(HttpServletRequest req) {
		
		ModelAndView mv = new ModelAndView("profitReport");
		req.getSession().setAttribute("path", "/JSP/profitReport.jsp");
		req.getSession().setAttribute("isReports", true);
		return mv;
	}
	
	@RequestMapping(value="stockReport.do", method=RequestMethod.GET)
	public ModelAndView getStockReport(HttpServletRequest req) {
		
		ModelAndView mv = new ModelAndView("stockReport");
		req.getSession().setAttribute("path", "/JSP/stockReport.jsp");
		req.getSession().setAttribute("isReports", true);
		return mv;
	}
}
