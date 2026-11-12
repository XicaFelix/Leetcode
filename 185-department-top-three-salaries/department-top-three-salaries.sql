# Write your MySQL query statement below
-- Find high earner for each department

with ranking as (
select 
    e.id,
    d.name as Department,
    e.name as Employee,
    salary,
dense_rank () over (
    partition by d.id 
    order by salary desc
) as salary_rank
from employee e
join department d
on e.departmentId = d.id
group by e.departmentId, e.id
order by salary desc
)

select
    Department,
    Employee, 
    salary as Salary 
from ranking 
where salary_rank <= 3
order by Salary desc, salary_rank asc
