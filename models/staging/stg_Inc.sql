{{
    config(
        materialized='incremental',
        unique_key='id',
        on_schema_change='sync_all_columns'
    )
}}

select * from {{ source('test_data','Inc')}}

{% if is_incremental() %}
where ts > (select max(ts) from {{ this }} )
{% endif %}