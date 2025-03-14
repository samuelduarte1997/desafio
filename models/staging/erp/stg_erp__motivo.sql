with
    fonte_motivo as(
        select *
        from {{ source('erp','salesorderheadersalesreason') }}
    )

    , renomeado as (
        select
            cast(SALESORDERID as int) as pk_pedido
            , cast(SALESREASONID as int) as fk_motivo
            -- MODIFIEDDATE
        from fonte_motivo
    )

    , criacao_rn as (
        select
            pk_pedido
            , fk_motivo
            , ROW_NUMBER() OVER (PARTITION BY pk_pedido ORDER BY fk_motivo) AS rn_motivo
        from renomeado 
    )

    , criacao_colunas as (
        select
            pk_pedido
            , MAX(CASE WHEN rn_motivo = 1 THEN fk_motivo END) AS fk_motivo_1
            , MAX(CASE WHEN rn_motivo = 2 THEN fk_motivo END) AS fk_motivo_2
            , MAX(CASE WHEN rn_motivo = 3 THEN fk_motivo END) AS fk_motivo_3
        from criacao_rn
        group by pk_pedido 
    )

    , coluna_mesclada as (
        select
            pk_pedido
            , fk_motivo_1 ||','|| fk_motivo_2 ||','|| fk_motivo_3 as id_motivos
        from criacao_colunas
    )
select * 
from coluna_mesclada

