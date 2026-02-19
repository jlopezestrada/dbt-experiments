-- singular test: orders should have a positive amount.
-- dbt tests fail if the query returns any rows.
-- so we select rows that violate our rule (amount < 0).

select
    order_id,
    amount
from {{ ref('stg_orders') }}
where amount < 0
