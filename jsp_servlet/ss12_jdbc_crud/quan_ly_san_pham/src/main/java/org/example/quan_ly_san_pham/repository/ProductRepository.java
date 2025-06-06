package org.example.quan_ly_san_pham.repository;

import org.example.quan_ly_san_pham.dto.ProductDTO;
import org.example.quan_ly_san_pham.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository{
    private final String SELECT_ALL = "select * from san_pham;\n";
    private final String SELECT_ALL_JOIN = "select sp.ma_san_pham, sp.ten_san_pham, sp.gia_san_pham , lsp.ten_loai\n" +
            "from san_pham sp join loai_san_pham lsp on lsp.id_loai_san_pham = sp.id_loai_san_pham;\n";
    private final String INSERT_INTO = "insert into san_pham values (?,?,?,?,?,?);";
    private final String DELETE_BY_ID = "delete from san_pham where ma_san_pham = ?;\n";
    private final String UPDATE_BY_ID = "update san_pham\n" +
            "set ten_san_pham = ?,\n" +
            "\tgia_san_pham = ?,\n" +
            "    mo_ta_san_pham = ?,\n" +
            "    nha_san_xuat = ?,\n" +
            "    id_loai_san_pham = ?\n" +
            "where ma_san_pham = ?;";
    private final String FIND_BY_ID = "select * from san_pham where ma_san_pham = ?;\n";
    private final String FIND_BY_NAME = "select * from san_pham where ten_san_pham like ?;\n";
    private final String FIND_BY_NAME_AND_CATEGORY = "SELECT sp.ma_san_pham,sp.ten_san_pham,sp.gia_san_pham,lsp.ten_loai\n" +
            "FROM san_pham sp\n" +
            "JOIN loai_san_pham lsp ON sp.id_loai_san_pham = lsp.id_loai_san_pham\n" +
            "WHERE sp.ten_san_pham LIKE ? AND lsp.ten_loai LIKE ?;";

    @Override
    public List<ProductDTO> findAll() {
        List<ProductDTO> productDTOList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_JOIN);) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String productID = resultSet.getString("ma_san_pham");
                String productName = resultSet.getString("ten_san_pham");
                double productPrice = Double.parseDouble(resultSet.getString("gia_san_pham"));
                String categoryName = resultSet.getString("ten_loai");
                ProductDTO productDTO = new ProductDTO(productID,productName,productPrice,categoryName);
                productDTOList.add(productDTO);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productDTOList;
    }

    @Override
    public void add(Product product) {
        try (Connection connection = BaseRepository.getConnectDB();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);){
            preparedStatement.setString(1,product.getProductID());
            preparedStatement.setString(2,product.getProductName());
            preparedStatement.setDouble(3,product.getProductPrice());
            preparedStatement.setString(4,product.getProductDescription());
            preparedStatement.setString(5,product.getManufacture());
            preparedStatement.setInt(6,product.getTypeProductID());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Product findById(String id) {
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);) {
            preparedStatement.setString(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String productID = resultSet.getString("ma_san_pham");
                String productName = resultSet.getString("ten_san_pham");
                double productPrice = Double.parseDouble(resultSet.getString("gia_san_pham"));
                String productDescription = resultSet.getString("mo_ta_san_pham");
                String manufacture = resultSet.getString("nha_san_xuat");
                int typeProductID = Integer.parseInt(resultSet.getString("id_loai_san_pham"));
                Product product = new Product(productID,productName,productPrice,productDescription,manufacture,typeProductID);
                return product;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public void update(String id, Product product) {
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BY_ID);) {
            preparedStatement.setString(1,product.getProductName());
            preparedStatement.setDouble(2,product.getProductPrice());
            preparedStatement.setString(3,product.getProductDescription());
            preparedStatement.setString(4,product.getManufacture());
            preparedStatement.setInt(5,product.getTypeProductID());
            preparedStatement.setString(6,id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(String id) {
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID);) {
            preparedStatement.setString(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<ProductDTO> searchByName(String productName) {
        List<ProductDTO> productDTOList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_NAME);) {
            preparedStatement.setString(1,"%" + productName + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("ma_san_pham");
                String name = resultSet.getString("ten_san_pham");
                double price = Double.parseDouble(resultSet.getString("gia_san_pham"));
                String category = resultSet.getString("ten_loai");
                ProductDTO productDTO = new ProductDTO(id,name,price,category);
                productDTOList.add(productDTO);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productDTOList;
    }

    @Override
    public List<ProductDTO> searchByNameAndCategory(String productName, String categoryName) {
        List<ProductDTO> productDTOList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_NAME_AND_CATEGORY);) {
            preparedStatement.setString(1,"%" + productName + "%");
            preparedStatement.setString(2,"%" + categoryName + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("ma_san_pham");
                String name = resultSet.getString("ten_san_pham");
                double price = Double.parseDouble(resultSet.getString("gia_san_pham"));
                String category = resultSet.getString("ten_loai");
                ProductDTO productDTO = new ProductDTO(id,name,price,category);
                productDTOList.add(productDTO);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productDTOList;

    }
}
