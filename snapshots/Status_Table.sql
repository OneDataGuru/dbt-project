{% snapshot Status_Table %}

{{
    config(
        unique_key='id',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

select * from {{ source('test_data','Status_Table') }}

{% endsnapshot %}