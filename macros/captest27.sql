{% test captest27(model, column_name) %}

select * From {{ model }}
where {{column_name}} is not null 

{% endtest %}

{% test captest2w7(model, column_name) %}

select * From {{ model }}
where {{column_name}} is not null 

{% endtest %}


