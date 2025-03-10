with
    dim_data as (
        select *
        from {{ ref('int_vendas__data') }}
    )

select *
from dim_data