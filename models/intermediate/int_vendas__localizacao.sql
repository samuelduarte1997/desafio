with
    /* Chamada dos modelos necessários*/
      endereco as (
        select *
        from {{ ref('stg_erp__endereco') }}
    )

    , estado as (
        select *
        from {{ ref('stg_erp__estado') }}
    )

    , pais as (
        select *
        from {{ ref('stg_erp__pais') }}
    )

    , joined as (
        select
            endereco.pk_endereco
            , endereco.nome_endereco
            , endereco.nome_cidade
            , estado.sigla_estado
            , estado.nome_estado
            , pais.nome_pais
        from endereco
        left join estado on endereco.fk_id_estado = estado.pk_id_estado
        left join pais on estado.fk_id_pais = pais.pk_id_pais
    )
    
    select * 
    from joined
