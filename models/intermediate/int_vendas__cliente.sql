with
    /* Chamada dos modelos necessários*/
      cliente as (
        select *
        from {{ ref('stg_erp__cliente') }}
    )

    , pessoa as (
        select *
        from {{ ref('stg_erp__pessoa') }}
    )


    , joined as (
        select
            cliente.pk_cliente
            , pessoa.nome_pessoa
        from pessoa
        left join cliente on pessoa.pk_pessoa = cliente.fk_pessoa
    )

    , remover_nulos as (
        select
            pk_cliente
            , nome_pessoa as nome_cliente
        from joined
        where pk_cliente is not null
    )
    
    select * 
    from remover_nulos

