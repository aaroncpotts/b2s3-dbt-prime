--imports
WITH orders_import AS (

SELECT *
FROM {{ source('jaffle_shop', 'orders') }}
),

--transformations
renamed AS (
    SELECT
    id AS order_id,
    user_id AS customer_id,
    order_date AS order_placed_at,
    status AS order_status,
    case 
        when status not in ('returned','return_pending') 
        then order_date
    end AS valid_order_date,
    _etl_loaded_at
    FROM orders_import
)

--final
SELECT *
FROM renamed