with
    fonte_endereco as(
        select *
        from {{ source('erp','address') }}
    )

    , renomeado as (
        select
            cast(ADDRESSID as int) as pk_endereco
            , cast(STATEPROVINCEID as int) as fk_id_estado
            , cast(ADDRESSLINE1 as varchar) as nome_endereco
            , cast(CITY as varchar) as nome_cidade
            -- ADDRESSLINE2
            -- POSTALCODE
            -- SPATIALLOCATION
            -- ROWGUID
            -- MODIFIEDDATE
        from fonte_endereco
    )

select * 
from renomeado