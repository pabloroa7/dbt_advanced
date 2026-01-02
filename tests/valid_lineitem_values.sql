--- El precio no puede ser negativo
--- La cantidad debe ser al menos 1
--- El descuento y la tasa debe estar entre 0 y 1

select
    order_id,
    line_number,
    extended_price,
    quantity,
    discount
from {{ ref('stg_tpch__lineitem') }}
where
    extended_price < 0
    or quantity <= 0
    or discount < 0
    or discount > 1
    or tax < 0
    or tax > 1