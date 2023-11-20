{{
    config(materialized='table')
}}

select 
*
from {{ source('snowflake_sample','LINEITEM') }}