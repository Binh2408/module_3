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
  ten_vi_pham varchar(20));
  
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
