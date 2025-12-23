with
source as (
    select distinct 
        kraj_rozgrywek, 
        nazwa_rozgrywek,
        mecz,
        dyscyplina 
    from 
        {{ ref('stg_nowe_zdarzenia') }}
),

nearly_final as (
    select
        kraj_rozgrywek, 
        nazwa_rozgrywek,
        case
            when kraj_rozgrywek = 'Arabia Saudyjska' and nazwa_rozgrywek = 'Saudi Pro League' then '1 liga - Arabia Saudyjska'
            when kraj_rozgrywek = 'Francja' and nazwa_rozgrywek = 'LNH StarLigue' then 'StarLigue'
            when kraj_rozgrywek = 'Międzynarodowe' and nazwa_rozgrywek = 'Puchar EHF' then 'Liga Europejska'
            when kraj_rozgrywek = 'Polska' and nazwa_rozgrywek = 'STS Puchar Polski' then 'Puchar Polski'
            else nazwa_rozgrywek
        end as poprawna_nazwa_rozgrywek,
        mecz,
        dyscyplina
    from
        source
),

final as (
    select distinct
        kraj_rozgrywek,
        nazwa_rozgrywek,
        poprawna_nazwa_rozgrywek
    from 
        nearly_final
    order by kraj_rozgrywek, nazwa_rozgrywek
)

select * from final

-- trzeba polaczyc stare i nowe w slownik