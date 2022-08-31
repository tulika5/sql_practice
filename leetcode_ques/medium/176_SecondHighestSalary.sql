--https://leetcode.com/problems/second-highest-salary/
-- Write an SQL query to report the second highest salary from the Employee table. 
-- If there is no second highest salary, the query should report null.
-- +----+--------+
-- | id | salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
-- Output: 
-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | 200                 |
-- +---------------------+


--ok approach for 2nd highest; but sub clauses will keep on growing; if nth highest salary is to be found
select max(salary) as SecondHighestSalary from employee where salary not in
(select max(salary) from employee);

--APPROACH2

--dense rank will handle duplicate maximum salary
--DENSE_RANK() give SAME rank to dublicate values whereas RANK() give different rank to duplicate values.
--so eg. salary: 300,300,100; rank=2 will be again 300 which is wrong.

--used min function so as to get null value if empty resultset is returned.
select min(salary) as SecondHighestSalary  from
(select salary, dense_rank() over(order by salary desc) rank
from employee)
where rank=2