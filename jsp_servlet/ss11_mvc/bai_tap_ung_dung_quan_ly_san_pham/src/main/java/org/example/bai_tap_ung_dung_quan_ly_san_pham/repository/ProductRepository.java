package org.example.bai_tap_ung_dung_quan_ly_san_pham.repository;

import org.example.bai_tap_ung_dung_quan_ly_san_pham.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository{
    private static List<Product> products = new ArrayList<>();
    static {
        products.add(new Product("1", "Máy tính xách tay Dell XPS 13", 29999000, "Laptop cao cấp, màn hình 13.3 inch", "Dell"));
        products.add(new Product("2", "Điện thoại iPhone 14 Pro", 27999000, "Màn hình OLED, camera 48MP", "Apple"));
        products.add(new Product("3", "Tivi Samsung 55 inch 4K", 15999000, "Smart Tivi độ phân giải 4K", "Samsung"));
        products.add(new Product("4", "Tai nghe Sony WH-1000XM4", 6490000, "Chống ồn chủ động, pin 30h", "Sony"));
        products.add(new Product("5", "Máy lọc không khí Xiaomi", 3490000, "Lọc bụi mịn PM2.5, điều khiển qua app", "Xiaomi"));
    }

    @Override
    public List<Product> findAll() {
        return products;
    }

    @Override
    public void add(Product product) {
        products.add(product);
    }

    @Override
    public Product findById(String id) {
        for (Product product : products) {
            if (product.getId().equals(id)) {
                return product;
            }
        }
        return null;
    }

    @Override
    public void update(String id, Product updateProduct) {
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getId().equals(id)) {
                products.set(i, updateProduct);
                return;
            }
        }
    }

    @Override
    public void delete(String id) {
        products.removeIf(product -> product.getId().equals(id));
    }

    @Override
    public List<Product> searchByName(String name) {
        List<Product> result = new ArrayList<>();
        for (Product p : products) {
            if (p.getProductName().toLowerCase().contains(name.toLowerCase())) {
                result.add(p);
            }
        }
        return result;
    }
}
