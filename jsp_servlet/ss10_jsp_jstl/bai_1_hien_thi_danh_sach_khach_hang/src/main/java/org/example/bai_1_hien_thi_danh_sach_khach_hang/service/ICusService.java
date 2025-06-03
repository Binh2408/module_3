package org.example.bai_1_hien_thi_danh_sach_khach_hang.service;

import org.example.bai_1_hien_thi_danh_sach_khach_hang.model.Customer;

import java.util.List;

public interface ICusService {
    List<Customer> findAll();
}
