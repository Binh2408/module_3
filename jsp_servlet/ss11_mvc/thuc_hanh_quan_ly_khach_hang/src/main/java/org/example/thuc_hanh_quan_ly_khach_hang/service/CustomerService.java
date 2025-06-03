package org.example.thuc_hanh_quan_ly_khach_hang.service;

import org.example.thuc_hanh_quan_ly_khach_hang.model.Customer;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface CustomerService {
    List<Customer> findAll();

    void save(Customer customer);

    Customer findById(int id);

    void update(int id, Customer customer);

    void remove(int id);
}
