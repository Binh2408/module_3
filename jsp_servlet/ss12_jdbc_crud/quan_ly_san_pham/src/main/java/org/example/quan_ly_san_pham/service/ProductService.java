package org.example.quan_ly_san_pham.service;

import org.example.quan_ly_san_pham.dto.ProductDTO;
import org.example.quan_ly_san_pham.model.Product;
import org.example.quan_ly_san_pham.repository.IProductRepository;
import org.example.quan_ly_san_pham.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService{
    private final IProductRepository productRepository = new ProductRepository();
    @Override
    public List<ProductDTO> findAll() {
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
    public void delete(String id) {
        productRepository.delete(id);
    }

    @Override
    public List<ProductDTO> searchByName(String productName) {
        return productRepository.searchByName(productName);
    }

    @Override
    public List<ProductDTO> searchByNameAndCategory(String productName, String categoryName) {
        return productRepository.searchByNameAndCategory(productName,categoryName);
    }


}
