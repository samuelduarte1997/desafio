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
            , motivo.fk_motivo_1 as fk_motivo_1_1
            , motivo.fk_motivo_2 as fk_motivo_2_1
            , motivo.fk_motivo_3 as fk_motivo_3_1
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
            , fk_motivo_1_1
            , fk_motivo_2_1
            , fk_motivo_3_1
            , fk_data_do_pedido
            , status_pedido
            , quantidade
            , preco_da_unidade
            , desconto_da_unidade
            , preco_da_unidade * quantidade as total_bruto
            , preco_da_unidade * quantidade * (1 - desconto_da_unidade) as total_liquido
        from joined
    )

, casos as (
        select
            pk_pedido_item
            , fk_produto
            , fk_cliente
            , fk_endereco
            , fk_cartao
            , fk_pedido
            , CASE
                WHEN fk_motivo_1 = '1' THEN 'Price'
                WHEN fk_motivo_1 = '2' THEN 'On Promotion'
                WHEN fk_motivo_1 = '3' THEN 'Magazine Advertisement'
                WHEN fk_motivo_1 = '4' THEN 'Television Advertisement'
                WHEN fk_motivo_1 = '5' THEN 'Manufacturer'
                WHEN fk_motivo_1 = '6' THEN 'Review'
                WHEN fk_motivo_1 = '7' THEN 'Demo Event'
                WHEN fk_motivo_1 = '8' THEN 'Sponsorship'
                WHEN fk_motivo_1 = '9' THEN 'Quality'
                WHEN fk_motivo_1 = '10' THEN 'Other'
                ELSE NULL
                END as fk_motivo_1_nome
            , CASE
                WHEN fk_motivo_2 = '1' THEN 'Price'
                WHEN fk_motivo_2 = '2' THEN 'On Promotion'
                WHEN fk_motivo_2 = '3' THEN 'Magazine Advertisement'
                WHEN fk_motivo_2 = '4' THEN 'Television Advertisement'
                WHEN fk_motivo_2 = '5' THEN 'Manufacturer'
                WHEN fk_motivo_2 = '6' THEN 'Review'
                WHEN fk_motivo_2 = '7' THEN 'Demo Event'
                WHEN fk_motivo_2 = '8' THEN 'Sponsorship'
                WHEN fk_motivo_2 = '9' THEN 'Quality'
                WHEN fk_motivo_2 = '10' THEN 'Other'
                ELSE NULL
                END as fk_motivo_2_nome
            , CASE
                WHEN fk_motivo_3 = '1' THEN 'Price'
                WHEN fk_motivo_3 = '2' THEN 'On Promotion'
                WHEN fk_motivo_3 = '3' THEN 'Magazine Advertisement'
                WHEN fk_motivo_3 = '4' THEN 'Television Advertisement'
                WHEN fk_motivo_3 = '5' THEN 'Manufacturer'
                WHEN fk_motivo_3 = '6' THEN 'Review'
                WHEN fk_motivo_3 = '7' THEN 'Demo Event'
                WHEN fk_motivo_3 = '8' THEN 'Sponsorship'
                WHEN fk_motivo_3 = '9' THEN 'Quality'
                WHEN fk_motivo_3 = '10' THEN 'Other'
                ELSE NULL
                END as fk_motivo_3_nome
            , CASE
                WHEN fk_motivo_1_1 = '1' THEN 'Other'
                WHEN fk_motivo_1_1 = '2' THEN 'Promotion'
                WHEN fk_motivo_1_1 = '3' THEN 'Marketing'
                WHEN fk_motivo_1_1 = '4' THEN 'Marketing'
                WHEN fk_motivo_1_1 = '5' THEN 'Other'
                WHEN fk_motivo_1_1 = '6' THEN 'Other'
                WHEN fk_motivo_1_1 = '7' THEN 'Marketing'
                WHEN fk_motivo_1_1 = '8' THEN 'Marketing'
                WHEN fk_motivo_1_1 = '9' THEN 'Other'
                WHEN fk_motivo_1_1 = '10' THEN 'Other'
                ELSE NULL
                END as fk_motivo_1_tipo
            , CASE
                WHEN fk_motivo_2_1 = '1' THEN 'Other'
                WHEN fk_motivo_2_1 = '2' THEN 'Promotion'
                WHEN fk_motivo_2_1 = '3' THEN 'Marketing'
                WHEN fk_motivo_2_1 = '4' THEN 'Marketing'
                WHEN fk_motivo_2_1 = '5' THEN 'Other'
                WHEN fk_motivo_2_1 = '6' THEN 'Other'
                WHEN fk_motivo_2_1 = '7' THEN 'Marketing'
                WHEN fk_motivo_2_1 = '8' THEN 'Marketing'
                WHEN fk_motivo_2_1 = '9' THEN 'Other'
                WHEN fk_motivo_2_1 = '10' THEN 'Other'
                ELSE NULL
                END as fk_motivo_2_tipo
            , CASE
                WHEN fk_motivo_3_1 = '1' THEN 'Other'
                WHEN fk_motivo_3_1 = '2' THEN 'Promotion'
                WHEN fk_motivo_3_1 = '3' THEN 'Marketing'
                WHEN fk_motivo_3_1 = '4' THEN 'Marketing'
                WHEN fk_motivo_3_1 = '5' THEN 'Other'
                WHEN fk_motivo_3_1 = '6' THEN 'Other'
                WHEN fk_motivo_3_1 = '7' THEN 'Marketing'
                WHEN fk_motivo_3_1 = '8' THEN 'Marketing'
                WHEN fk_motivo_3_1 = '9' THEN 'Other'
                WHEN fk_motivo_3_1 = '10' THEN 'Other'
                ELSE NULL
                END as fk_motivo_3_tipo
            , fk_data_do_pedido
            , status_pedido
            , quantidade
            , preco_da_unidade
            , desconto_da_unidade
            , total_bruto
            , total_liquido
        from metricas
    )

