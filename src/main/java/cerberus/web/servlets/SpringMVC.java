package cerberus.web.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cerberus.ims.beans.Client;
import cerberus.ims.data.DataLayer;

@Controller
public class SpringMVC {

	@RequestMapping(value="pullData.do", method=RequestMethod.GET)
	public void getData(HttpServletRequest req, HttpServletResponse resp){
			
		DataLayer layer = new DataLayer();
		
		// Grab Clients
		List<Client> clients = layer.grabClients();
		req.getSession().setAttribute("clients", clients);
		
		// Lock Data
		req.getSession().setAttribute("gotData", true);
		
		try {resp.sendRedirect("index.jsp");} catch (IOException e) {e.printStackTrace();}
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
