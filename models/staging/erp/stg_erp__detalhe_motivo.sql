with
    fonte_detalhe_motivo as(
        select *
        from {{ source('erp','salesreason') }}
    )

    , renomeado as (
        select
            cast(SALESREASONID as int) as pk_motivo
            , cast(NAME as varchar) as nome_motivo
            , cast (REASONTYPE as varchar) as tipo_motivo
            -- MODIFIEDDATE
        from fonte_detalhe_motivo
    )

select * 
from renomeado