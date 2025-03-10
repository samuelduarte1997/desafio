with
    dim_motivo as (
        select *
        from {{ ref('int_vendas__motivo') }}
    )

select *
from dim_motivo