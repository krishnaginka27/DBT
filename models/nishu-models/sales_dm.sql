select location,Job_Title,avg(Salary) as avg_salary, from {{ ref('stg_model') }}
group by location,Job_Title

