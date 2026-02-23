{% macro insert_audit_columns() %}
    current_timestamp as dbt_updated_at,
    '{{ invocation_id }}' as dbt_run_id
{% endmacro %}
