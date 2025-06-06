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
import java.util.List;

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

            default:
                List<ProductDTO> productDTOList = productService.findAll();
                req.setAttribute("productDTOList", productDTOList);
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
                double productPrice = Double.parseDouble(req.getParameter("productPrice"));
                String productDescription = req.getParameter("productDescription");
                String manufacture = req.getParameter("manufacture");
                int typeProductID = Integer.parseInt(req.getParameter("typeProductID"));
                Product product = new Product(productID, productName, productPrice, productDescription, manufacture, typeProductID);
                productService.add(product);
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
                double updatePrice = Double.parseDouble(req.getParameter("updatePrice"));
                String updateDescription = req.getParameter("updateDescription");
                String updateManufacture = req.getParameter("updateManufacture");
                int updateTypeProductID = Integer.parseInt(req.getParameter("updateTypeProductID"));
                Product updateProduct = new Product(updateID, updateName, updatePrice, updateDescription, updateManufacture, updateTypeProductID);
                productService.update(updateID, updateProduct);
                resp.sendRedirect("/products");
                break;
        }
    }
}
