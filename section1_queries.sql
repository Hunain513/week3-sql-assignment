CREATE TABLE students (id INT PRIMARY KEY, 
    name VARCHAR(50),
    subject VARCHAR(30),
    marks INT NULL,
    city VARCHAR(30),
    admission_date DATE,
    attendance_percentage INT
);

-- Section 1
INSERT INTO students VALUES
(1, 'Ahmed', 'Math', 78, 'Lahore', '2023-01-15', 92),
(2, 'Ayesha', 'Science', 65, 'Karachi', '2023-01-18', 88),
(3, 'Bilal', 'Math', 45, 'Lahore', '2023-02-01', 70),
(4, 'Sana', 'English', 89, 'Islamabad', '2023-01-20', 95),
(5, 'Hassan', 'Science', NULL, 'Karachi', '2023-03-05', 60),
(6, 'Mariam', 'Math', 92, 'Lahore', '2023-01-10', 98),
(7, 'Usman', 'English', 55, 'Multan', '2023-02-14', 75),
(8, 'Zara', 'Science', 70, 'Islamabad', '2023-01-25', 85),
(9, 'Ahsan', 'Math', NULL, 'Karachi', '2023-04-02', 50),
(10, 'Nida', 'English', 60, 'Lahore', '2023-02-20', 80);

-- Query 1
SELECT * FROM students;

-- Query 2
SELECT name, marks
FROM students
WHERE marks > 70;

-- Query 3
SELECT DISTINCT subject
FROM students;

-- Query 4
SELECT *
FROM students
WHERE name LIKE 'A%';

-- Query 5
SELECT *
FROM students
WHERE admission_date > '2023-01-20';

-- Query 6
SELECT *
FROM students
WHERE marks IS NULL;

-- Query 7
SELECT COUNT(*) AS total_students
FROM students;

-- Query 8
SELECT AVG(marks) AS average_marks
FROM students;

-- Query 9
SELECT MAX(marks) AS highest_marks,
       MIN(marks) AS lowest_marks
FROM students;

-- Query 10
SELECT *
FROM students
ORDER BY marks DESC
LIMIT 5;



