--https://leetcode.com/problems/trips-and-users/

/* Write your PL/SQL query statement below */
select request_at as Day,
ROUND(sum(cancelled_trip_count)/sum(total_trip_count),2) as "Cancellation Rate"
from
(select
client.banned as client_banned,
driver.banned as driver_banned,
trips.status,
trips.request_at,
case
when client.banned='No' and driver.banned='No' then 1
else 0
end as total_trip_count,
case
when client.banned='No' and driver.banned='No' and trips.status<> 'completed' then 1
else 0
end as cancelled_trip_count
from
trips 
left join users client
on trips.client_id=client.users_id
left join users driver
on trips.driver_id=driver.users_id
where trips.request_at between '2013-10-01' and '2013-10-03'
)
total_info
where
total_trip_count>0  

group by request_at

;