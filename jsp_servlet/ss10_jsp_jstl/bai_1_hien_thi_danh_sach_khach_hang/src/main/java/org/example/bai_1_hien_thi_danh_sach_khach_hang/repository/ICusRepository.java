package org.example.bai_1_hien_thi_danh_sach_khach_hang.repository;

import org.example.bai_1_hien_thi_danh_sach_khach_hang.model.Customer;

import java.util.List;

public interface ICusRepository {
    List<Customer> findAll();
}
