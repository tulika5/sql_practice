--https://leetcode.com/problems/department-highest-salary/

-- there is a special restriction to window functions, 
-- which can not appear in the where clause of a query (they are allowed only in the select an order by clauses).

--option 1
SELECT Department.name as Department,Employee.name as Employee,Salary
from
(select name,id,departmentId,MAX(salary) over(partition by departmentId) as max_salary,salary
from Employee)
Employee
join
Department
on
Employee.departmentId=Department.id
and Employee.max_salary=Employee.salary;

--option 2---ran FASTER**
SELECT Department.name as Department,Employee.name as Employee,Salary
from
    (select name,id,departmentId,RANK() over(partition by departmentId order by salary desc) as dept_rank,salary
from Employee)
Employee
join
Department
on
Employee.departmentId=Department.id
and Employee.dept_rank=1;