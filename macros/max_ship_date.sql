{% macro get_max_ship_date(column_name='l_shipdate', model_name='stg_LineItem') %}
(select max({{ column_name }}) dt from  {{ ref(model_name) }} )
{% endmacro %}