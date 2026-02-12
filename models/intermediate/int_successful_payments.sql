--imports

with payments AS (
SELECT *
FROM {{ ref('stg_stripe__payment') }} ),

--transformations

successful AS (
    SELECT *
    FROM payments
    WHERE payment_status = 'success'
)

--final CTE
SELECT *
FROM successful