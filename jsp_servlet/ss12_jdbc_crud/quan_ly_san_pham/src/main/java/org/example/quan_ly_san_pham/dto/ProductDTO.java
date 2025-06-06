package org.example.quan_ly_san_pham.dto;

public class ProductDTO {
    private String productID;
    private String productName;
    private double productPrice;
    private String categoryName;

    public ProductDTO() {
    }

    public ProductDTO(String productID, String productName, double productPrice, String categoryName) {
        this.productID = productID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.categoryName = categoryName;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
