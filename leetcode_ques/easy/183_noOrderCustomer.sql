--https://leetcode.com/problems/customers-who-never-order/
select name as Customers 
from customers
left outer join
orders
on customers.id=orders.customerId
where orders.id is null;