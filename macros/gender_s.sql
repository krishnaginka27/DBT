
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

