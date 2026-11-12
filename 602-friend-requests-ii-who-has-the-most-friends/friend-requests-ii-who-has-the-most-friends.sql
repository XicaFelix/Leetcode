# Write your MySQL query statement below
select id, count(*) as num from (
    select a.requester_id as id from RequestAccepted a
        union all
    select b.accepter_id as id from RequestAccepted b
) as combined_result
group by id
order by count(*) desc
limit 1
