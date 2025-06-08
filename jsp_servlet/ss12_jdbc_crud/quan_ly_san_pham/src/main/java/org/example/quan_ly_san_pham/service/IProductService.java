package org.example.quan_ly_san_pham.service;

import org.example.quan_ly_san_pham.dto.ProductDTO;
import org.example.quan_ly_san_pham.model.Product;

import java.util.List;

public interface IProductService {
    List<ProductDTO> findAll();
    void add(Product product);
    Product findById(String id);
    boolean existsById(String productID);
    void update(String id, Product product);
    void delete(String id);
    List<ProductDTO> searchByName(String productName);
    List<ProductDTO> searchByNameAndCategory(String productName, String categoryName);
    List<ProductDTO> searchByCategory(String categoryName);
}
