--https://leetcode.com/problems/nth-highest-salary/
CREATE FUNCTION getNthHighestSalary(N IN NUMBER) RETURN NUMBER IS
result NUMBER;
BEGIN
    select MAX(salary) into result
    from (
    select salary, dense_rank() over(order by salary desc)  as emp_rank
    from Employee
        ) where emp_rank = N;
    
    RETURN result;
END;