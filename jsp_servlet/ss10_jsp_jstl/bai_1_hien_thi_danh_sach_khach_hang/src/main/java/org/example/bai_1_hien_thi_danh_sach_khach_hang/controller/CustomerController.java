package org.example.bai_1_hien_thi_danh_sach_khach_hang.controller;

import org.example.bai_1_hien_thi_danh_sach_khach_hang.model.Customer;
import org.example.bai_1_hien_thi_danh_sach_khach_hang.service.CusService;
import org.example.bai_1_hien_thi_danh_sach_khach_hang.service.ICusService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/customer")
public class CustomerController extends HttpServlet {
    private final ICusService cusService = new CusService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Customer> customers = cusService.findAll();
        req.setAttribute("customers", customers);
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
