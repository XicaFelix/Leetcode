# Write your MySQL query statement below
select e.name, 
(case
    when unique_id is null then null else unique_id end
) as unique_id
from EmployeeUNI u
right join employees e
on u.id = e.id
