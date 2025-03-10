with
    dim_cliente as (
        select *
        from {{ ref('int_vendas__cliente') }}
    )

select *
from dim_cliente