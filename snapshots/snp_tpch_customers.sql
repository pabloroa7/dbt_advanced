{% snapshot snp_tpch_customers %}

{{
    config(
      target_schema='snapshots',
      unique_key='c_custkey',
      
      strategy='check',
      check_cols='all'
    )
}}

select * from {{ source('tpch', 'customer') }}

{% endsnapshot %}