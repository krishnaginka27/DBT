
{% macro gender_trim(cvalues) %}
   
{% if cvalues|lower == 'male' %}
'M'
{% elif cvalues|lower == 'female' %}
'F'
{% else %}
'Others'

{% endif %}

{% endmacro %}

{#---------------------------------------------------------------------#}

{% macro x(v) %}
'hello'
{% endmacro %}

{#---------------------------------------------------------------------#}
{% macro x2(v) %}

'{{v|upper}}'
{% endmacro %}

{#---------------------------------------------------------------------#}

{% macro listtobraq(li) %}

({{ "'" ~ li|join("','") ~ "'" }})

{% endmacro %}


{% macro macro_name(parameter1, parameter2='default_value') %}
    -- Macro logic here
    SELECT {{ parameter1 }} FROM {{ parameter2 }}
{% endmacro %}

{#---------------------------------------------------------------------#}
{% macro used(s) %}

{{ x2(s)}}

{% endmacro %}
{#---------------------------------------------------------------------#}
{% macro get_data2() %}

   {% do return([1,2,3]) %}
  
{% endmacro %}

{#---------------------------------------------------------------------#}

-- Returns a list of the payment_methods in the stg_payments model_
{% set payment_methods = dbt_utils.get_column_values(table=ref('inc2'), column='ID') %}

{% for payment_method in payment_methods %}
    
{% endfor %}

{#---------------------------------macro to create a ff,stage,ext table------------------------------------#}


{% macro create_external_objects(stage_url, aws_role, file_path) %}

{% set create_objects_query %}
BEGIN
    -- Create file format
    CREATE OR REPLACE FILE FORMAT employee_csv_format
        TYPE = 'CSV'
        FIELD_DELIMITER = ','
        SKIP_HEADER = 1
        TRIM_SPACE = TRUE
        NULL_IF = ('NULL', 'null')
        EMPTY_FIELD_AS_NULL = TRUE;

    -- Create stage using passed parameters
    CREATE OR REPLACE STAGE employee_ext_stage
        URL = '{{ stage_url }}'
        STORAGE_INTEGRATION = '{{ aws_role }}'
        FILE_FORMAT = employee_csv_format;

    -- Create external table with file path parameter
    CREATE OR REPLACE EXTERNAL TABLE raw_employee_data (
        Employee_ID VARCHAR AS ($1),
        Name VARCHAR AS ($2),
        Age INTEGER AS ($3),
        Gender VARCHAR AS ($4),
        Department VARCHAR AS ($5),
        Job_Title VARCHAR AS ($6),
        Salary INTEGER AS ($7),
        Location VARCHAR AS ($8),
        Experience_Years INTEGER AS ($9),
        Joining_Date TIMESTAMP AS (TO_TIMESTAMP($10, 'YYYY-MM-DD HH24:MI:SS'))
    )
    WITH LOCATION = '{{ file_path }}'
    AUTO_REFRESH = TRUE
    FILE_FORMAT = employee_csv_format;

    -- Return success message with details
    SELECT 'Successfully created objects with:' ||
           '\nStage URL: ' || '{{ stage_url }}' ||
           '\nAWS Role: ' || '{{ aws_role }}' ||
           '\nFile Path: ' || '{{ file_path }}';

EXCEPTION
    WHEN OTHER THEN
        SELECT SYSTEM$ERROR_MESSAGE();
        RETURN 'Error creating Snowflake objects: ' || SYSTEM$ERROR_MESSAGE();
END;
{% endset %}

{% do run_query(create_objects_query) %}

{% endmacro %}