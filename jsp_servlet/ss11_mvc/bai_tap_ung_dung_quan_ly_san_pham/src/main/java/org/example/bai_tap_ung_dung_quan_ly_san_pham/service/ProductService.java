package org.example.bai_tap_ung_dung_quan_ly_san_pham.service;

import org.example.bai_tap_ung_dung_quan_ly_san_pham.model.Product;
import org.example.bai_tap_ung_dung_quan_ly_san_pham.repository.IProductRepository;
import org.example.bai_tap_ung_dung_quan_ly_san_pham.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService{
    private final IProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void add(Product product) {
        productRepository.add(product);
    }

    @Override
    public Product findById(String id) {
        return productRepository.findById(id);
    }

    @Override
    public void update(String id, Product product) {
        productRepository.update(id,product);
    }
    @Override
    public List<Product> searchByName(String name) {
        return productRepository.searchByName(name);
    }

    @Override
    public void delete(String id) {
        productRepository.delete(id);
    }
}
