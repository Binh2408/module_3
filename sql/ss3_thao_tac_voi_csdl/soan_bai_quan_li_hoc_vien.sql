create database if not exists c0225g1;
use c0225g1;
create table jame(
username varchar(50) primary key,
`password`  varchar(50)
);
create table class(
id int primary key auto_increment,
name varchar(50)
);
create table room(
id int primary key auto_increment,
name varchar(50),
class_id int,
foreign key(class_id) references class(id)
);
create table student(
id int primary key auto_increment,
name varchar(50),
gender boolean,
birthday date,
email varchar(100),
point float,
username varchar(50) unique,
class_id int,
foreign key(username) references jame(username),
foreign key(class_id) references class(id)
);
create table instructor(
id int primary key auto_increment,
name varchar(50),
birthday date,
salary float
);
create table instructor_class(
 instructor_id int,
 class_id int,
 start_time date,
 end_time_time date,
 primary key (instructor_id,class_id),
 foreign key(instructor_id) references instructor(id),
 foreign key(class_id) references class(id)
);

INSERT INTO jame(username, password) VALUES
('chung128', '123456'),
('binh123', '123456'),
('khanh123', '123456'),
('dong123', '123456'),
('thao123', '123456');
INSERT INTO class(name) VALUES 
('c1121g1'),
('c0225g1');
INSERT INTO room(name, class_id) VALUES 
('Room A', 1),
('Room B', 2);
INSERT INTO student(name, gender, birthday, email, point, username, class_id) VALUES 
('Trần Văn Chung', 1, '2001-05-10', 'chungthuy@example.com', 7.5, 'chung128', 1),
('Nguyễn Văn Bình', 1, '2000-09-15', 'binhthuong@example.com', 8.0, 'binh123', 2),
('Phạm Ngọc Khánh', 0, '2002-12-01', 'khanhngoc@example.com', 4.5, 'khanh123', 1),
('Nguyễn Trí Đông', 1, '2003-03-11', 'dongnguyen@example.com', 9.0, 'dong123', 1),
('Lê Thị Thu Thảo', 1, '2000-06-06', 'thaole@example.com', 6.0, 'thao123', 2);
INSERT INTO instructor (name, birthday, salary) VALUES
('Trần Văn Chánh', '1999-11-11', 5000000),
('Trần Thanh Hải', '1998-11-11', 4500000);
INSERT INTO instructor_class (instructor_id, class_id, start_time, end_time_time) VALUES
(1, 1, '2024-01-15', '2024-06-15'),
(2, 1, '2024-01-15', '2024-06-15');

-- ------------------------Truy vấn--------------------------------------------
-- Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào.
SELECT s.*, c.name AS class_name
FROM student s
JOIN class c ON s.class_id = c.id;

-- Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào và cả các bạn đã đăng ký nhưng chưa có lớp học.
SELECT s.*, c.name AS class_name
FROM student s
LEFT JOIN class c ON s.class_id = c.id;

--  Lấy thông tin của các học viên tên “Hai” và 'Huynh’.
SELECT *
FROM student
WHERE name LIKE '%Hai%' OR name LIKE '%Huynh%';

-- Lấy ra học viên có điểm lớn hơn 5 .
SELECT *
FROM student
WHERE point > 5;

-- Lấy ra học viên có họ là “nguyen”
SELECT *
FROM student
WHERE name LIKE 'Nguyen%';

-- Thông kế số lượng học sinh theo từng loại điểm.
SELECT point, COUNT(*) AS total_students
FROM student
GROUP BY point;

-- Thông kế số lượng học sinh theo điểm và điểm phải lớn hơn 5
SELECT point, COUNT(*) AS total_students
FROM student
WHERE point > 5
GROUP BY point;

-- Thông kế số lượng học sinh theo điểm lớn hơn 5 và chỉ hiện thị với số lượng>=2
SELECT point, COUNT(*) AS total_students
FROM student
WHERE point > 5
GROUP BY point
HAVING COUNT(*) >= 2;

-- Lấy ra danh sách học viên của lớp c1121g1 và sắp xếp tên học viên theo alphabet.
SELECT s.*
FROM student s
JOIN class c ON s.class_id = c.id
WHERE c.name = 'c1121g1'
ORDER BY s.name ASC;




