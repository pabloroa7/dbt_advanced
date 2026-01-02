with 

nation_raw as (

    select * from {{ source('tpch', 'nation') }}

),

nation as (

    select
        n_nationkey as nation_id,
        n_name as name,
        n_regionkey as region_id,
        n_comment as comment

    from nation_raw

)

select * from nation