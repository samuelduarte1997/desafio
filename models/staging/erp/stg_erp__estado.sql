with
    fonte_estado as(
        select *
        from {{ source('erp','stateprovince') }}
    )

    , renomeado as (
        select
            cast(STATEPROVINCEID as int) as pk_id_estado
            , cast(COUNTRYREGIONCODE as varchar) as fk_id_pais
            , cast(STATEPROVINCECODE as varchar) as sigla_estado
            , cast(NAME as varchar) as nome_estado
            -- ISONLYSTATEPROVINCEFLAG
            -- TERRITORYID
            -- ROWGUID
            -- MODIFIEDDATE
        from fonte_estado
    )

select * 
from renomeado