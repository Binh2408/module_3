create database quan_ly_don_hang;
use quan_ly_don_hang;

create table phieu_xuat(
	so_phieu_xuat varchar(20) primary key,
    ngay_xuat datetime
);

create table vat_tu(
	ma_vat_tu varchar(20) primary key,
    ten_vat_tu varchar(50)
);

create table phieu_nhap(
	so_phieu_nhap varchar(20) primary key,
    ngay_nhap datetime
);

create table nha_cung_cap(
	ma_nha_cung_cap varchar(20) primary key,
    ten_nha_cung_cap varchar(50),
    dia_chi varchar(20)
);

create table don_dat_hang(
	so_don_hang varchar(20) primary key,
    ngay_dat_hang datetime,
    ma_nha_cung_cap varchar(20) unique,
    foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table chi_tiet_phieu_xuat(
	so_phieu_xuat varchar(20),
    ma_vat_tu varchar(20),
    don_gia_xuat double,
    so_luong_xuat int,
    primary key (so_phieu_xuat, ma_vat_tu),
    foreign key (so_phieu_xuat) references phieu_xuat(so_phieu_xuat),
    foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table chi_tiet_phieu_nhap(
	don_gia_nhap double,
    so_luong_nhap int,
    ma_vat_tu varchar(20),
    so_phieu_nhap varchar(20),
    primary key (ma_vat_tu, so_phieu_nhap),
    foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
    foreign key (so_phieu_nhap) references phieu_nhap(so_phieu_nhap)
);

create table chi_tiet_dat_hang(
	ma_vat_tu varchar(20),
    so_don_hang varchar(20),
    primary key (ma_vat_tu, so_don_hang),
    foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
    foreign key (so_don_hang) references don_dat_hang(so_don_hang)
);

create table so_dien_thoai(
	sdt varchar(10) primary key,
    ma_nha_cung_cap varchar(20),
    foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);
