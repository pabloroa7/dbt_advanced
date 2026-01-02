{% macro discounted_amount(extended_price, discount_percentage, scale=2) %}
    round(
        ( {{ extended_price }} * (1 - {{ discount_percentage }}) ), 
        {{ scale }}
    )
{% endmacro %}

{% macro total_value(quantity, unit_cost, scale=2) %}
    round(
        ( {{quantity}} * {{unit_cost}} ),
        {{ scale }}
    )
{% endmacro %}