package org.example.quan_ly_san_pham.repository;

import org.example.quan_ly_san_pham.dto.ProductDTO;
import org.example.quan_ly_san_pham.model.Product;

import java.util.List;

public interface IProductRepository {
    List<ProductDTO> findAll();
    void add(Product product);
    Product findById(String id);
    void update(String id, Product product);
    void delete(String id);
    List<ProductDTO> searchByName(String productName);
    List<ProductDTO> searchByNameAndCategory(String productName, String categoryName);
}
