With 

ref AS (

select quantity,products_id,purchase_price,products_id from {{ ref('stg_raw__sales')}} s
LEFT JOIN {{ ref('stg_raw__product') }} p
ON s.product_id = p.products_id
),

pcost as (

    select
        purchase_price,
        quantity,
        (quantity* purchase_price) AS purchase_cost

    from ref
    
)

select purchase_price,quantity,purchase_cost from pcost