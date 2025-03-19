
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

