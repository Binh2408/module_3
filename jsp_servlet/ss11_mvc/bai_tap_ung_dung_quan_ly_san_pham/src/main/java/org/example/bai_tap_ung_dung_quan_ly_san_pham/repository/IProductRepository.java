package org.example.bai_tap_ung_dung_quan_ly_san_pham.repository;

import org.example.bai_tap_ung_dung_quan_ly_san_pham.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();
    void add(Product product);
    Product findById(String id);
    void update(String id, Product product);
    void delete(String id);
    List<Product> searchByName(String name);

}
