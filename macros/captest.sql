{%test captest2(model, column_name) %}

select * From {{ ref('model') }}
where {{column_name}} !~ '^[A-Z][a-z]*$'

{% endtest %}