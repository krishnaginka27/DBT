SELECT 
   Employee_ID,
    Name,
    Age,
    Gender,
    Department,
    Job_Title,
    Salary,
    Location,
    Experience_Years,
    Joining_Date
FROM {{source('sc1','ext_employee_data')}}
