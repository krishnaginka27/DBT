select * from {{ ref('employee') }}
where salary<0
