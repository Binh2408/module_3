package org.example.quan_ly_san_pham.service;

import org.example.quan_ly_san_pham.model.Category;
import org.example.quan_ly_san_pham.repository.CategoryRepository;
import org.example.quan_ly_san_pham.repository.ICategoryRepository;

import java.util.List;

public class CategoryService implements ICategoryService{
    private final ICategoryRepository categoryRepository = new CategoryRepository();
    @Override
    public List<Category> findAll() {
        return categoryRepository.findAll();
    }
}
