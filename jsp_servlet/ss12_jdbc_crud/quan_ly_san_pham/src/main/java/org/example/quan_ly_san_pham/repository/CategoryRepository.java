package org.example.quan_ly_san_pham.repository;

import org.example.quan_ly_san_pham.model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepository implements ICategoryRepository{
    private final String SELECT_ALL = "select * from loai_san_pham;\n";

    @Override
    public List<Category> findAll() {
        List<Category> categoryList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int categoryID = resultSet.getInt("id_loai_san_pham");
                String categoryName = resultSet.getString("ten_loai");
                categoryList.add(new Category(categoryID,categoryName));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categoryList;
    }
}
