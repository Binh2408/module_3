create database quan_ly_san_pham;
use quan_ly_san_pham;

create table loai_san_pham(
	id_loai_san_pham int primary key auto_increment,
    ten_loai varchar(100) not null 
);

create table san_pham(
	ma_san_pham varchar(100) primary key,
    ten_san_pham varchar(100) not null,
    gia_san_pham double check (gia_san_pham > 0),
    mo_ta_san_pham varchar(145),
    nha_san_xuat varchar(100),
	id_loai_san_pham int,
    foreign key (id_loai_san_pham) references loai_san_pham(id_loai_san_pham)
);

-- -------------------Dữ liệu -------------------------
INSERT INTO loai_san_pham (ten_loai) VALUES
('Điện thoại'),
('Laptop'),
('Tivi'),
('Máy giặt');

INSERT INTO san_pham (ma_san_pham, ten_san_pham, gia_san_pham, mo_ta_san_pham, nha_san_xuat, id_loai_san_pham) VALUES
-- Điện thoại (id_loai_san_pham = 1)
('SP001', 'iPhone 14', 20000000, 'iPhone 14 chính hãng VN/A', 'Apple', 1),
('SP002', 'Samsung Galaxy S23', 18000000, 'Samsung S23 bản tiêu chuẩn', 'Samsung', 1),

-- Laptop (id_loai_san_pham = 2)
('SP003', 'MacBook Air M2', 25000000, 'MacBook Air M2 2022', 'Apple', 2),
('SP004', 'Dell XPS 13', 22000000, 'Laptop mỏng nhẹ cao cấp', 'Dell', 2),
('SP005', 'Asus VivoBook', 15000000, 'Laptop phổ thông dành cho sinh viên', 'Asus', 2),

-- Tivi (id_loai_san_pham = 3)
('SP006', 'Sony Bravia 55 inch', 18000000, 'Smart Tivi 4K siêu nét', 'Sony', 3),
('SP007', 'LG OLED 48 inch', 21000000, 'Màn hình OLED sắc nét', 'LG', 3),
('SP008', 'Samsung Crystal UHD', 16000000, 'Tivi 4K giá tốt', 'Samsung', 3),

-- Máy giặt (id_loai_san_pham = 4)
('SP009', 'Electrolux Inverter 9kg', 9000000, 'Tiết kiệm điện năng, chạy êm', 'Electrolux', 4),
('SP010', 'Panasonic 8.5kg', 8000000, 'Máy giặt cửa trên', 'Panasonic', 4);


select sp.ma_san_pham as Mã, sp.ten_san_pham as Tên, sp.gia_san_pham as Giá, lsp.ten_loai as Loại
from san_pham sp join loai_san_pham lsp on lsp.id_loai_san_pham = sp.id_loai_san_pham;
insert into san_pham values ('SP0011','iPhone20',20000000, 'iPhone 14 chính hãng VN/A','Apple',1);

select * from san_pham;
select * from loai_san_pham;
delete from san_pham where ma_san_pham = 'SP0011';
select * from san_pham where ma_san_pham = 'SP010';	
update san_pham
set ten_san_pham = 'a',
	gia_san_pham = 200000,
    mo_ta_san_pham = 'aaaa',
    nha_san_xuat = 'Bình',
    id_loai_san_pham = 4
where ma_san_pham = 'SP010';

SELECT sp.ma_san_pham,sp.ten_san_pham,sp.gia_san_pham,lsp.ten_loai
FROM san_pham sp
JOIN loai_san_pham lsp ON sp.id_loai_san_pham = lsp.id_loai_san_pham
WHERE sp.ten_san_pham LIKE '%Mac%';

SELECT sp.ma_san_pham,sp.ten_san_pham,sp.gia_san_pham,lsp.ten_loai
FROM san_pham sp
JOIN loai_san_pham lsp ON sp.id_loai_san_pham = lsp.id_loai_san_pham
WHERE sp.ten_san_pham LIKE '%%' AND lsp.ten_loai LIKE '%l%';

SELECT sp.ma_san_pham,sp.ten_san_pham,sp.gia_san_pham,lsp.ten_loai
FROM san_pham sp
JOIN loai_san_pham lsp ON sp.id_loai_san_pham = lsp.id_loai_san_pham
WHERE lsp.ten_loai LIKE '%l%';



