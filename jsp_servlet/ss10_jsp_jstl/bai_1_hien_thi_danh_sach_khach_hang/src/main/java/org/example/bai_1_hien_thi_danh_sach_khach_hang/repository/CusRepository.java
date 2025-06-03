package org.example.bai_1_hien_thi_danh_sach_khach_hang.repository;

import org.example.bai_1_hien_thi_danh_sach_khach_hang.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CusRepository implements ICusRepository{
    private static final List<Customer> customers = new ArrayList<>();
    static {
        customers.add(new Customer("Bình","24-08-2002","Đà Nẵng","https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/hinh-dep-10.jpg"));
        customers.add(new Customer("Bình","24-08-2002","Đà Nẵng","https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/hinh-dep-10.jpg"));
        customers.add(new Customer("Bình","24-08-2002","Đà Nẵng","https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/hinh-dep-10.jpg"));
    }
    @Override
    public List<Customer> findAll() {
        return customers;
    }
}
