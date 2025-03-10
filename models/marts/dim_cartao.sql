with
    dim_cartao as (
        select *
        from {{ ref('int_vendas__cartao') }}
    )

select *
from dim_cartao