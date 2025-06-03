package org.example.bai_1_hien_thi_danh_sach_khach_hang.service;

import org.example.bai_1_hien_thi_danh_sach_khach_hang.model.Customer;
import org.example.bai_1_hien_thi_danh_sach_khach_hang.repository.CusRepository;
import org.example.bai_1_hien_thi_danh_sach_khach_hang.repository.ICusRepository;

import java.util.List;

public class CusService implements ICusService{
    private final ICusRepository cusRepository = new CusRepository();

    @Override
    public List<Customer> findAll() {
        return cusRepository.findAll();
    }
}
