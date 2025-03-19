-- models/audit_framework.sql
with audit_info as (
    select 
        '{{ this }}' as model_name,
        '{{ this.schema }}' as schema_names,
        '{{ this.identifier }}' as table_name,
         '{{ this.database }}' as db,
          '{{ this.name }}' as namee
        
        current_timestamp as audit_timestamp,
        (select count(*) from {{ this }}) as row_count
)

select * from audit_info