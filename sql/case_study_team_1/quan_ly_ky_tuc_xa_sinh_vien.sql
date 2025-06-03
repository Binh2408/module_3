create database if not exists quan_ly_ky_tuc_xa;
use quan_ly_ky_tuc_xa;
  --  tạo chuẩn hoá dữ liệu
  
  create table gioi_tinh(
  ma_gioi_tinh tinyint primary key auto_increment,
  ten_gioi_tinh varchar(20));
  
  create table vai_tro(
  ma_vai_tro int primary key auto_increment,
  ten_vai_tro varchar(20));
  
    create table loai_phong(
  ma_loai_phong int primary key auto_increment,
  ten_loai_phong varchar(20));
  
  create table loai_vi_pham(
  ma_vi_pham int primary key auto_increment,
  ten_vi_pham varchar(100) unique,
  muc_phat double);

  
    create table muc_do_vi_pham (
  ma_muc_do_vi_pham int primary key auto_increment,
  ten_muc_do_vi_pham  varchar(20));
  
   create table lop_hoc (
  ma_lop_hoc int primary key auto_increment,
  ten_lop_hoc varchar(20));
  
   create table trang_thai_su_dung (
  ma_trang_thai_su_dung int primary key auto_increment,
  ten_trang_thai_su_dung varchar(20));
  
  --  các bảng nghiệp vụ 
  
create table tai_khoan(
ma_tai_khoan int primary key auto_increment,
user_name varchar(50) not null unique,
password varchar(50) not null,
ma_vai_tro int,
ngay_tao_tk datetime default current_timestamp,
is_delete tinyint default 0,
foreign key (ma_vai_tro) references vai_tro(ma_vai_tro)
);

create table phong(
ma_phong int primary key auto_increment,
ten_phong varchar(50) not null unique,
ma_loai_phong int,
so_nguoi_do_da int,
so_nguoi_hien_tai int,
gia_moi_thang double check (gia_moi_thang>0),
ma_trang_thai_su_dung int,
is_delete tinyint default 0,
foreign key (ma_loai_phong) references loai_phong(ma_loai_phong),
foreign key (ma_trang_thai_su_dung) references trang_thai_su_dung(ma_trang_thai_su_dung)
);


create table sinh_vien(
ma_sinh_vien int primary key auto_increment,
ten_sinh_vien varchar(50) not null unique,
ma_tai_khoan int,
ma_lop_hoc int,
ma_gioi_tinh tinyint default 1,
cmnd varchar(20),
so_dien_thoai varchar(10),
email varchar(30),
is_delete tinyint default 0,
foreign key (ma_tai_khoan) references tai_khoan(ma_tai_khoan),
foreign key (ma_lop_hoc) references lop_hoc(ma_lop_hoc),
foreign key (ma_gioi_tinh) references gioi_tinh(ma_gioi_tinh)
);

create table gop_y (
ma_gop_y int primary key auto_increment,
noi_dung text,
thoi_gian_gui datetime default current_timestamp,
ma_sinh_vien int,
foreign key (ma_sinh_vien) references sinh_vien(ma_sinh_vien));

create table thong_bao (
ma_thong_bao int primary key auto_increment,
tieu_de varchar(100),
noi_dung text,
thoi_gian_gui datetime default current_timestamp);

create table bien_ban_vi_pham (
ma_bien_ban_vi_pham int primary key auto_increment,
ma_sinh_vien_vi_pham int,
ma_loai_vi_pham  int,
ma_muc_do_vi_pham int,
thoi_gian_vi_pham datetime default current_timestamp,
foreign key (ma_sinh_vien_vi_pham) references sinh_vien(ma_sinh_vien),
foreign key (ma_loai_vi_pham) references loai_vi_pham(ma_vi_pham),
foreign key (ma_muc_do_vi_pham) references muc_do_vi_pham(ma_muc_do_vi_pham));

