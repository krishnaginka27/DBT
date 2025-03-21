with raw as (
    select * from {{ ref('raw_model') }}
),

gen as (
    select 
        Employee_ID,
        Name,
        Age,
        -- Gender transformation
        CASE 
            WHEN UPPER(TRIM(Gender)) = 'MALE' THEN 'M'
            WHEN UPPER(TRIM(Gender)) = 'FEMALE' THEN 'F'
            ELSE Gender
        END as Gender,
        -- Rest of the columns
        Department,
        Job_Title,
        Salary,
        Location,
        Experience_Years
        
    FROM raw
)

select * from gen
where Department='Sales'