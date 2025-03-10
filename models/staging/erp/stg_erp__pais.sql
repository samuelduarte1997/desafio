with
    fonte_pais as(
        select *
        from {{ source('erp','countryregion') }}
    )

    , renomeado as (
        select
            cast(COUNTRYREGIONCODE as varchar) as pk_id_pais
            , cast(NAME as varchar) as nome_pais
            -- MODIFIEDDATE
        from fonte_pais
    )

select * 
from renomeado