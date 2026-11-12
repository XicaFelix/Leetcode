# Write your MySQL query statement below
select e.name, 
unique_id
from EmployeeUNI u
right join employees e
on u.id = e.id
