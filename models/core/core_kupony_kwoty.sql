with
source as (
    select distinct 
        postawiona_kwota,
        kurs_kuponu,
        status_kuponu,
        wygrana_kwota
    from
        {{ ref('stg_kupony') }}
),

final as (
    select
        row_number() over (order by postawiona_kwota, kurs_kuponu, status_kuponu, wygrana_kwota) as id,
        *
    from source
)

select * from final