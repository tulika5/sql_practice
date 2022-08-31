--https://leetcode.com/problems/department-top-three-salaries/

--dense_rank: will give same rank to multiple employees having same max salary
select Department.name as Department,Employee.name as Employee,Employee.salary as Salary
from
(select id,name,salary,departmentId,dense_rank() over(partition by departmentId order by salary desc) as dept_rank
from Employee
)
Employee
join
Department
on
Employee.departmentId =Department.id
where dept_rank<=3