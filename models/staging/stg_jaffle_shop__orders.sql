--imports
WITH orders_import AS (

SELECT *
FROM {{ source('jaffle_shop', 'orders') }}
),

--transformations
renamed AS (
    SELECT
    id AS order_id,
    user_id,
    order_date,
    status,
    _etl_loaded_at
    FROM orders_import
)

--final
SELECT *
FROM renamed