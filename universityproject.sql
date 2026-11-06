CREATE DATABASE universityDB;

USE universityDB;

CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    hod_name VARCHAR(100)
);



CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    city VARCHAR(50),
    department_id INT,
    admission_date DATE,

    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);

CREATE TABLE instructors (
    instructor_id INT PRIMARY KEY AUTO_INCREMENT,
    instructor_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    department_id INT,

    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_title VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    department_id INT,
    instructor_id INT,

    FOREIGN KEY (department_id)
    REFERENCES departments(department_id),

    FOREIGN KEY (instructor_id)
    REFERENCES instructors(instructor_id)
);


CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade DECIMAL(5,2),

    FOREIGN KEY (student_id)
    REFERENCES students(student_id),

    FOREIGN KEY (course_id)
    REFERENCES courses(course_id),

    UNIQUE(student_id, course_id),

    CHECK (grade IS NULL OR (grade >= 0 AND grade <= 100))
);

CREATE TABLE class_schedule (
    schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT,
    instructor_id INT,
    classroom VARCHAR(50),
    class_day VARCHAR(20),
    start_time TIME,
    end_time TIME,

    FOREIGN KEY (course_id)
    REFERENCES courses(course_id),

    FOREIGN KEY (instructor_id)
    REFERENCES instructors(instructor_id),

    CHECK (end_time > start_time)
);


INSERT INTO departments (department_name, hod_name)
VALUES
('Computer Science', 'Dr. Rajesh'),
('Electronics', 'Dr. Kumar'),
('Mechanical', 'Dr. Anil'),
('Civil', 'Dr. Suresh'),
('Mathematics', 'Dr. Priya');

INSERT INTO instructors
(instructor_name, email, phone, department_id)
VALUES
('Arun Kumar', 'arun@gmail.com', '9876543210', 1),
('Meera Nair', 'meera@gmail.com', '9876543211', 1),
('Rahul Das', 'rahul@gmail.com', '9876543212', 2),
('Anjali Menon', 'anjali@gmail.com', '9876543213', 3),
('Vishnu Raj', 'vishnu@gmail.com', '9876543214', 4);


INSERT INTO students
(student_name, email, phone, city, department_id, admission_date)
VALUES
('Akhil', 'akhil@gmail.com', '9000000001', 'Kochi', 1, '2025-06-10'),
('Rahul', 'rahul1@gmail.com', '9000000002', 'Kollam', 1, '2025-06-10'),
('Anu', 'anu@gmail.com', '9000000003', 'Trivandrum', 2, '2025-06-11'),
('Arjun', 'arjun@gmail.com', '9000000004', 'Kochi', 3, '2025-06-12'),
('Megha', 'megha@gmail.com', '9000000005', 'Alappuzha', 1, '2025-06-12'),
('Vishal', 'vishal@gmail.com', '9000000006', 'Kollam', 4, '2025-06-13'),
('Neha', 'neha@gmail.com', '9000000007', 'Kochi', 2, '2025-06-14'),
('Amal', 'amal@gmail.com', '9000000008', 'Thrissur', 3, '2025-06-14'),
('Sneha', 'sneha@gmail.com', '9000000009', 'Trivandrum', 5, '2025-06-15'),
('Kiran', 'kiran@gmail.com', '9000000010', 'Kochi', 1, '2025-06-15');


INSERT INTO courses
(course_title, credits, department_id, instructor_id)
VALUES
('Python Programming', 4, 1, 1),
('Database Management', 3, 1, 2),
('Web Development', 4, 1, 1),
('Digital Electronics', 3, 2, 3),
('Machine Design', 4, 3, 4),
('Structural Engineering', 4, 4, 5),
('Linear Algebra', 3, 5, 2),
('Data Structures', 4, 1, 1);


