{{
    config(
        materialized='incremental',
        unique_key='order_id'
    )
}}

with 

orders_raw as (

    select * from {{ source('tpch', 'orders') }}

    {% if is_incremental() %}
        where o_orderdate > (select max(order_date) from {{ this }})
    {% endif %}

),

orders as (

    select
        o_orderkey as order_id,
        o_custkey as customer_id,
        o_orderstatus as order_status,
        o_totalprice as total_price,
        o_orderdate as order_date,
        o_orderpriority as order_priority,
        o_clerk as clerk,
        o_shippriority as ship_priority,
        o_comment as comment

    from orders_raw

)

select * from orders