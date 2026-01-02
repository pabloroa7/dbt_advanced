--- Un producto no se puede enviar antes de ser pedido

select
    order_id,
    line_number,
    order_date,
    ship_date
from {{ ref('int_sales__order_items') }}
where ship_date < order_date