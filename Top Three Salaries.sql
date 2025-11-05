"Top Three Salaries
FAANG SQL Interview Question - Datalemur"

with salary_order as(
SELECT name, 
salary, 
department_id, 
Dense_Rank() OVER(PARTITION BY department_id ORDER BY SALARY DESC) AS d_high_salary
FROM employee)

SELECT d.department_name, s.name, s.salary
FROM
salary_order s
JOIN 
department d ON s.department_id = d.department_id
WHERE d_high_salary BETWEEN 1 AND 3
ORDER BY d.department_name, s.salary DESC, s.name;