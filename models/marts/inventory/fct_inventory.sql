with 

stock as (
    select * from {{ ref('int_inventory__stock') }}
),

final as (
    select
        -- Claves
        inventory_id,
        part_id,
        supplier_id,

        -- Métricas
        available_quantity,
        unit_cost,
        total_stock_value

    from stock
)

select * from final