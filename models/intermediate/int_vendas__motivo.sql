with
    /* Chamada dos modelos necessários*/
      motivo as (
        select *
        from {{ ref('stg_erp__detalhe_motivo') }}
    )
    
    select * 
    from motivo
