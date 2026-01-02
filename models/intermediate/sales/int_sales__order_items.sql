with 

orders as (
    select * from {{ ref('stg_tpch__orders') }}
),

lineitem as (
    select * from {{ ref('stg_tpch__lineitem') }}
),

partsupp as (
    select 
        part_id, 
        supplier_id, 
        supply_cost 
    from {{ ref('stg_tpch__partsupp') }}
),

joined as (
    select
        -- GENERACIÓN DE LA SURROGATE KEY
        {{ dbt_utils.generate_surrogate_key(['lineitem.order_id', 'lineitem.line_number']) }} as sales_id,

        -- Claves
        lineitem.order_id,
        lineitem.line_number,
        lineitem.part_id,
        lineitem.supplier_id,
        orders.customer_id,
        
        -- Fechas
        orders.order_date,
        lineitem.ship_date,
        
        -- Métricas base
        lineitem.quantity,
        lineitem.extended_price,
        lineitem.discount as discount_percentage,
        partsupp.supply_cost,

        -- Estados
        orders.order_status,
        lineitem.return_flag,
        lineitem.status_code as line_status

    from lineitem
    left join orders 
        on lineitem.order_id = orders.order_id
    left join partsupp
        on lineitem.part_id = partsupp.part_id
        and lineitem.supplier_id = partsupp.supplier_id
),

final as (
    select 
        *,
        
        {{ discounted_amount('extended_price', 'discount_percentage') }} as net_sales_amount,
        
        {{ total_value('quantity', 'supply_cost') }} as total_cost_amount,
        
        ({{ discounted_amount('extended_price', 'discount_percentage') }} - {{ total_value('quantity', 'supply_cost') }}) as gross_margin_amount

    from joined
)

select * from final