package cerberus.web.servlets;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cerberus.ims.beans.Client;
import cerberus.ims.data.DataLayer;

public class SpringMVC {

	DataLayer layer;

	public void setLayer(DataLayer layer) {
		this.layer = layer;
	}
	
	@RequestMapping(value="viewInvoice.do", method=RequestMethod.GET)
	public ModelAndView getInvoices(){
		
		/*
		 *  Get Invoices (Product Orders) from Database
		 */
		
		
		ModelAndView mv = new ModelAndView("viewInvoice");
		
		return mv;
	}
	
	@RequestMapping(value="viewClients.do", method=RequestMethod.GET)
	public ModelAndView getClients(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView("viewClients"); // --> /JSP/viewClients.jsp
	
		layer = new DataLayer();
		
		List<Client> clients = layer.grabClients();
		
		for(Client c : clients){
    		System.out.println(c.getClientName());
    	}
		
		//req.getSession().setAttribute("clients", clients);
		
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
