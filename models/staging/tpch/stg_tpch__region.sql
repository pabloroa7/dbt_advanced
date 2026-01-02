with 

region_raw as (

    select * from {{ source('tpch', 'region') }}

),

region as (

    select
        r_regionkey as region_id,
        r_name as name,
        r_comment as comment

    from region_raw

)

select * from region