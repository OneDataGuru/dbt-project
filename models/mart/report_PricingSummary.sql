select
       l_returnflag,
       l_linestatus,
       sum(l_quantity) as sum_qty,
       sum(l_extendedprice) as sum_base_price,
       sum(l_extendedprice * (1-l_discount)) as sum_disc_price,
       sum(l_extendedprice * (1-l_discount) * (1+l_tax)) as sum_charge,
       avg(l_quantity) as avg_qty,
       avg(l_extendedprice) as avg_price,
       avg(l_discount) as avg_disc,
       count(*) as count_order
 from
       {{ ref("stg_LineItem") }}
{% if var('date_limit') == 'True' -%}
 where
       l_shipdate <= dateadd(day, -90, to_date( {{ get_max_ship_date("l_shipdate","stg_LineItem") }} ))
 {%- endif %}
 group by
       l_returnflag,
       l_linestatus
 order by
       l_returnflag,
       l_linestatus