--https://leetcode.com/problems/employees-earning-more-than-their-managers/
--self join

select e.name as employee
from
employee e
join
employee m
on e.managerId=m.id
where e.salary>m.salary;