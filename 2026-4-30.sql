create database nghile30415;
use nghile30415;

-- tạo bảng 
create table teachers (
    id int primary key,
    full_name varchar(100) not null,
    salary decimal(10,2) not null check (salary > 0)
);

create table courses (
    id int primary key,
    course_name varchar(100) not null,
    teacher_id int null,
    credits int not null check (credits > 0),
    tuition_fee int not null check (tuition_fee > 0),
    foreign key (teacher_id) references teachers(id)
);

create table students (
    id int primary key,
    full_name varchar(100) not null,
    date_of_birth date not null,
    gender boolean not null
);

create table enrollments (
    id int primary key,
    student_id int not null,
    course_id int not null,
    date date not null,
    score decimal(4,2) null,
    foreign key (student_id) references students(id),
    foreign key (course_id) references courses(id)
);

-- thêm dữ liệu 
insert into teachers values
(1, 'nguyen van a', 15000000),
(2, 'tran thi b', 18000000),
(3, 'le van c', 20000000);

insert into courses values
(1, 'it fundamentals', 1, 3, 1500000),
(2, 'database systems', 2, 4, 2000000),
(3, 'web development', 1, 3, 1500000),
(4, 'computer networks', 3, 3, 1500000),
(5, 'operating systems', 2, 4, 2000000),
(6, 'ai introduction', null, 3, 1500000);

insert into students values
(1, 'student 1', '2003-01-01', 1),
(2, 'student 2', '2003-02-02', 0),
(3, 'student 3', '2003-03-03', 1),
(4, 'student 4', '2003-04-04', 0),
(5, 'student 5', '2003-05-05', 1),
(6, 'student 6', '2003-06-06', 0),
(7, 'student 7', '2003-07-07', 1),
(8, 'student 8', '2003-08-08', 0),
(9, 'student 9', '2003-09-09', 1),
(10, 'student 10', '2003-10-10', 0);

insert into enrollments values
(1, 1, 1, '2024-01-10', 8.5),
(2, 2, 1, '2024-01-11', 7.0),
(3, 3, 2, '2024-01-12', 9.0),
(4, 4, 2, '2024-01-13', 6.5),
(5, 5, 3, '2024-01-14', 8.0),
(6, 6, 3, '2024-01-15', 7.5),
(7, 7, 4, '2024-01-16', 9.2),
(8, 8, 4, '2024-01-17', 6.8),
(9, 9, 5, '2024-01-18', 7.9),
(10, 10, 5, '2024-01-19', 8.1),
(11, 1, 6, '2024-01-20', 7.2),
(12, 2, 6, '2024-01-21', 8.3),
(13, 3, 1, '2024-01-22', 8.0),
(14, 4, 3, '2024-01-23', null),
(15, 5, 4, '2024-01-24', null);

-- tăng lương 10% cho it 
update teachers
set salary = salary * 1.10
where id in (
    select teacher_id
    from courses
    where course_name like '%it%'
);
