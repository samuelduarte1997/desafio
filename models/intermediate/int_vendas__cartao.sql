with
    /* Chamada dos modelos necessários*/
      cartao as (
        select *
        from {{ ref('stg_erp__cartao') }}
    )
    
    select * 
    from cartao
