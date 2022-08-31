--https://leetcode.com/problems/delete-duplicate-emails/

--difficult
delete from person where id in
(select id
 from
 (
     select id, lag(email) over(partition by email order by id) as lag
     from person 
 ) lag_person
 where lag is not null
)

--**EASY+ FASTER**: try first with simple joins concept:
delete
from person a
where id > any(select id from person b where a.email = b.email);