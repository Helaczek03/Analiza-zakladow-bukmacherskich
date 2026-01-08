with
source as (
    select distinct
        nazwa_rozgrywek
    from
        {{ ref('core_zdarzenia') }}
),

final as (
    select
        abs(xxhash64(nazwa_rozgrywek)) as id_nazwy_rozgrywek,
        nazwa_rozgrywek
    from
        source
)

select * from final