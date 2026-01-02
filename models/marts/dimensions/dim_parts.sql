with 

part as (
    select * from {{ ref('stg_tpch__part') }}
),

final as (
    select
        part_id,
        name as part_name,
        manufacturer,
        brand,
        type,
        size,
        container,
        retail_price
    from part
)

select * from final