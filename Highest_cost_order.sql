'Find the customers with the highest daily total order cost between 2019-02-01 and 2019-05-01. If a customer had more than one order on a certain day, sum the order costs on a daily basis. Output each customer first name, total cost of their items, and the date. If multiple customers tie for the highest daily total on the same date, return all of them.'
"Stratscracth Medium"

with order_cost as (
select cust_id, order_date, sum(total_order_cost) as max_cost,
RANK() OVER(PARTITION BY order_date order by SUM(total_order_cost) DESC) as cost_rank
from orders
WHERE order_date between '2019-02-01' and '2019-05-01'
group by order_date, cust_id)

select  c.first_name, o.order_date, o.max_cost
from order_cost o
join customers c on o.cust_id = c.id 
where cost_rank = 1
order by order_date;