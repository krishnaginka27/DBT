{{
    config(
        materialized='table',
        transient=false,
        query_tag='ptable'
        

    )
}}

select 1 as t