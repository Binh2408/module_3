package org.example.quan_ly_san_pham.repository;

import org.example.quan_ly_san_pham.model.Category;

import java.util.List;

public interface ICategoryRepository {
    List<Category> findAll();
}
