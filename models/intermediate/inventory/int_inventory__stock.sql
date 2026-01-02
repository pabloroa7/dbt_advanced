with 

partsupp as (
    select * from {{ ref('stg_tpch__partsupp') }}
),

final as (
    select
        -- GENERACIÓN DE LA SURROGATE KEY
        {{ dbt_utils.generate_surrogate_key(['part_id', 'supplier_id']) }} as inventory_id,

        -- Claves
        part_id,
        supplier_id,

        -- Métricas directas
        available_quantity,
        supply_cost as unit_cost,

        -- Cálculo del valor total del inventario por proveedor/producto
        {{ total_value('available_quantity', 'supply_cost') }} as total_stock_value

    from partsupp
)

select * from final