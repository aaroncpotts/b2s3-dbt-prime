--imports
with stripe_source AS (

SELECT *
FROM {{ source('stripe', 'payment') }}
),

--transformations
renamed as (
    SELECT id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    amount,
    created as created_at,
    _batched_at
    from stripe_source
)

--final
select *
from renamed