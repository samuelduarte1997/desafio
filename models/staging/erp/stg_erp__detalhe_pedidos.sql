with
    fonte_detalhe_pedidos as(
        select *
        from {{ source('erp','salesorderdetail') }}
    )

    , renomeado as (
        select
            SALESORDERID::varchar || '-' || SALESORDERDETAILID::varchar as pk_pedido_item
            , cast(SALESORDERID as int) as fk_pedido
            , cast(PRODUCTID as int) as fk_produto
            , cast(ORDERQTY as int) as quantidade
            , cast(UNITPRICE as numeric(18,4)) as preco_da_unidade
            , cast(UNITPRICEDISCOUNT as numeric(18,4)) as desconto_da_unidade
            -- CARRIERTRACKINGNUMBER
            -- SPECIALOFFERID
            -- ROWGUID
            -- MODIFIEDDATE
        from fonte_detalhe_pedidos
    )

select * 
from renomeado