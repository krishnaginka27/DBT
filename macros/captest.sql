{% test captest(model, column_name) %}

select * From {{ ref('model') }}
where {{column_name}} is not null

{% endtest %}

