with
    fonte_cartao as(
        select *
        from {{ source('erp','creditcard') }}
    )

    , renomeado as (
        select
            cast(CREDITCARDID as int) as pk_cartao
            , cast(CARDTYPE as varchar) as tipo_cartao
            -- CARDNUMBER
            -- EXPMONTH
            -- EXPYEAR
            -- MODIFIEDDATE
        from fonte_cartao
    )

select * 
from renomeado