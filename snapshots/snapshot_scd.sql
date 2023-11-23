{% snapshot snapshot_scd %}

{{
    config(
        unique_key='id',

        strategy='check',
        check_cols=['status'],
        invalidate_hard_deletes=True
    )
}}

select * from {{ source('test_data','scd') }}

{% endsnapshot %}