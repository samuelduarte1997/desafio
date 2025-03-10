with
    /* Chamada dos modelos necessários*/
      produto as (
        select *
        from {{ ref('stg_erp__produto') }}
    )
    
    select * 
    from produto
