with source as (
    select * from {{ source('main', 'raw_customers') }}
),

renamed as (
    select
        id as customer_id,
        first_name,
        last_name,
        email,
        signup_date
    from source
)

select * from renamed
