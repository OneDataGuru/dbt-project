{% test extended_unique(model, columns) %}
select 
    {% for col in columns -%}
        {% if loop.last -%}
            {{ col }} 
        {% else -%}
            {{ col }},
        {% endif -%}
    {%- endfor %}
from {{ model }}
group by
    {% for col in columns -%}
        {%- if loop.last -%}
            {{ col }} 
        {%- else -%}
            {{ col }},
        {%- endif -%}
    {%- endfor %}
having
    count(*) > 1
{% endtest %}