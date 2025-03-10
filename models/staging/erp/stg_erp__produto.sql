with
    fonte_produto as(
        select *
        from {{ source('erp','product') }}
    )

    , renomeado as (
        select
            cast(PRODUCTID as int) as pk_produto
            , cast(NAME as varchar) as nome_produto

            -- PRODUCTNUMBER
            -- MAKEFLAG
            -- FINISHEDGOODSFLAG
            -- COLOR
            -- SAFETYSTOCKLEVEL
            -- REORDERPOINT
            -- STANDARDCOST
            -- LISTPRICE
            -- SIZE
            -- SIZEUNITMEASURECODE
            -- WEIGHTUNITMEASURECODE
            -- WEIGHT
            -- DAYSTOMANUFACTURE
            -- PRODUCTLINE
            -- CLASS
            -- STYLE
            -- PRODUCTSUBCATEGORYID
            -- PRODUCTMODELID
            -- SELLSTARTDATE
            -- SELLENDDATE
            -- DISCONTINUEDDATE
            -- ROWGUID
            -- MODIFIEDDATE
        from fonte_produto
    )

select * 
from renomeado