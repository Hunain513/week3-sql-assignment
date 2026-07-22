-- Section 2 Medium 

-- Query 1 , Average Salary
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

-- Query 2 , Average salary is above 60,000
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;

-- Query 3 , how many employees work in each department

SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;

-- Query 4 , Show each employees name along with their department name and location, by joining employees with departments

SELECT employees.name, departments.department_name, departments.location
FROM employees
JOIN departments
ON employees.dept_id = departments.id;

-- Query 5 ,Show all employees and their department name, including employees whose department may not match any row in departments.

SELECT employees.name, departments.department_name
FROM employees
LEFT JOIN departments
ON employees.dept_id = departments.id;

-- Query 6 , Find all employees who earn more than the company&#39;s overall average salary.

SELECT name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees);
    
-- Query 7 , List departments that currently have at least one employee assigned to them.

SELECT DISTINCT departments.department_name
FROM departments
INNER JOIN employees
ON departments.id = employees.dept_id;

-- Query 8 , Show each employees name next to their managers name.

SELECT e.name AS employee_name,
       m.name AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.id;

-- Query 9 , Show each employees name, salary, bonus, and total pay (salary + bonus), treating a missing bonus as 0.

SELECT name, salary, bonus,salary + IFNULL(bonus, 0) AS total_pay
FROM employees;

-- Query 10, List all employees hired during the year 2021.

SELECT name, hire_date
FROM employees
WHERE YEAR(hire_date) = 2021;

-- Section 3 Hard

-- Query 1 , Rank employees by salary within their own department (highest salary = rank 1).

SELECT name,department,salary,
       RANK() OVER (
           PARTITION BY department
           ORDER BY salary DESC
       ) AS salary_rank
FROM employees;

-- Query 2 Find the top 2 highest-paid employees in every department.

SELECT name, department, salary
FROM (SELECT name,department,salary,
           ROW_NUMBER() OVER (
               PARTITION BY department
               ORDER BY salary DESC
           ) AS row_num
    FROM employees
) AS ranked_employees
WHERE row_num <= 2;

-- Query 3 For employees sorted by salary, show each employee's salary next to the salary of the employee just below them.

SELECT name,salary,
       LEAD(salary) OVER (ORDER BY salary DESC) AS next_salary
FROM employees;

-- Query 4 Using a CTE, find employees earning above 60,000, then count how many such employees exist per department.

WITH high_salary AS (SELECT *
    FROM employees
    WHERE salary > 60000
)
SELECT department,
       COUNT(*) AS employee_count
FROM high_salary
GROUP BY department;

-- Query 5 Combine the names of all employees from the IT department and the Sales department into a single list with no duplicates.

SELECT name
FROM employees
WHERE department = 'IT'

UNION

SELECT name
FROM employees
WHERE department = 'Sales';

-- Query 6 For each department, show its name, location, employee count, and average salary — but only for departments where the average salary exceeds 55,000.

SELECT d.department_name,
       d.location,
       COUNT(e.id) AS employee_count,
       AVG(e.salary) AS average_salary
FROM departments d
JOIN employees e
ON d.id = e.dept_id
GROUP BY d.department_name, d.location
HAVING AVG(e.salary) > 55000;

-- Query 7 Find every employee whose salary is greater than the average salary of their own department.

SELECT name,
       department,
       salary
FROM employees e
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department);
    
-- Query 8 Find all employees who are managing at least one other employee.

SELECT name
FROM employees e
WHERE EXISTS
(
    SELECT *
    FROM employees
    WHERE manager_id = e.id);

