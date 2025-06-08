package org.example.quan_ly_san_pham.controller;

import org.example.quan_ly_san_pham.dto.ProductDTO;
import org.example.quan_ly_san_pham.model.Product;
import org.example.quan_ly_san_pham.service.CategoryService;
import org.example.quan_ly_san_pham.service.ICategoryService;
import org.example.quan_ly_san_pham.service.IProductService;
import org.example.quan_ly_san_pham.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/products")
public class ProductController extends HttpServlet {
    private IProductService productService = new ProductService();
    private ICategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "add":
                req.setAttribute("typeProductID", categoryService.findAll());
                req.getRequestDispatcher("/WEB-INF/product/create.jsp").forward(req, resp);
                break;

            case "update":
                String updateId = req.getParameter("productID");
                Product product = productService.findById(updateId);
                req.setAttribute("product", product);
                req.setAttribute("typeProductID", categoryService.findAll());
                req.getRequestDispatcher("/WEB-INF/product/edit.jsp").forward(req, resp);
                break;

            case "detail":
                String detailId = req.getParameter("productID");
                Product detailProduct = productService.findById(detailId);
                req.setAttribute("detailProduct", detailProduct);
                req.setAttribute("typeProductID", categoryService.findAll());
                req.getRequestDispatcher("/WEB-INF/product/detail.jsp").forward(req, resp);
                break;

            case "search":
                String searchName = req.getParameter("searchName");
                String searchCategory = req.getParameter("searchCategory");

                List<ProductDTO> searchResults;

                if ((searchName == null || searchName.isEmpty()) &&
                        (searchCategory == null || searchCategory.isEmpty())) {
                    // Nếu không có gì search -> lấy tất cả
                    searchResults = productService.findAll();
                } else if (searchName != null && !searchName.isEmpty() &&
                        (searchCategory == null || searchCategory.isEmpty())) {
                    // Chỉ tìm theo tên
                    searchResults = productService.searchByName(searchName);
                } else if ((searchName == null || searchName.isEmpty()) &&
                        searchCategory != null && !searchCategory.isEmpty()) {
                    // Chỉ tìm theo loại
                    searchResults = productService.searchByCategory(searchCategory);
                } else {
                    // Tìm theo cả tên và loại
                    searchResults = productService.searchByNameAndCategory(searchName, searchCategory);
                }

                req.setAttribute("productDTOList", searchResults);
                req.setAttribute("typeProductList", categoryService.findAll());
                req.getRequestDispatcher("/WEB-INF/product/list.jsp").forward(req, resp);
                break;

            default:
                List<ProductDTO> productDTOList = productService.findAll();
                req.setAttribute("productDTOList", productDTOList);
                req.setAttribute("typeProductList", categoryService.findAll());
                req.getRequestDispatcher("/WEB-INF/product/list.jsp").forward(req, resp);
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "add":
                String productID = req.getParameter("productID");
                String productName = req.getParameter("productName");
                String priceStr = req.getParameter("productPrice");
                String productDescription = req.getParameter("productDescription");
                String manufacture = req.getParameter("manufacture");
                String typeStr = req.getParameter("typeProductID");

                Map<String, String> errors = new HashMap<>();
                double productPrice = 0;
                int typeProductID = 0;

                if (productID == null || productID.trim().isEmpty()) {
                    errors.put("productID", "Mã sản phẩm không được để trống.");
                } else if (productService.existsById(productID)) {
                    errors.put("productID", "Mã sản phẩm đã tồn tại. Vui lòng chọn mã khác.");
                }

                if (productName == null || productName.trim().isEmpty()) {
                    errors.put("productName", "Tên sản phẩm không được để trống.");
                }

                try {
                    productPrice = Double.parseDouble(priceStr);
                    if (productPrice <= 0) {
                        errors.put("productPrice", "Giá sản phẩm phải lớn hơn 0.");
                    }
                } catch (NumberFormatException e) {
                    errors.put("productPrice", "Giá sản phẩm không hợp lệ.");
                }

                if (productDescription == null || productDescription.trim().isEmpty()) {
                    errors.put("productDescription", "Mô tả không được để trống.");
                }

