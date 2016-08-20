package cerberus.ims.data;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import cerberus.ims.beans.Address;
import cerberus.ims.beans.Client;
import cerberus.ims.beans.ClientType;
import cerberus.ims.beans.CompositeKey;
import cerberus.ims.beans.PoLine;
import cerberus.ims.beans.Product;
import cerberus.ims.beans.ProductCategory;
import cerberus.ims.beans.PurchaseOrder;
import cerberus.ims.beans.StateAbbrv;

public class DAO_Prepopulation {
		
	// Information Source: http://www.microcenter.com/
	
	public void populateDatabase(){
		
		populateStates();
		populateClientTypes();
		populateProducts_AND_ProductCategories();
		populateAddresses();
		populateClients();
		populatePurchaseOrders();
		populatePoLines();
	}
	public void populateStates(){
		
		String[] stateArr = new String[] {"Alabama", "Arkansas", "Arizona", "Alaska", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming" };
		String[] abbreviations = new String[]{"AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND", "OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY"};
		
		DataLayer layer = new DataLayer();
		StateAbbrv state;
		
		for(int i = 0; i < stateArr.length; i++){
			
			state = new StateAbbrv(stateArr[i], abbreviations[i]);
	
			layer.makeRecord(state);
		}
		
		System.out.println("-- Done Populating State Table -- \n");
	}
	public void populateClientTypes(){
		
		String[] types = new String[] {"Supplier", "Retailer"};
		
		DataLayer layer = new DataLayer();
		
		ClientType ctype;
		
		for(int i = 0; i < types.length; i++){
			
			ctype = new ClientType(types[i]);
			
			layer.makeRecord(ctype);
		}
		
		System.out.println("-- Done Populating Client Types Table -- \n");
	}
	public void populateProducts_AND_ProductCategories(){
		
		
		DataLayer layer = new DataLayer();
		List<ProductCategory> productCategories;
		
		productCategories = new ArrayList<ProductCategory>(); // <-- Hold the Product Categories
		
		//---------------------------------
		// Product Category
		String[] types = new String[] {"Refurbished", "Factory New", "Computers", "Computer Parts", "Electronices", "Networking", 
									   "Accessories", "Software", "Gaming", "Service", "Repair" };
		
		ProductCategory productCategory;
		
		for(int i = 0; i < types.length; i++){
			
			productCategory = new ProductCategory(types[i]);
			productCategories.add(productCategory);
			
			layer.makeRecord(productCategory);
		}
		
		System.out.println("-- Done Populating Product Category Table -- \n");
		
		//---------------------------------
		// Product
		String[] productName = new String[] {
			
			// 1	
			"Dell Latitude E6420 Windows 14\" Laptop Computer Refurbished - Black",
			
			// 2
			"ASUS GeForce GTX 1080 STRIX 8GB GDDR5X PCIe Video Card",
			
			// 3
			"Logitech MK270 Wireless Keyboard and Mouse",
			
			// 4
			"Sony Uncharted 1 and 2 Bundle (PS3)"
				
				
		};
		String[] productDescription = new String[] {
			
			// 1	
			"Intel Core i5-2520M Processor 2.5GHz. Microsoft Windows 7 Professional 64-bit. 4GB RAM. 128GB Solid State Drive.",
			
			// 2
			"NVIDIA’s flagship GeForce GTX 1080 is the most advanced gaming GPU ever created, powered by the new NVIDIA Pascal™ "
		  + "architecture.",
			
		  	// 3
		  	"Logitech Advanced 2.4 GHz wireless gives you a fast, reliable connection up to 10 meters away with virtually no delays "
		  + "or dropouts. Additional ability to take this sleek mouse anywhere you take your computer.",
		  
		  	// 4
		  	"This PS3 game bundle kit includes both Uncharted: Drake's Fotrune, and Uncharted 2: Among Thieves."
		};
		String[] shortName = new String[] {
				
			// 1
			"DlL13",
			
			// 2
			"AsG24",
			
			// 3
			"LoM27",
			
			// 4
			"SoU29"
				
				
		};
		String[] packSize = new String[]{
			
			// 1
			"Box",
			
			// 2
			"Box",
			
			// 3
			"Box",
			
			// 4
			"Box"
				
		};
		
		double[] unitCost = new double[] {
				
			// 1
			249.99,
			
			// 2
			649.99,
			
			// 3
			19.99,
			
			// 4
			14.995
				
		};
		double[] retailPrice = new double[]{
			
			// 1
			249.99,
			
			// 2
			649.99,
			
			// 3
			19.99,
			
			// 4
			29.99
				
		};
		
		int[] reorderQuantity = new int[]{
				
			// 1
			2,
			
			// 2
			1,
			
			// 3
			10,
			
			// 4
			3
		};
		
		int[] currentStock = new int[]{
				
			// 1
			5,
			
			// 2
			2,
			
			// 3
			16,
			
			// 4
			2
		};
		
		// Category Population Nonsense
		int[][] categoryIndexes = new int[][]{
			
			// First  [] = Product #
			// Second [] = Categories of that Product
			
			/*
			 * Categories: 
			 * 	 Refurbished    (1)
			 *   Factory New    (2)
			 *   Computers      (3)
			 *   Computer Parts (4)
			 *   Electronics    (5)
			 *   Networking     (6)
			 *   Accessories    (7)
			 *   Software       (8)
			 *   Gaming         (9)
			 *   Services       (10)
			 *   Repairs        (11)
			 */
	
			// 1
			{1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0},
			
			// 2
			{0, 2, 0, 4, 0, 0, 0, 0, 0, 0, 0},
			
			// 3
			{0, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0},
			
			// 4
			{0, 2, 0, 0, 0, 0, 0, 0, 9, 0, 0}
			
		};
		
		Product product;
		
		for(int j = 0; j < productName.length; j++){
			
			Set<ProductCategory> productCategoriesSet = new HashSet<ProductCategory>();
			
			// Attach the set of Product Categories that correspond to THIS particular product.
			for(int k = 0; k < 11; k++){
				
				if(categoryIndexes[j][k] != 0){
					
					productCategoriesSet.add(productCategories.get(categoryIndexes[j][k] - 1));
				}
			}
			
			product = new Product(productName[j], 
								  productDescription[j], 
								  shortName[j], 
								  unitCost[j], 
								  packSize[j], 
								  reorderQuantity[j],
								  currentStock[j],
								  retailPrice[j], 
								  productCategoriesSet);
			
			
			layer.makeRecord(product);
		}
		
		System.out.println("-- Done Populating Product Table -- \n");
	}
	public void populateAddresses(){
		
		String[] streetAddress1 = new String[]{
				
				"12345 Fake Street",
				"7411 Polka Dots Lane",
				"321 Elm Street",
				"777 Lucky Sevens Avenue",
				"14791 Rocky Mountain Road"
		};
		String[] streetAddress2 = new String[]{
				
				"Suite #4",
				"Suite #111",
				"Suite #207",
				"Building #2",
				"Suite #3172"
		};
		String[] addressCity = new String[]{
				
				"Reston",
				"Reston",
				"Victorville",
				"Las Vegas",
				"Denver"
		};
		String[] addressZip = new String[]{
				
				"20190",
				"20190",
				"92392",
				"89101",
				"80123"
		};
		String[] stateName = new String[]{
				
				"Virginia",
				"Virginia",
				"California",
				"Nevada",
				"Colorado"
		};
	
		DataLayer layer = new DataLayer();
		Session session = layer.getSession();
		
		Address address;
		
		for(int i = 0; i < stateName.length; i++){
			
			Criteria criteria = session.createCriteria(StateAbbrv.class).add(Restrictions.eq("stateName", stateName[i]));
			StateAbbrv state = (StateAbbrv)(criteria.uniqueResult());
			
			address = new Address(streetAddress1[i], streetAddress2[i], addressCity[i], addressZip[i], state);
		
			layer.makeRecord(address);
		}
		
		System.out.println("-- Done Populating Address Table -- \n");
	}
	public void populateClients(){
		
		String[] clientName = new String[]{
				
				// Suppliers
				"CTRL+SPACE", 
				"1-800-Get-A-Geek", 
				"FastFixz",
				
				// Retailers
				"Best Buy",
				"Walmart"
		};
		String[] clientEmail = new String[]{
				
				// Suppliers
				"support@ctrlspace.org",
				"support@getageek.com",
				"support@fastfixz.com",
				
				// Retailers
				"support@bestbuy.com",
				"support@walmart-billing.com"
		};
		String[] pointOfContactName = new String[]{
				
				// Suppliers
				"Mike Bradbury",
				"Elizabeth Connor",
				"Hulk Hogan",
				
				// Retailers
				"William Turner",
				"Captain Jack Sparrow"
		};
		String[] clientPhone = new String[]{
				
				// Suppliers
				"202-555-0113",
				"841-587-1247",
				"909-424-0147",
				
				// Retailers
				"704-471-1212",
				"313-147-9524"
		};
		String[] clientFax = new String[]{
				
				// Suppliers
				"1-800-175-7218",
				"1-888-487-0668",
				"1-800-751-7001",
				
				// Retailers
				"1-800-852-4420",
				"1-888-313-1176"
		};
		
		int[] addressId = new int[]{2, 3, 4, 5, 6};    // Generated Sequence Skipped 1! 
		int[] clientTypeId = new int[]{1, 1, 1, 2, 2}; // 1 = Supplier && 2 = Retailer
	
		DataLayer layer = new DataLayer();
		Session session = layer.getSession();
		
		Client client;
		ClientType clientType = null;
		Address clientAddress = null;
		
		for(int i = 0; i < clientName.length; i++){
			
			// Grab Address from Database
			Criteria criteria1 = session.createCriteria(Address.class).add(Restrictions.eq("imsAddressId", addressId[i]));
			clientAddress = (Address)(criteria1.uniqueResult());
	
			// Grab ClientType from Database
			Criteria criteria2 = session.createCriteria(ClientType.class).add(Restrictions.eq("clientTypeId", clientTypeId[i]));
			
			@SuppressWarnings("unchecked")
			List<ClientType> ctypeList = (List<ClientType>)(criteria2.list());
			clientType = ctypeList.get(0);
			
			// Build Client
			client = new Client(clientName[i], clientEmail[i], pointOfContactName[i], clientPhone[i], clientFax[i], 
							    clientAddress, clientType);
			
			// Persist Client
			layer.makeRecord(client);
		}
		
		System.out.println("-- Done Populating Client Table -- \n");
	}
	public void populatePurchaseOrders(){
		
		double[] subtotal = new double[]{
			
			249.99,
			749.97,
			1299.98,
			139.93,
			29.99
		};
		double[] taxAmount = new double[]{
				
			(subtotal[0] * 0.0825),
			(subtotal[1] * 0.0825),
			(subtotal[2] * 0.0825),
			(subtotal[3] * 0.0825),
			(subtotal[4] * 0.0825)
		};
		double[] poTotal = new double[]{
			
			(subtotal[0] + taxAmount[0]),
			(subtotal[1] + taxAmount[1]),
			(subtotal[2] + taxAmount[2]),
			(subtotal[3] + taxAmount[3]),
			(subtotal[4] + taxAmount[4])	
		};
		
		@SuppressWarnings("serial")
		Date purchaseDate = new Date(){};
		
		int[] clientId = new int[]{5,6,7,8,9}; // Generated Sequence Skipped 1-4! 
		
		DataLayer layer = new DataLayer();
		Session session = layer.getSession();
		
		PurchaseOrder purchaseOrder;
		Client client = null;
		
		for(int i = 0; i < subtotal.length; i++){
			
			// Grab Client from Database
			Criteria criteria = session.createCriteria(Client.class).add(Restrictions.eq("imsClientId", clientId[i]));
			client = (Client)(criteria.uniqueResult());
			
			purchaseOrder = new PurchaseOrder(subtotal[i], purchaseDate, taxAmount[i], poTotal[i], client);
			layer.makeRecord(purchaseOrder);
		}
		
		System.out.println("-- Done Populating Purchase Order Table -- \n");
	}
	public void populatePoLines(){
		
		DataLayer layer = new DataLayer();
		Session session = layer.getSession();
		Criteria criteria;
		
		List<CompositeKey> compKeys = new ArrayList<CompositeKey>();
		
		//---------------------------------
		// PoLine -> Composite Key
		int[] line_AND_orderNumbers = new int[]{1, 2, 3, 4, 5};
		
		PurchaseOrder purchaseOrder = null;
		
		for(int i = 0; i < line_AND_orderNumbers.length; i++) {
		
			criteria = session.createCriteria(PurchaseOrder.class).add(Restrictions.eq("orderNumber", line_AND_orderNumbers[i]));
			purchaseOrder = (PurchaseOrder)(criteria.uniqueResult());
			
			CompositeKey compKey = new CompositeKey(line_AND_orderNumbers[i], purchaseOrder);
			compKeys.add(compKey);
		}
		
		System.out.println("-- Done Populating Composite Keys -- \n");
		
		//---------------------------------
		// PoLine
		double[] unitPrice = new double[]{
			
			249.99,
			249.99,
			649.99,
			19.99,
			29.99
		};
		int[] quantityOrdered = new int[]{1, 3, 2, 7, 1};
		int[] productUPC = new int[]{1, 1, 2, 3, 4};
		
		PoLine poline;
		Product product = null;
		
		for(int j = 0; j < productUPC.length; j++){
			
			// Grab Product
			criteria = session.createCriteria(Product.class).add(Restrictions.eq("productUPC", productUPC[j]));
			product = (Product)(criteria.uniqueResult());
			
			// Make PoLine
			poline = new PoLine(compKeys.get(j), unitPrice[j], quantityOrdered[j], product);
			layer.makeRecord(poline);
		}
		
		System.out.println("-- Done Populating Po Line Table -- \n");
	}
}
