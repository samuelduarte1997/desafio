with
    /* Chamada dos modelos necessários*/
    pedidos as (
        select *
        from {{ ref('stg_erp__pedidos') }}
    )

    , detalhe_pedidos as (
        select *
        from {{ ref('stg_erp__detalhe_pedidos') }}
    )

    , motivo as (
        select *
        from {{ ref('stg_erp__motivo') }}
    )

    , joined as (
        select
            detalhe_pedidos.pk_pedido_item
            , detalhe_pedidos.fk_produto
            , pedidos.fk_cliente
            , pedidos.fk_endereco
            , pedidos.fk_cartao
            , detalhe_pedidos.fk_pedido
            , motivo.fk_motivo_1
            , motivo.fk_motivo_2
            , motivo.fk_motivo_3
            , pedidos.fk_data_do_pedido
            , pedidos.status_pedido
            , detalhe_pedidos.quantidade
            , detalhe_pedidos.preco_da_unidade
            , detalhe_pedidos.desconto_da_unidade
        from detalhe_pedidos
        left join pedidos on detalhe_pedidos.fk_pedido = pedidos.pk_pedido
        left join motivo on detalhe_pedidos.fk_pedido = motivo.pk_pedido
    )

, metricas as (
        select
            pk_pedido_item
            , fk_produto
            , fk_cliente
            , fk_endereco
            , fk_cartao
            , fk_pedido
            , fk_motivo_1
            , fk_motivo_2
            , fk_motivo_3
            , fk_data_do_pedido
            , status_pedido
            , quantidade
            , preco_da_unidade
            , desconto_da_unidade
            , preco_da_unidade * quantidade as total_bruto
            , preco_da_unidade * quantidade * (1 - desconto_da_unidade) as total_liquido
        from joined
    )

    select *
    from metricas