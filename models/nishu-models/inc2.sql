{{
    config(
        materialized='incremental',
        unique_key='ID',
        incremental_strategy='merge'
        
        
    )
}}

select * from {{source('sc1','SALES2')}}
{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where DATE(UPDATED_AT) > (select max(DATE(UPDATED_AT)) from {{ this }}) 
{% endif %}