                if (manufacture == null || manufacture.trim().isEmpty()) {
                    errors.put("manufacture", "Nhà sản xuất không được để trống.");
                }

                try {
                    typeProductID = Integer.parseInt(typeStr);
                    if (typeProductID <= 0) {
                        errors.put("typeProductID", "Loại sản phẩm chưa được chọn.");
                    }
                } catch (NumberFormatException e) {
                    errors.put("typeProductID", "Loại sản phẩm chưa được chọn.");
                }

                if (!errors.isEmpty()) {
                    req.setAttribute("errors", errors);

                    // Gửi lại dữ liệu người dùng nhập
                    Product invalidProduct = new Product(productID, productName, productPrice, productDescription, manufacture, typeProductID);
                    req.setAttribute("product", invalidProduct);
                    req.setAttribute("typeProductID", categoryService.findAll());

                    req.getRequestDispatcher("/WEB-INF/product/create.jsp").forward(req, resp);
                    return;
                }

                Product newProduct = new Product(productID, productName, productPrice, productDescription, manufacture, typeProductID);
                productService.add(newProduct);
                req.getSession().setAttribute("msg", "Thêm sản phẩm thành công!");
                resp.sendRedirect("/products");
                break;



            case "delete":
                String deleteID = req.getParameter("deleteID");
                productService.delete(deleteID);
                resp.sendRedirect("/products");
                break;
            case "update":
                String updateID = req.getParameter("updateID");
                String updateName = req.getParameter("updateName");
                String strUpdatePrice = req.getParameter("updatePrice");
                String updateDescription = req.getParameter("updateDescription");
                String updateManufacture = req.getParameter("updateManufacture");
                String strUpdateTypeProductID = req.getParameter("updateTypeProductID");

                // Chuẩn bị thông báo lỗi
                Map<String, String> errorsUpdate = new HashMap<>();

                // Validate mã sản phẩm (updateID) - có thể bỏ qua nếu không cho sửa mã
                if (updateID == null || updateID.trim().isEmpty()) {
                    errorsUpdate.put("updateID", "Mã sản phẩm không được để trống.");
                }

                // Validate tên sản phẩm
                if (updateName == null || updateName.trim().isEmpty()) {
                    errorsUpdate.put("updateName", "Tên sản phẩm không được để trống.");
                }

                // Validate giá sản phẩm
                double updatePrice = 0;
                try {
                    updatePrice = Double.parseDouble(strUpdatePrice);
                    if (updatePrice <= 0) {
                        errorsUpdate.put("updatePrice", "Giá sản phẩm phải lớn hơn 0.");
                    }
                } catch (NumberFormatException e) {
                    errorsUpdate.put("updatePrice", "Giá sản phẩm phải là số hợp lệ.");
                }

                // Validate loại sản phẩm
                int updateTypeProductID = 0;
                try {
                    updateTypeProductID = Integer.parseInt(strUpdateTypeProductID);
                    if (updateTypeProductID <= 0) {
                        errorsUpdate.put("updateTypeProductID", "Loại sản phẩm chưa được chọn.");
                    }
                } catch (NumberFormatException e) {
                    errorsUpdate.put("updateTypeProductID", "Loại sản phẩm chưa được chọn.");
                }

                if (!errorsUpdate.isEmpty()) {
                    // Nếu có lỗi, trả lại dữ liệu cùng lỗi cho JSP để hiển thị
                    req.setAttribute("errors", errorsUpdate);
                    req.setAttribute("product", new Product(updateID, updateName, updatePrice, updateDescription, updateManufacture, updateTypeProductID));

                    // Load lại danh sách loại sản phẩm nếu cần để dropdown chọn lại
                    req.setAttribute("typeProductID", categoryService.findAll()); // giả sử có method này

                    // Forward về trang update (ví dụ update.jsp)
                    req.getRequestDispatcher("/WEB-INF/product/edit.jsp").forward(req, resp);
                } else {
                    // Không lỗi thì update và redirect
                    Product updateProduct = new Product(updateID, updateName, updatePrice, updateDescription, updateManufacture, updateTypeProductID);
                    productService.update(updateID, updateProduct);
                    resp.sendRedirect("/products");
                }
                break;

        }
    }
}
