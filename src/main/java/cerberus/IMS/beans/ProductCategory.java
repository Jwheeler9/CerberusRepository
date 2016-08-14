package cerberus.IMS.beans;

public class ProductCategory {
	
	private int categoryId;
	private String categoryDescription;
	
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryDescription() {
		return categoryDescription;
	}
	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}
	
	public ProductCategory(){
		super();
	}
	public ProductCategory(int categoryId, String categoryDescription) {
		this();
		this.categoryId = categoryId;
		this.categoryDescription = categoryDescription;
	}	
}
