
select * from 
{{ 
    source("snowflake_sample","REGION")
}}