create database quan_ly_internet;
use quan_ly_internet;

create table hang_san_xuat(
	id int auto_increment primary key,
    ten varchar(50)
);

create table may_tinh(
	ma_may varchar(10) primary key,
    vi_tri_dat_may varchar(100),
    hang_san_xuat_id int,
    foreign key (hang_san_xuat_id) references hang_san_xuat(id)
);

create table loai_khach_hang(
	id int auto_increment primary key,
    loai varchar(50)
);

create table khach_hang(
	ma_khach_hang varchar(10) primary key,
    ten varchar(50),
    email varchar(50),
    loai_khach_hang_id int,
    foreign key (loai_khach_hang_id) references loai_khach_hang(id)
);

create table so_dien_thoai(
	sdt varchar(10) primary key,
    ma_khach_hang varchar(10),
    foreign key (ma_khach_hang) references khach_hang(ma_khach_hang)
);

create table dich_vu_di_kem(
	id int auto_increment primary key,
    ten varchar(50),
    gia double
);

create table su_dung_dich_vu(
	id int auto_increment primary key,
    thoi_gian_bat_dau datetime,
    thoi_gian_ket_thuc datetime,
    khach_hang_ma varchar(10),
    may_tinh_ma_may varchar(10),
    foreign key (khach_hang_ma) references khach_hang(ma_khach_hang),
    foreign key (may_tinh_ma_may) references may_tinh(ma_may)
);

create table chi_tiet_su_dung(
	id_dich_vu_di_kem int,
    id_su_dung_dich_vu int,
    primary key (id_dich_vu_di_kem,id_su_dung_dich_vu),
    foreign key (id_dich_vu_di_kem) references dich_vu_di_kem(id),
    foreign key (id_su_dung_dich_vu) references su_dung_dich_vu(id)
);


