select
    sales_id,
    net_sales_amount,
    gross_margin_amount,
    total_cost_amount
from {{ ref('fct_sales') }}
where gross_margin_amount > net_sales_amount