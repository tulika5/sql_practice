--https://www.youtube.com/watch?v=nepD-bX4xj0
select name, bonus
from employee
left join bonus on employee.empId=bonus.empId
--where bonus<1000 or bonus is null
where coalesce(bonus,0)<1000

--as null won't be compared directly with a number,
-- so separate clause or just convert null to 0 using coalesce and then compare

--note that condition included in 'where'clause filters AFTER JOIN
--condition included in 'ON' clause filters DURING JOIN
--so,if u inclde bonus condition like:

--left join bonus on employee.empId=bonus.empId and (bonus<1000 or bonus is null)
--if some employee will have bonus>1000, that will be reported in final ans. 
--but bonus value as null as row from bonus tbl be filtered out