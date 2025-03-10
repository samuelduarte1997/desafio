with
    fonte_cliente as(
        select *
        from {{ source('erp','customer') }}
    )

    , renomeado as (
        select
            cast(CUSTOMERID as int) as pk_cliente
            , cast(PERSONID as int) as fk_pessoa
            -- STOREID
            -- TERRITORYID
            -- ROWGUID
            -- MODIFIEDDATE
        from fonte_cliente
    )

select * 
from renomeado