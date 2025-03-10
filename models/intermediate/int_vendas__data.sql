with
    /* Chamada dos modelos necessários*/
      data as (
        select *
        from {{ ref('stg_erp__pedidos') }}
    )
    
    , distinto as (
        select
            distinct data.fk_data_do_pedido as pk_data_do_pedido
        from data
    )

    , ajustes as (
        select
            pk_data_do_pedido
            , DAY(pk_data_do_pedido) as dia_do_pedido
            , MONTH(pk_data_do_pedido) as mes_do_pedido
            , YEAR(pk_data_do_pedido) as ano_do_pedido
        from distinto
    )   

    select * 
    from ajustes
