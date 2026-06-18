create database LMS_DB;
use LMS_DB;

create table students(
student_id int primary key auto_increment,
first_name varchar(50),
last_name varchar (50),
email varchar(100),
registration_date date,
country varchar(50)
);

select * from students;

INSERT INTO Students (first_name, last_name, email, registration_date, country) VALUES
('Rahul', 'Sharma', 'rahul@gmail.com', '2025-01-10', 'Nepal'),
('Sita', 'Thapa', 'sita@gmail.com', '2025-01-15', 'Nepal'),
('Ram', 'Yadav', 'ram@gmail.com', '2025-02-01', 'India'),
('Hari', 'Karki', 'hari@gmail.com', '2025-02-10', 'Nepal'),
('Gita', 'Singh', 'gita@gmail.com', '2025-03-05', 'India');

create table Instructions(
instructor_id int primary key auto_increment,
instructor_name varchar(50),
specialization varchar(100),
joining_date date
);

SELECT * FROM Instructions;

INSERT INTO Instructions (instructor_name, specialization, joining_date) VALUES
('Vinod Kumar', 'Java Programming', '2023-01-10'),
('Anita Sharma', 'Database Management', '2023-03-15'),
('Rajesh Gupta', 'Web Development', '2024-01-20'),
('Priya Singh', 'Python Programming', '2024-05-12'),
('Suman Karki', 'Data Science', '2025-01-01');


create table courses(
course_id int primary key auto_increment,
course_name varchar(100),
category varchar(100),
course_fee decimal(10,2),
instructor_id int,
foreign key (instructor_id)
references Instructions(instructor_id)
);

select * from courses;

INSERT INTO Courses (course_name, category, course_fee, instructor_id) VALUES
('Java Fundamentals', 'Programming', 15000.00, 1),
('Advanced SQL', 'Database', 12000.00, 2),
('Full Stack Web Development', 'Web Development', 20000.00, 3),
('Python for Beginners', 'Programming', 14000.00, 4),
('Data Science Basics', 'Data Science', 18000.00, 5);

create table Enrollments(
enrollment_id int primary key auto_increment,
student_id int,
course_id int,
enrollment_date date,
completion_status varchar(20),
 foreign key (student_id)
references Students(student_id),
foreign key (course_id)
references Courses(course_id)
);

SELECT * FROM Enrollments;

INSERT INTO Enrollments (student_id, course_id, enrollment_date, completion_status) VALUES
(1, 1, '2025-04-01', 'Completed'),
(1, 2, '2025-04-05', 'In Progress'),
(2, 3, '2025-04-10', 'Completed'),
(3, 4, '2025-04-12', 'In Progress'),
(4, 5, '2025-04-15', 'Completed'),
(5, 1, '2025-04-20', 'In Progress');

create table assignments (
    assignment_id int primary key,
    course_id int,
    assignment_title varchar(100),
    max_marks int,
    due_date date,
    foreign key (course_id)
        references courses(course_id)
);

SELECT * FROM Assignments;

INSERT INTO Assignments (assignment_id, course_id, assignment_title, max_marks, due_date) VALUES
(1, 1, 'Java OOP Assignment', 100, '2025-05-01'),
(2, 2, 'SQL Query Practice', 100, '2025-05-05'),
(3, 3, 'Website Project', 100, '2025-05-10'),
(4, 4, 'Python Basics Task', 100, '2025-05-15'),
(5, 5, 'Data Analysis Report', 100, '2025-05-20');

create table assignment_submissions (
    submission_id int primary key,
    assignment_id int,
    student_id int,
    marks_obtained int,
    submission_date date,
    foreign key (assignment_id)
        references assignments(assignment_id),
    foreign key (student_id)
        references students(student_id)
);

SELECT * FROM Assignment_Submissions;

INSERT INTO Assignment_Submissions (submission_id, assignment_id, student_id, marks_obtained, submission_date) VALUES
(1, 1, 1, 90, '2025-04-30'),
(2, 2, 1, 85, '2025-05-04'),
(3, 3, 2, 95, '2025-05-09'),
(4, 4, 3, 80, '2025-05-14'),
(5, 5, 4, 88, '2025-05-19');


create table payments (
    payment_id int primary key,
    student_id int,
    amount_paid decimal(10,2),
    payment_date date,
    payment_method varchar(20),
    foreign key (student_id)
        references students(student_id)
);
SELECT * FROM Payments;


INSERT INTO Payments (payment_id, student_id, amount_paid, payment_date, payment_method) VALUES
(1, 1, 15000.00, '2025-04-01', 'Cash'),
(2, 2, 20000.00, '2025-04-10', 'Card'),
(3, 3, 14000.00, '2025-04-12', 'eSewa'),
(4, 4, 18000.00, '2025-04-15', 'Bank Transfer'),
(5, 5, 15000.00, '2025-04-20', 'Cash');

SELECT s.student_id, s.first_name, s.last_name, p.amount_paid
FROM students s
JOIN payments p ON s.student_id = p.student_id
WHERE 
p.amount_paid > (SELECT AVG(amount_paid) FROM payments);
    
    
SELECT course_name
FROM 
courses
WHERE 
course_fee > (SELECT avg (course_fee) FROM courses);


select i.instructor_id, i.instructor_name, c.course_name, c.course_fee
from instructors i
join courses c on i.instructor_id = c.instructor_id
where c.course_fee = (
    select max(course_fee) 
    from courses
);


select s.student_id, s.first_name, s.last_name
from students s
join enrollments e on s.student_id = e.student_id
where e.course_id = (
    select course_id
    from courses
    where course_fee = (
        select max(course_fee)
        from courses
    )
);


select * from assignments
where max_marks > (
    select avg(max_marks)
    from assignments
);

select * from students
where student_id in (
    select student_id
    from assignment_submissions
);

select * from students
where student_id not in (
    select student_id
    from assignment_submissions
);

select * from courses
where course_id in (
    select course_id
    from enrollments
);

select * from courses
where course_id not in (
    select course_id
    from enrollments
);



select * from instructions
where instructor_id not in (
    select instructor_id
    from courses
);




select s.student_id,
       s.first_name,
       s.last_name
from students s
where (
    select sum(p.amount_paid)
    from payments p
    where p.student_id = s.student_id
) >
(
    select avg(total_payment)
    from (
        select sum(amount_paid) as total_payment
        from payments
        group by student_id
    ) as avg_payments
);