, unificacao as (
        select
            pk_pedido_item
            , fk_produto
            , fk_cliente
            , fk_endereco
            , fk_cartao
            , fk_pedido
            , fk_data_do_pedido
            , CASE 
                WHEN fk_motivo_1_nome IS NULL AND fk_motivo_2_nome IS NULL AND fk_motivo_3_nome IS NULL THEN NULL
                ELSE COALESCE(fk_motivo_1_nome, '') ||
                     COALESCE(',' || fk_motivo_2_nome, '') ||
                     COALESCE(',' || fk_motivo_3_nome, '')
                END AS nome_motivo
            , CASE 
                WHEN fk_motivo_1_tipo IS NULL AND fk_motivo_2_tipo IS NULL AND fk_motivo_3_tipo IS NULL THEN NULL
                ELSE COALESCE(fk_motivo_1_tipo, '') ||
                     COALESCE(',' || fk_motivo_2_tipo, '') ||
                     COALESCE(',' || fk_motivo_3_tipo, '')
                END AS tipo_motivo            
            , status_pedido
            , quantidade
            , preco_da_unidade
            , desconto_da_unidade
            , total_bruto
            , total_liquido
        from casos
    )

, ajustes as (
        select
            pk_pedido_item
            , fk_produto
            , fk_cliente
            , fk_endereco
            , fk_cartao
            , fk_pedido
            , fk_data_do_pedido
            , nome_motivo
            , CASE
                WHEN tipo_motivo = 'Other,Other' THEN 'Other'
                WHEN tipo_motivo = 'Other,Other,Other' THEN 'Other'
                WHEN tipo_motivo = 'Other,Other,Promotion' THEN 'Other,Promotion'
                WHEN tipo_motivo = 'Other,Promotion,Other' THEN 'Other,Promotion'
                WHEN tipo_motivo = 'Promotion,Other,Other' THEN 'Promotion,Other'
                WHEN tipo_motivo = 'Other,Other,Marketing' THEN 'Other,Marketing'
                WHEN tipo_motivo = 'Other,Marketing,Other' THEN 'Other,Marketing'
                WHEN tipo_motivo = 'Marketing,Other,Other' THEN 'Marketing,Other'
                WHEN tipo_motivo = 'Marketing,Marketing' THEN 'Marketing'
                WHEN tipo_motivo = 'Marketing,Marketing,Marketing' THEN 'Marketing'
                WHEN tipo_motivo = 'Marketing,Marketing,Other' THEN 'Marketing,Other'
                WHEN tipo_motivo = 'Marketing,Other,Marketing' THEN 'Marketing,Other'
                WHEN tipo_motivo = 'Other,Marketing,Marketing' THEN 'Other,Marketing'
                WHEN tipo_motivo = 'Marketing,Marketing,Promotion' THEN 'Marketing,Promotion'
                WHEN tipo_motivo = 'Marketing,Promotion,Marketing' THEN 'Marketing,Promotion'
                WHEN tipo_motivo = 'Promotion,Marketing,Marketing' THEN 'Promotion,Marketing'
                ELSE tipo_motivo
                end as tipo_motivo
            , status_pedido
            , quantidade
            , preco_da_unidade
            , desconto_da_unidade
            , total_bruto
            , total_liquido
        from unificacao
    )
            
select *
from ajustes