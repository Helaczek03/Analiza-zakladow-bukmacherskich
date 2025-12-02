with
source as (
    select distinct mecz, nazwa_rozgrywek, dyscyplina from {{ ref('core_int_zdarzenia') }}
),

final as (
    select
        row_number() over (order by mecz, nazwa_rozgrywek, dyscyplina) as id,
        *
    from 
        source
)

select * from final