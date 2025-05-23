create database demo;
use demo;

create table products(
	id int primary key auto_increment,
    product_code varchar(45),
    product_name varchar(45),
    product_price double,
    product_amount int,
    product_description varchar(100),
    product_status boolean
);

INSERT INTO products (product_code, product_name, product_price, product_amount, product_description, product_status)
VALUES
('PRD001', 'iPhone 14', 999.99, 30, 'Điện thoại Apple cao cấp', TRUE),
('PRD002', 'Samsung Galaxy S23', 899.99, 25, 'Flagship Android mạnh mẽ', TRUE),
('PRD003', 'MacBook Air M2', 1299.00, 15, 'Laptop Apple mỏng nhẹ, chip M2', TRUE),
('PRD004', 'Chuột Logitech M331', 19.99, 200, 'Chuột không dây yên tĩnh', TRUE),
('PRD005', 'Máy in Canon LBP2900', 150.00, 10, 'Máy in laser đơn sắc phổ biến', FALSE);

select* from products;
-- Bước 3:
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index index_product_code on products(product_code);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create unique index index_product_name_price on products(product_name,product_price);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products;
-- So sánh câu truy vấn trước và sau khi tạo index
explain select * from products where product_code = 'PRD005';
drop index index_product_code on products;
drop index index_product_name_price on products;
explain select * from products where product_code = 'PRD005';

-- Bước 4:
-- Tạo view lấy về các thông tin: productCode, productName, 
-- productPrice, productStatus từ bảng products.
create view view_infor as 
select product_code, product_name, product_price, product_status
from products;
select * from view_infor;
-- Tiến hành sửa đổi view
SET SQL_SAFE_UPDATES = 0;

update view_infor
set product_name = 'iPhoneXS'
where product_code = 'PRD001';
-- Tiến hành xoá view
drop view view_infor;

-- Bước 5:
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm 
-- trong bảng product
DELIMITER //
create procedure pro_infor()
begin
	select * from products;
end//
DELIMITER ;

CALL pro_infor();
-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE add_product(
    IN p_code VARCHAR(45),
    IN p_name VARCHAR(45),
    IN p_price DOUBLE,
    IN p_amount INT,
    IN p_description VARCHAR(100),
    IN p_status BOOLEAN
)
BEGIN
    INSERT INTO products(product_code, product_name, product_price, product_amount, product_description, product_status)
    VALUES (p_code, p_name, p_price, p_amount, p_description, p_status);
END //
DELIMITER ;

CALL add_product('PRD006', 'iPhone 14', 999.99, 30, 'Điện thoại Apple cao cấp', TRUE);

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE PROCEDURE update_product_by_id(
    IN p_id INT,
    IN p_code VARCHAR(45),
    IN p_name VARCHAR(45),
    IN p_price DOUBLE,
    IN p_amount INT,
    IN p_description VARCHAR(100),
    IN p_status BOOLEAN
)
BEGIN
    UPDATE products
    SET
        product_code = p_code,
        product_name = p_name,
        product_price = p_price,
        product_amount = p_amount,
        product_description = p_description,
        product_status = p_status
    WHERE id = p_id;
END //
DELIMITER ;
CALL update_product_by_id(
    1,
    'PRD001',
    'iPhone 15',
    1099.99,
    25,
    'Phiên bản mới nhất của iPhone',
    TRUE
);

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
CREATE PROCEDURE delete_product_by_id(IN p_id INT)
BEGIN
    DELETE FROM products WHERE id = p_id;
END //
DELIMITER ;
CALL delete_product_by_id(1);
