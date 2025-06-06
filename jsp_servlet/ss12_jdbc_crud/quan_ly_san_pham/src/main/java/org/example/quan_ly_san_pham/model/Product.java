package org.example.quan_ly_san_pham.model;

public class Product {
    private String productID;
    private String productName;
    private double productPrice;
    private String productDescription;
    private String manufacture;
    private int TypeProductID;

    public Product() {
    }

    public Product(String productID, String productName, double productPrice, String productDescription, String manufacture, int typeProductID) {
        this.productID = productID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productDescription = productDescription;
        this.manufacture = manufacture;
        this.TypeProductID = typeProductID;
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

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getManufacture() {
        return manufacture;
    }

    public void setManufacture(String manufacture) {
        this.manufacture = manufacture;
    }

    public int getTypeProductID() {
        return TypeProductID;
    }

    public void setTypeProductID(int typeProductID) {
        TypeProductID = typeProductID;
    }
}
