with
    fonte_pedidos as(
        select *
        from {{ source('erp','salesorderheader') }}
    )

    , renomeado as (
        select
            cast(SALESORDERID as int) as pk_pedido
            , cast(CUSTOMERID as int) as fk_cliente
            , cast(SHIPTOADDRESSID as int) as fk_endereco
            , cast(CREDITCARDID as int) as fk_cartao
            , cast(ORDERDATE as date) as fk_data_do_pedido
            , cast(STATUS as int) as status_pedido
            -- REVISIONNUMBER
            -- DUEDATE
            -- SHIPDATE
            -- ONLINEORDERFLAG
            -- PURCHASEORDERNUMBER
            -- ACCOUNTNUMBER
            -- SALESPERSONID
            -- TERRITORYID
            -- BILLTOADDRESSID
            -- SHIPMETHODID
            -- CREDITCARDAPPROVALCODE
            -- CURRENCYRATEID
            -- SUBTOTAL
            -- TAXAMT
            -- FREIGHT
            -- TOTALDUE
            -- COMMENT
            -- ROWGUID
            -- MODIFIEDDATE
        from fonte_pedidos
    )

select * 
from renomeado 