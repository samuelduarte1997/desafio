with
    dim_produto as (
        select *
        from {{ ref('int_vendas__produto') }}
    )

select *
from dim_produto