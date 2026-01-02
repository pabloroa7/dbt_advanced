with 

sales as (
    select * from {{ ref('int_sales__order_items') }}
),

final as (
    select
        -- Claves
        sales_id,
        order_id,
        line_number,
        customer_id,
        part_id,
        supplier_id,
        
        -- Dimensiones Degeneradas
        order_date,
        ship_date,
        order_status,
        return_flag,
        
        -- Métricas
        quantity,
        extended_price,
        net_sales_amount,
        total_cost_amount,
        gross_margin_amount,
        discount_percentage

    from sales
)

select * from final