create table hop_dong (
ma_hop_dong int primary key auto_increment,
ma_sinh_vien int,
ma_phong int,
thoi_gian_bat_dau datetime,
thoi_gian_ket_thuc datetime,
is_delete tinyint default 0,
foreign key (ma_sinh_vien) references sinh_vien(ma_sinh_vien),
foreign key (ma_phong) references phong(ma_phong));

-- Giới tính
INSERT INTO gioi_tinh (ten_gioi_tinh) VALUES
('Nam'),
('Nữ'),
('Khác');

-- Vai trò
INSERT INTO vai_tro (ten_vai_tro) VALUES
('Admin'),
('Sinh viên');

-- Loại phòng
INSERT INTO loai_phong (ten_loai_phong) VALUES
('Phòng đơn'),
('Phòng đôi'),
('Phòng 4 người');

-- Loại vi phạm (có thêm mức phạt)
INSERT INTO loai_vi_pham (ten_vi_pham, muc_phat) VALUES
('Gây ồn ào', 50000),
('Không tuân thủ nội quy', 100000),
('Phá hoại tài sản', 300000);

-- Mức độ vi phạm
INSERT INTO muc_do_vi_pham (ten_muc_do_vi_pham) VALUES
('Nhẹ'),
('Trung bình'),
('Nặng');

-- Lớp học
INSERT INTO lop_hoc (ten_lop_hoc) VALUES
('CNTT1'),
('KTPM2'),
('DTVT3');

-- Trạng thái sử dụng
INSERT INTO trang_thai_su_dung (ten_trang_thai_su_dung) VALUES
('Đang sử dụng'),
('Trống'),
('Bảo trì');

-- Tài khoản
INSERT INTO tai_khoan (user_name, password, ma_vai_tro) VALUES
('admin', 'admin123', 1),
('sv01', 'sv01pass', 2),
('sv02', 'sv02pass', 2),
('sv03', 'sv03pass', 2);

-- Phòng
INSERT INTO phong (ten_phong, ma_loai_phong, so_nguoi_do_da, so_nguoi_hien_tai, gia_moi_thang, ma_trang_thai_su_dung) VALUES
('A101', 1, 1, 1, 1000000, 1),
('B201', 2, 2, 0, 1500000, 2),
('C301', 3, 4, 3, 2000000, 1);

-- Sinh viên
INSERT INTO sinh_vien (ten_sinh_vien, ma_tai_khoan, ma_lop_hoc, ma_gioi_tinh, cmnd, so_dien_thoai, email) VALUES
('Nguyen Thanh Nhon', 2, 1, 1, '987654321', '0912345678', 'vannhon@example.com'),
('Nguyen Van Binh', 3, 1, 1, '123456789', '0912345678', 'vanbinh@example.com'),
('Tran Van Dung', 4, 2, 1, '1122334455', '0911222333', 'dungtv@example.com');

-- Hợp đồng
INSERT INTO hop_dong (ma_sinh_vien, ma_phong, thoi_gian_bat_dau, thoi_gian_ket_thuc) VALUES
(1, 1, '2025-01-01', '2025-12-31'),
(2, 2, '2025-02-01', '2025-11-30'),
(3, 3, '2025-03-01', '2025-12-31');

-- Góp ý
INSERT INTO gop_y (noi_dung, ma_sinh_vien) VALUES
('Phòng hơi nóng, cần sửa máy lạnh.', 1),
('Wifi yếu, cần nâng cấp.', 2);

-- Thông báo
INSERT INTO thong_bao (tieu_de, noi_dung) VALUES
('Thông báo cúp điện', 'KTX sẽ cúp điện từ 8h - 12h ngày 1/6.'),
('Lịch vệ sinh chung', 'Toàn KTX sẽ tổng vệ sinh vào ngày 3/6.');

-- Biên bản vi phạm
INSERT INTO bien_ban_vi_pham (ma_sinh_vien_vi_pham, ma_loai_vi_pham, ma_muc_do_vi_pham) VALUES
(1, 1, 2),
(2, 3, 3);

select * from tai_khoan where user_name ='admin' and password = 'admin123';
select * from vai_tro;