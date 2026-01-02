with 

customer as (
    select * from {{ ref('stg_tpch__customer') }}
),

nation as (
    select * from {{ ref('stg_tpch__nation') }}
),

region as (
    select * from {{ ref('stg_tpch__region') }}
),

final as (
    select
        customer.customer_id,
        customer.name as customer_name,
        customer.address,
        customer.phone,
        customer.account_balance,
        customer.market_segment,
        
        nation.name as nation_name,
        region.name as region_name

    from customer
    left join nation on customer.nation_id = nation.nation_id
    left join region on nation.region_id = region.region_id
)

select * from final