INSERT INTO enrollments
(student_id, course_id, enrollment_date, grade)
VALUES
(1, 1, '2025-07-01', 85),
(1, 2, '2025-07-01', 90),
(2, 1, '2025-07-02', 78),
(2, 3, '2025-07-02', 82),
(3, 4, '2025-07-03', 88),
(4, 5, '2025-07-03', 75),
(5, 1, '2025-07-04', 92),
(5, 2, '2025-07-04', 86),
(6, 6, '2025-07-05', 80),
(7, 4, '2025-07-05', 89),
(8, 5, '2025-07-06', 77),
(9, 7, '2025-07-06', 95),
(10, 8, '2025-07-07', 91),
(1, 8, '2025-07-07', 87),
(2, 8, '2025-07-08', 83);



INSERT INTO class_schedule
(course_id, instructor_id, classroom, class_day, start_time, end_time)
VALUES
(1, 1, 'Room 101', 'Monday', '09:00:00', '10:00:00'),
(2, 2, 'Room 102', 'Tuesday', '10:00:00', '11:00:00'),
(3, 1, 'Lab 1', 'Wednesday', '11:00:00', '12:00:00'),
(4, 3, 'Room 201', 'Thursday', '09:00:00', '10:00:00'),
(5, 4, 'Room 301', 'Friday', '10:00:00', '11:00:00'),
(6, 5, 'Room 401', 'Monday', '12:00:00', '13:00:00'),
(7, 2, 'Room 102', 'Wednesday', '14:00:00', '15:00:00'),
(8, 1, 'Lab 2', 'Friday', '13:00:00', '14:00:00');


update students set phone ='94983828483',city='Trivandrum' where student_id=1;

delete from courses where course_id=8;
select *from courses;
select *from departments;
select *from enrollments;
select *from students;

select *from class_schedule;
delete from class_schedule where course_id=8;


delete from enrollments where course_id=8;


INSERT INTO enrollments
(student_id, course_id, enrollment_date, grade)
VALUES
(3, 1, CURDATE(), NULL);



SELECT s.student_id,s.student_name,s.email,s.phone,d.department_name FROM students s INNER JOIN departments d ON s.department_id = d.department_id;



SELECT c.course_id, c.course_title, i.instructor_name FROM courses c INNER JOIN instructors i ON c.instructor_id = i.instructor_id WHERE i.instructor_name = 'Arun Kumar';



SELECT s.student_name, c.course_title FROM enrollments e INNER JOIN students s ON e.student_id = s.student_id INNER JOIN courses c ON e.course_id = c.course_id WHERE c.course_title = 'Python Programming';


select d.department_name,count(s.student_id)AS total_students from departments d LEFT JOIN students s on d.department_id group by d.department_id,d.department_name;

select i.instructor_name,count(c.course_id) as total_courses from instructors i left join courses c on i.instructor_id = c.instructor_id group by i.instructor_id,i.instructor_name;

select c.course_title, avg(e.grade) as average_grade from courses c inner join enrollments e on c.course_id=e.course_id group by c.course_id,c.course_title;

select  d.department_name,count(s.student_id) as total_students from departments d left join students s on d.department_id = s.department_id group by d.department_id,d.department_name order by total_students desc limit 1;

select * from students where student_id not in(select student_id from enrollments);

select instructor_name,total_courses from(select i.instructor_name,COUNT(c.course_id) as total_courses from instructors i left join courses c on i.instructor_id = c.instructor_id group by i.instructor_id,i.instructor_name) as instructor_counts where total_courses =(select max(course_count) from( select count(course_id) as course_count from courses group  by instructor_id)as counts );

select s.student_name,c.course_title,e.grade from enrollments e inner join students s on e.student_id = s.students_id inner join courses c on e.course_id = c.course_id;

create index idx_student_name on students(student_name);

create index idx_course_title on courses(course_title);


create view student_performance as select s.student_id,s.student_name,c.course_title,e.grade from students s inner join enrollments e on s.student_id = e.student_id inner join courses c on e.course_id=c.course_id;

SELECT * FROM student_performance;









