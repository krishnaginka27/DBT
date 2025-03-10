{%test captest(m,c) %}

select * From {{ ref('m') }}
where {{c}} !~ '^[A-Z][a-z]*$'

{% endtest %}