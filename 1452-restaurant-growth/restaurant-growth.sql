# Write your MySQL query statement below
with visit_dates as (
    select distinct visited_on from Customer
where visited_on >= (select adddate(min(visited_on), 6) from Customer)
group by visited_on
)

select d.visited_on, sum(c.amount) as amount, round(sum(c.amount)/7,2) as average_amount from visit_dates d
left join Customer c
on c.visited_on between adddate(d.visited_on,-6) and d.visited_on
group by d.visited_on
order by d.visited_on asc
