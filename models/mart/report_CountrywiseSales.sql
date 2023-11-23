{{
    config(materialized='table')
}}

select n.N_NAME Country, sum(O.O_TOTALPRICE) Total_Price
from  {{ ref('stg_Orders') }} o
left join {{ ref('stg_Customer') }} c
on o.O_CUSTKEY = c.C_CUSTKEY
left join  {{ ref('stg_Nation') }} n
on c.C_NATIONKEY = n.N_NATIONKEY
group by n.N_NAME