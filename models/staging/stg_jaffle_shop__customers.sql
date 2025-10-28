--imports
WITH customers_import AS (

SELECT *
FROM {{ source('jaffle_shop', 'customers') }}
),

--transformations
renamed AS (
    SELECT
    id AS customer_id,
    first_name as customer_first_name,
    last_name as customer_last_name,
    first_name || ' ' || last_name as full_name
    FROM customers_import
)

--final
SELECT *
FROM renamed