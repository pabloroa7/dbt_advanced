select
    order_id,
    order_date
from {{ ref('stg_tpch__orders') }}
where order_date < '1992-01-01'