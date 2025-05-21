use quan_ly_ban_hang;

INSERT INTO customer (id, name, age) VALUES
('1', 'Minh Quan', 10),
('2', 'Ngoc Oanh', 20),
('3', 'Hong Ha', 50);

INSERT INTO product (id, name, price) VALUES
('1', 'May Giat', 3),
('2', 'Tu Lanh', 5),
('3', 'Dieu Hoa', 7),
('4', 'Quat', 1),
('5', 'Bep Dien', 2);

INSERT INTO `order` (id, date, total_price, customer_id) VALUES
('1', '2006-03-21', NULL, '1'),
('2', '2006-03-23', NULL, '2'),
('3', '2006-03-16', NULL, '1');

INSERT INTO order_detail (order_id, product_id, quantity) VALUES
('1', '1', 3),
('1', '3', 7),
('1', '4', 2),
('2', '1', 1),
('3', '1', 8),
('2', '5', 4),
('2','3',3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select id, `date`, total_price from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select cus.name as customer_name, group_concat(p.name) as product_name from `order` o
inner join customer cus on o.customer_id = cus.id
inner join order_detail o_detail on o.id = o_detail.order_id
inner join product p on p.id = o_detail.product_id
group by cus.id;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select cus.name from customer cus
left join `order` o on o.customer_id = cus.id
where o.customer_id is null;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
-- Giá bán của từng loại được tính = odQTY*pPrice)
select o.id, o.`date`, sum(o_detail.quantity*p.price) as total_price from `order` o
inner join order_detail o_detail on o_detail.order_id = o.id
inner join product p on p.id = o_detail.product_id
group by o.id, o.`date`;
 

