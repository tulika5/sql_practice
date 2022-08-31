--https://leetcode.com/problems/consecutive-numbers/

--LAG: returns values from a previous row in the table
--LEAD: returns values from next rows in table

-- LAG ( expression [, offset [, default] ] )
-- OVER ( [ query_partition_clause ] order_by_clause )

--option 1
SELECT DISTINCT num as ConsecutiveNums 
FROM
(
SELECT num,
LEAD(num) OVER(ORDER BY id) AS lead,
LAG(num) OVER (ORDER BY id) AS lag
FROM logs
)t
WHERE num=lead and num=lag;

--option 2
select distinct l1.Num as ConsecutiveNums
from Logs l1, Logs l2, Logs l3
where l2.Id = l1.Id+1 and l3.Id = l2.Id + 1 and l1.Num = l2.Num and l2.Num = l3.Num