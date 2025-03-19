{{
    config(
        materialized='incremental'
        
        
    )
}}

select * from {{source('sc1','SALES')}}
{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where ID > (select max(ID) from {{ this }}) 
{% endif %}