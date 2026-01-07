{% snapshot snp_tpch_parts %}

{{
    config(
      target_schema='snapshots',
      unique_key='p_partkey',
      
      strategy='check',
      check_cols='all'
    )
}}

select * from {{ source('tpch', 'part') }}

{% endsnapshot %}