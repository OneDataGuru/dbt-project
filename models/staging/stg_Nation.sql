{{
    config(
        materialized='view'
        )
}}

select * from 
{{ source("snowflake_sample","NATION") }}