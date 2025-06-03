package org.example.bai_tap_ung_dung_quan_ly_san_pham.controller;

import org.example.bai_tap_ung_dung_quan_ly_san_pham.model.Product;
import org.example.bai_tap_ung_dung_quan_ly_san_pham.service.IProductService;
import org.example.bai_tap_ung_dung_quan_ly_san_pham.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/product")
public class ProductController extends HttpServlet {
    private final IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                req.getRequestDispatcher("/WEB-INF/product/create.jsp").forward(req, resp);
                break;
            case "update":
                String idUpdate = req.getParameter("id");
                Product productUpdate = productService.findById(idUpdate);
                req.setAttribute("product", productUpdate);
                req.getRequestDispatcher("/WEB-INF/product/edit.jsp").forward(req, resp);
                break;
            case "delete":
                String idDelete = req.getParameter("id");
                productService.delete(idDelete);
                resp.sendRedirect("/product");
                break;
            case "detail":
                String idDetail = req.getParameter("id");
                Product productDetail = productService.findById(idDetail);
                req.setAttribute("product", productDetail);
                req.getRequestDispatcher("/WEB-INF/product/detail.jsp").forward(req, resp);
                break;
            default:
                String searchName = req.getParameter("search");
                List<Product> products;
                if (searchName != null && !searchName.isEmpty()) {
                    products = productService.searchByName(searchName);
                } else {
                    products = productService.findAll();
                }
                req.setAttribute("products", products);
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
            case "create":
                String id = req.getParameter("id");
                String nameProduct = req.getParameter("productName");
                double priceProduct = Double.parseDouble(req.getParameter("productPrice"));
                String descriptionProduct = req.getParameter("productDescription");
                String manufacture = req.getParameter("manufacture");
                Product product = new Product(id,nameProduct,priceProduct,descriptionProduct,manufacture);
                productService.add(product);
                req.getSession().setAttribute("msg", "Thêm sản phẩm thành công!");
                resp.sendRedirect("/product");
                break;
            case "update":
                String newId = req.getParameter("id");
                String newNameProduct = req.getParameter("productName");
                double newPriceProduct = Double.parseDouble(req.getParameter("productPrice"));
                String newDescriptionProduct = req.getParameter("productDescription");
                String newManufacture = req.getParameter("manufacture");
                Product updatedProduct = new Product(newId, newNameProduct, newPriceProduct, newDescriptionProduct, newManufacture);
                productService.update(newId, updatedProduct);
                resp.sendRedirect("/product");
                break;
        }
    }
}
