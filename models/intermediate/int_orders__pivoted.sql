with payments as (
SELECT * FROM {{ ref('stg_stripe__payment') }}
WHERE payment_status = 'success'),

pivoted as (
    select order_id,
    sum(case when payment_method = 'bank_transfer' THEN payment_amount else 0 END) as bank_transfer_amount,
    sum(case when payment_method = 'coupon' THEN payment_amount else 0 END) as coupon_amount,
    sum(case when payment_method = 'credit_card' THEN payment_amount else 0 END) as credit_card_amount,
    sum(case when payment_method = 'gift_card' THEN payment_amount else 0 END) as gift_card_amount
    from payments
    GROUP BY 1
)

select *
from pivoted