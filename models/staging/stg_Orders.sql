{{
    config(materialized = 'view')
}}

with orders as (
    select * 
    from {{ source("snowflake_sample","ORDERS") }}
)
select * 
from orders