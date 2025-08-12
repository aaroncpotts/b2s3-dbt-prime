--import

WITH successful_payments AS (
    SELECT *
    FROM {{ ref('int_successful_payments') }}
),

--transformations
aggregated AS (
    SELECT
        created_at as date,
        sum(amount) as daily_sales
    FROM successful_payments
    GROUP BY date
    ORDER BY date ASC
)

--final select
SELECT *
FROM aggregated