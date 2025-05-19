CREATE DATABASE student_management;
use student_management;

create table Class(
	id int primary key,
    name varchar(200)
);

create table Teacher(
	id int primary key,
    name varchar(200),
    age int,
    country varchar(200)
);

-- SELECT * from Class;
-- INSERT INTO Class (id,name) values (1, 'C0225g1');
-- DELETE from Class WHERE id = '1';

-- SELECT * from Teacher;
-- INSERT INTO Teacher (id,name,age,country) values (1, 'Trần Văn Chánh', 30, 'Kontum');
