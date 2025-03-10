with
    fonte_pessoa as(
        select *
        from {{ source('erp','person') }}
    )

    , renomeado as (
        select
            cast(BUSINESSENTITYID as int) as pk_pessoa
            , FIRSTNAME || ' ' || LASTNAME as nome_pessoa
            -- PERSONTYPE
            -- NAMESTYLE
            -- TITLE
            -- SUFFIX
            -- EMAILPROMOTION
            -- ADDITIONALCONTACTINFO
            -- DEMOGRAPHICS
            -- ROWGUID
            -- MODIFIEDDATE
        from fonte_pessoa
    )

select * 
from renomeado