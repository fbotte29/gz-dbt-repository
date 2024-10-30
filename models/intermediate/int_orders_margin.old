With 

ref AS (

select orders_id,date_date,quantity,products_id,revenue,purchase_price,products_id from {{ ref('stg_raw__sales')}} s
LEFT JOIN {{ ref('stg_raw__product') }} p
ON s.product_id = p.products_id
),

pcost as (

    select
        orders_id,
        date_date,
        revenue,
        quantity,
        purchase_price,
        (quantity* purchase_price) AS purchase_cost

    from ref
    
)
select
orders_id,
date_date,
ROUND(SUM(revenue),2) AS revenue,
ROUND(SUM(quantity),2) AS quantity,
ROUND(SUM(purchase_cost),2) AS purchase_cost,
ROUND(SUM(revenue - purchase_cost),2) AS margin
from pcost
group by orders_id,date_date
order by orders_id DESC