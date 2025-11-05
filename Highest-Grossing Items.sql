# query to identify the top two highest-grossing products within each category in the year 2022. The output should include the category, product, and total spend.


with category_spend as (
SELECT category, 
product, 
sum(spend) as total_spend,
rank() over(partition by category order by sum(spend) desc) as category_rank
FROM product_spend
WHERE transaction_date >= DATE '2022-01-01' AND transaction_date <  DATE '2023-01-01'
group by category, product
)

select category, product, total_spend
from category_spend
where category_rank<=2
order by category, category_rank
;