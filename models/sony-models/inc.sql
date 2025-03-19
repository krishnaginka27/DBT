{{
    config(
        materialized='incremental'
        
        
    )
}}

select * from {{source('xxxx2','employees')}}
{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where EMP_ID > (select max(EMP_ID) from {{ this }}) 
{% endif %}