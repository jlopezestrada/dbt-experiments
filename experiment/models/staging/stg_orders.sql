with source as (
    select * from {{ source('main', 'raw_orders') }}
),

renamed as (
    select
        id as order_id,
        customer_id,
        order_date,
        status,
        amount,
        {{ insert_audit_columns() }}
    from source
)

select * from renamed
