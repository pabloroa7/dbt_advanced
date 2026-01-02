with 

supplier as (
    select * from {{ ref('stg_tpch__supplier') }}
),

nation as (
    select * from {{ ref('stg_tpch__nation') }}
),

region as (
    select * from {{ ref('stg_tpch__region') }}
),

final as (
    select
        supplier.supplier_id,
        supplier.name as supplier_name,
        supplier.address,
        supplier.phone,
        supplier.account_balance,
        
        nation.name as nation_name,
        region.name as region_name

    from supplier
    left join nation on supplier.nation_id = nation.nation_id
    left join region on nation.region_id = region.region_id
)

select * from final