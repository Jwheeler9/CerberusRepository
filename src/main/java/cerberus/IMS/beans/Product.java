package cerberus.ims.beans;

import java.sql.Blob;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="IMS_PRODUCT")
public class Product 
{
	//----------------------------------
	// Attributes
	@Id
	@Column(name="PRODUCT_UPC")
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="productSequence")
	@SequenceGenerator(name="productSequence",sequenceName="PRODUCT_SEQUENCE",initialValue=1,allocationSize=1)
	private int productUPC;
	
	@Column(name="PRODUCT_NAME", length=150, nullable=false)
	private String productName;
	
	@Column(name="PRODUCT_DESCRIPTION", length=250, nullable=false)
	private String productDescription;
	
	@Column(name="SHORT_NAME", length=5, nullable=false)
	private String shortName;
	
	@Column(name="UNIT_COST", nullable=false)
	private double unitCost;
	
	@Column(name="PACK_SIZE", length=10, nullable=false)
	private String packSize;
	
	@Column(name="REORDER_QUANTITY", nullable=false)
	private int reorderQuantity;
	
	@Column(name="CURRENT_STOCK", nullable=false)
	private int currentStock;
	
	@Column(name="RETAIL_PRICE", nullable=false)
	private double retailPrice;
	
	@Column(name="PRODUCT_WEIGHT")
	private double productWeight;
	
	@Column(name="PRODUCT_IMAGE")
	private Blob productImage;
	
	//----------------------------------
	// Relationship Mapping
	@ManyToMany
	@JoinTable(name="PRODUCT_CATEGORIES", 
		joinColumns=@JoinColumn(name="PRODUCT_UPC", nullable=false), 
		inverseJoinColumns=@JoinColumn(name="CATEGORY_ID", nullable=false))
	private Set<ProductCategory> productCategories;
	
	//----------------------------------
	// Accessors
	public int getProductUPC() {
		return productUPC;
	}
	public void setProductUPC(int productUPC) {
		this.productUPC = productUPC;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public String getShortName() {
		return shortName;
	}
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	public double getUnitCost() {
		return unitCost;
	}
	public void setUnitCost(double unitCost) {
		this.unitCost = unitCost;
	}
	public String getPackSize() {
		return packSize;
	}
	public void setPackSize(String packSize) {
		this.packSize = packSize;
	}
	public int getReorderQuantity() {
		return reorderQuantity;
	}
	public void setReorderQuantity(int reorderQuantity) {
		this.reorderQuantity = reorderQuantity;
	}
	public int getCurrentStock() {
		return currentStock;
	}
	public void setCurrentStock(int currentStock) {
		this.currentStock = currentStock;
	}
	public double getRetailPrice() {
		return retailPrice;
	}
	public void setRetailPrice(double retailPrice) {
		this.retailPrice = retailPrice;
	}
	public double getProductWeight() {
		return productWeight;
	}
	public void setProductWeight(double productWeight) {
		this.productWeight = productWeight;
	}
	public Blob getProductImage() {
		return productImage;
	}
	public void setProductImage(Blob productImage) {
		this.productImage = productImage;
	}

	//----------------------------------
	// Constructors
	public Product() {
		super();
	}
	public Product(String productName, String productDescription, String shortName, double unitCost, String packSize, 
			   	   int reorderQuantity, int currentStock, double retailPrice, Set<ProductCategory> productCategories) {
		this();
		this.productName = productName;
		this.productDescription = productDescription;
		this.shortName = shortName;
		this.unitCost = unitCost;
		this.packSize = packSize;
		this.reorderQuantity = reorderQuantity;
		this.currentStock = currentStock;
		this.retailPrice = retailPrice;
		this.productCategories = productCategories;
	}
	public Product(String productName, String productDescription, String shortName, double unitCost, String packSize, 
				   int reorderQuantity, int currentStock, double retailPrice, double productWeight, Blob productImage, 
				   Set<ProductCategory> productCategories) {
		this();
		this.productName = productName;
		this.productDescription = productDescription;
		this.shortName = shortName;
		this.unitCost = unitCost;
		this.packSize = packSize;
		this.reorderQuantity = reorderQuantity;
		this.currentStock = currentStock;
		this.retailPrice = retailPrice;
		this.productWeight = productWeight;
		this.productImage = productImage;
		this.productCategories = productCategories;
	}
}

