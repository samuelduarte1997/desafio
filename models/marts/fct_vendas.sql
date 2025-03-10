with
    fct_vendas as (
        select *
        from {{ ref('int_vendas__pedidos') }}
    )

select *
from fct_vendas