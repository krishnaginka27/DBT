{{ config(materialized='table') }}

WITH customers AS (
    SELECT * FROM {{ ref('ptable') }}
),
orders AS (
    SELECT * FROM {{ ref('tabletest') }}
)
SELECT 
    *
FROM customers
