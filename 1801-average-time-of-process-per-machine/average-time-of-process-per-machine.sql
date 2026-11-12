# Write your MySQL query statement below

/*
select *
from activity s
join activity e
on s.machine_id  = e.machine_id and s.process_id = e.process_id
and s.activity_type = 'start' and e.activity_type = 'end'
group by s.machine_id

*/
/*
with cte as (

select * from activity s
join activity e
on s.machine_id = e.machine_id and
s.process_id = e.process_id
where s.activity_type = 'start' and e.activity_type = 'end'
)

select machine_id, avg(end_time- start_time) as processing_time
from cte
group by machine_id
*/

with activity_pivot as (
    select machine_id,
    sum(case
    when activity_type = 'start' then timestamp
    else null end )as start_time,
    sum(case when activity_type = 'end' then timestamp
    else null end) as end_time
    from activity
group by machine_id, process_id
)
select machine_id,
 round(avg(end_time - start_time), 3) as processing_time
 from activity_pivot
group by machine_id

